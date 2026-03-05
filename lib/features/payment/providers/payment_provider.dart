import 'dart:async';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:lunchbox/core/env/app_env.dart';
import 'package:lunchbox/core/mixins/async_runner_mixin.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/order/providers/order_provider.dart';
import 'package:lunchbox/features/payment/providers/payment_state.dart';
import 'package:lunchbox/features/payment/repositories/payment_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_provider.g.dart';

@riverpod
class PaymentNotifier extends _$PaymentNotifier
    with AsyncRunnerMixin<PaymentState> {
  Timer? _countdownTimer;

  @override
  PaymentState build(OrderModel order) {
    // 初始化
    ref.onDispose(() {
      _countdownTimer?.cancel();
    });

    // 延迟执行副作用
    Future.microtask(_init);

    return PaymentState(order: order);
  }

  Future<void> _init() async {
    // 确保 provider 仍然有效
    if (ref.exists(paymentProvider(order))) {
      startCountdown();
      await initializePaymentSheet();
      // 初始化完成后，自动弹出支付面板
      if (state.isPaymentSheetReady && !state.isLoading) {
        await presentPaymentSheet();
      }
    }
  }

  /// 初始化支付面板
  Future<void> initializePaymentSheet() async {
    // 如果已经 dispose，则不再执行
    if (!ref.exists(paymentProvider(order))) {
      return;
    }

    await runAsync(() async {
      if (state.order == null) {
        return;
      }

      final paymentRepo = ref.read(paymentRepositoryProvider);
      // 使用 CNY 作为默认货币，实际应根据业务需求调整
      final data = await paymentRepo.createPaymentIntent(
        orderId: state.order!.id,
        amount: state.order!.totalAmount,
        currency: 'CNY',
      );

      // 再次检查是否 dispose
      if (!ref.exists(paymentProvider(order))) {
        return;
      }

      // 设置 Stripe publishableKey (从环境变量获取)
      Stripe.publishableKey = AppEnvConfig.current.stripePublishableKey;

      // 初始化 Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Lunchbox App',
          paymentIntentClientSecret: data?.clientSecret,
          // 注意：如果以后需要支持保存支付卡，可以通过 createSetupIntent 获取 ephemeralKey
          // customerEphemeralKeySecret: data?.ephemeralKey,
          customerId: data?.customerId,
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'CN',
            currencyCode: 'CNY',
            testEnv: true,
          ),
        ),
      );

      if (!ref.exists(paymentProvider(order))) {
        return;
      }

      state = state.copyWith(isPaymentSheetReady: true, paymentIntent: data);
      LoggerUtils.i('PaymentNotifier: Payment sheet initialized');
    }, errorLabel: 'Initialize payment sheet failed');
  }

  /// 展示支付面板
  Future<void> presentPaymentSheet() async {
    if (!state.isPaymentSheetReady) {
      return;
    }

    await runAsync(() async {
      await Stripe.instance.presentPaymentSheet();

      if (!ref.exists(paymentProvider(order))) {
        return;
      }

      if (!ref.exists(paymentProvider(order))) {
        return;
      }

      // 支付成功，更新订单状态 (通过 OrderNotifier 集中处理)
      final orderNotifier = ref.read(orderProvider.notifier);
      await orderNotifier.payOrder(state.order!.id.toString(), 'stripe');

      if (!ref.exists(paymentProvider(order))) {
        return;
      }

      // 刷新本地 order 状态
      final updatedOrder = await orderNotifier.loadOrderById(
        state.order!.id.toString(),
      );
      state = state.copyWith(
        isPaymentSuccessful: true,
        order: updatedOrder ?? state.order,
      );

      _countdownTimer?.cancel();
      LoggerUtils.i('PaymentNotifier: Payment successful');
    }, errorLabel: 'Present payment sheet failed');
  }

  Future<void> checkPaymentStatus() async {
    if (state.order == null) {
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final orderNotifier = ref.read(orderProvider.notifier);
      final updatedOrder = await orderNotifier.loadOrderById(
        state.order!.id.toString(),
      );

      state = state.copyWith(
        order: updatedOrder ?? state.order,
        isLoading: false,
      );
    } catch (failure) {
      LoggerUtils.e('PaymentNotifier: Failed to check payment status', failure);
      state = state.copyWith(
        isLoading: false,
        errorMessage: '检查支付状态失败: ${failure.toString()}',
      );
    }
  }

  /// 开始倒计时
  void startCountdown() {
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.countdown > 0) {
        state = state.copyWith(countdown: state.countdown - 1);
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> cancelPayment() async {
    try {
      _countdownTimer?.cancel();

      if (state.order != null) {
        final orderNotifier = ref.read(orderProvider.notifier);
        await orderNotifier.cancelOrder(state.order!.id.toString());
      }
    } catch (e) {
      LoggerUtils.e('PaymentNotifier: Failed to cancel order', e);
      rethrow;
    }
  }

  /// 获取倒计时显示文本
  String get countdownText {
    final minutes = state.countdown ~/ 60;
    final seconds = state.countdown % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
