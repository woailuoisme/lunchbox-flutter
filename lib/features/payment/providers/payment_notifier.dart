import 'dart:async';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/logger_utils.dart';
import '../../order/entities/order_model.dart';
import '../../order/repositories/order_repository.dart';
import '../repositories/payment_repository.dart';
import 'payment_state.dart';

part 'payment_notifier.g.dart';

@riverpod
class PaymentNotifier extends _$PaymentNotifier {
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
    startCountdown();
    await initializePaymentSheet();
  }

  /// 初始化支付面板
  Future<void> initializePaymentSheet() async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);

      if (state.order == null) {
        return;
      }

      final paymentRepo = ref.read(paymentRepositoryProvider);
      // 使用 CNY 作为默认货币，实际应根据业务需求调整
      final data = await paymentRepo.createPaymentIntent(
        state.order!.id,
        state.order!.totalAmount,
        'CNY',
      );

      // 设置 Stripe publishableKey
      if (data['publishableKey'] != null) {
        Stripe.publishableKey = data['publishableKey'] as String;
      }

      // 初始化 Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Lunchbox App',
          paymentIntentClientSecret: data['paymentIntent'] as String?,
          customerEphemeralKeySecret: data['ephemeralKey'] as String?,
          customerId: data['customer'] as String?,
          // 如果有需要，可以配置 applePay, googlePay 等
        ),
      );

      state = state.copyWith(isPaymentSheetReady: true, isLoading: false);
      LoggerUtils.i('PaymentNotifier: Payment sheet initialized');
    } catch (e) {
      LoggerUtils.e('PaymentNotifier: Failed to initialize payment sheet', e);
      state = state.copyWith(isLoading: false, errorMessage: '支付初始化失败: $e');
    }
  }

  /// 显示支付面板并支付
  Future<void> presentPaymentSheet() async {
    try {
      if (!state.isPaymentSheetReady) {
        await initializePaymentSheet();
        if (!state.isPaymentSheetReady) {
          return;
        }
      }

      await Stripe.instance.presentPaymentSheet();

      LoggerUtils.i('PaymentNotifier: Payment completed via Stripe');

      // 支付成功，更新订单状态
      // 实际项目中可能需要通过后端 webhook 确认，这里主动查询一次
      await checkPaymentStatus();
    } on StripeException catch (e) {
      LoggerUtils.e('PaymentNotifier: Stripe payment error', e);
      if (e.error.code == FailureCode.Canceled) {
        // 用户取消支付，不做处理
        return;
      }
      state = state.copyWith(errorMessage: '支付失败: ${e.error.localizedMessage}');
    } catch (e) {
      LoggerUtils.e('PaymentNotifier: Unexpected payment error', e);
      state = state.copyWith(errorMessage: '支付发生错误: $e');
    }
  }

  /// 检查支付状态
  Future<void> checkPaymentStatus() async {
    if (state.order == null) {
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final orderRepository = ref.read(orderRepositoryProvider);
      final updatedOrder = await orderRepository.getOrderById(state.order!.id);

      state = state.copyWith(order: updatedOrder, isLoading: false);

      // 如果订单状态已更新为已支付，UI 层会相应处理
    } catch (e) {
      LoggerUtils.e('PaymentNotifier: Failed to check payment status', e);
      state = state.copyWith(isLoading: false);
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

  /// 取消支付
  Future<void> cancelPayment() async {
    try {
      _countdownTimer?.cancel();

      if (state.order != null) {
        final orderRepository = ref.read(orderRepositoryProvider);
        await orderRepository.cancelOrder(state.order!.id);
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
