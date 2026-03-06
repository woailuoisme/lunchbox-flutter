import 'dart:async';

import 'package:flutter_stripe/flutter_stripe.dart';
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
  PaymentState build(double amount) {
    // 延迟执行副作用
    Future.microtask(_init);

    return const PaymentState();
  }

  Future<void> _init() async {
    await initializePaymentSheet();
    // 初始化完成后，自动弹出支付面板
    if (state.isPaymentSheetReady && !state.isLoading) {
      await presentPaymentSheet();
    }
  }

  /// 初始化支付面板
  Future<void> initializePaymentSheet() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final paymentRepo = ref.read(paymentRepositoryProvider);

      // 不再手动指定支付方式，让后端通过 automatic_payment_methods: true 来控制
      final data = await paymentRepo.createPaymentIntent(
        amount: amount,
        currency: 'CNY',
      );

      // 设置 Stripe publishableKey (从环境变量获取)
      Stripe.publishableKey = AppEnvConfig.current.stripePublishableKey;

      // 获取当前主题状态以适配支付面板样式
      final themeState = ref.read(themeProvider);

      // 初始化 Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Lunchbox',
          paymentIntentClientSecret: data?.clientSecret,
          customerId: data?.customerId,

          // 自动适配深色/浅色模式 (跟随应用主题)
          style: themeState.mode,

          // 支持多种支付方式 (支付宝/微信等)
          allowsDelayedPaymentMethods: true,

          // 支付成功后的重定向 URL
          returnURL: 'lunchbox://stripe-redirect',
        ),
      );

      state = state.copyWith(
        isPaymentSheetReady: true,
        paymentIntent: data,
        isLoading: false,
      );
      LoggerUtils.i('PaymentNotifier: Payment sheet initialized');
    } catch (e, stack) {
      LoggerUtils.e('Initialize payment sheet failed', e, stack);
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  /// 展示支付面板
  Future<void> presentPaymentSheet() async {
    if (!state.isPaymentSheetReady) {
      return;
    }

    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      isPaymentCanceled: false,
    );
    try {
      await Stripe.instance.presentPaymentSheet();

      state = state.copyWith(isPaymentSuccessful: true, isLoading: false);
      LoggerUtils.i('PaymentNotifier: Payment successful');
    } catch (e, stack) {
      // 如果用户取消支付
      if (e is StripeException && e.error.code == FailureCode.Canceled) {
        state = state.copyWith(isLoading: false, isPaymentCanceled: true);
        return;
      }

      LoggerUtils.e('Payment failed', e, stack);
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}
