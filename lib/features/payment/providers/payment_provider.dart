import 'dart:async';

import 'package:flutter_stripe/flutter_stripe.dart' hide PaymentMethod;
import 'package:lunchbox/core/env/app_env.dart';
import 'package:lunchbox/core/theme/theme_provider.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/payment/providers/payment_state.dart';
import 'package:lunchbox/features/payment/repositories/payment_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_provider.g.dart';

@riverpod
class PaymentNotifier extends _$PaymentNotifier {
  @override
  FutureOr<PaymentState> build(double amount) {
    return const PaymentState();
  }

  /// 切换支付方式
  void selectPaymentMethod(PaymentMethod method) {
    if (state.value == null) return;

    state = AsyncData(state.value!.copyWith(selectedMethod: method));

    if (method == PaymentMethod.stripe && !state.value!.isPaymentSheetReady) {
      initializePaymentSheet();
    }
  }

  /// 处理支付提交
  Future<void> submitPayment() async {
    final current = state.value;
    if (current == null || state.isLoading) return;

    if (current.selectedMethod == PaymentMethod.stripe) {
      if (!current.isPaymentSheetReady) {
        await initializePaymentSheet();
      }
      if (state.value?.isPaymentSheetReady ?? false) {
        await presentPaymentSheet();
      }
    } else {
      await _payWithBalance();
    }
  }

  /// 余额支付逻辑
  Future<void> _payWithBalance() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await Future<void>.delayed(const Duration(seconds: 1));
      LoggerUtils.i('PaymentNotifier: Balance payment successful');
      return state.value!.copyWith(isPaymentSuccessful: true);
    });
  }

  /// 初始化支付面板
  Future<void> initializePaymentSheet() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final paymentRepo = ref.read(paymentRepositoryProvider);

      final data = await paymentRepo.createPaymentIntent(
        amount: amount,
        currency: 'cny',
      );

      Stripe.publishableKey = AppEnvConfig.current.stripePublishableKey;
      final themeState = ref.read(themeProvider);

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Lunchbox',
          paymentIntentClientSecret: data?.clientSecret,
          customerId: data?.customerId,
          style: themeState.mode,
          allowsDelayedPaymentMethods: true,
          returnURL: 'lunchbox://stripe-redirect',
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'US',
            testEnv: true,
          ),
        ),
      );

      LoggerUtils.i('PaymentNotifier: Payment sheet initialized');
      return state.value!.copyWith(
        isPaymentSheetReady: true,
        paymentIntent: data,
      );
    });
  }

  /// 展示支付面板
  Future<void> presentPaymentSheet() async {
    if (state.value == null || !state.value!.isPaymentSheetReady) {
      return;
    }

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      try {
        await Stripe.instance.presentPaymentSheet();
        LoggerUtils.i('PaymentNotifier: Payment successful');
        return state.value!.copyWith(isPaymentSuccessful: true);
      } catch (e) {
        if (e is StripeException && e.error.code == FailureCode.Canceled) {
          return state.value!.copyWith(isPaymentCanceled: true);
        }
        rethrow;
      }
    });
  }
}
