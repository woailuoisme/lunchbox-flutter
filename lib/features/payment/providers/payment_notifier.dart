import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/logger_utils.dart';
import '../../order/entities/order_model.dart';
import '../../order/repositories/order_repository.dart';
import 'payment_state.dart';

part 'payment_notifier.g.dart';

@riverpod
class PaymentNotifier extends _$PaymentNotifier {
  Timer? _pollingTimer;
  Timer? _countdownTimer;

  @override
  PaymentState build(OrderModel order) {
    // 初始化
    ref.onDispose(() {
      _pollingTimer?.cancel();
      _countdownTimer?.cancel();
    });

    // 延迟执行副作用
    Future.microtask(_init);

    return PaymentState(order: order);
  }

  void _init() {
    generatePaymentQrCode();
    startPaymentPolling();
    startCountdown();
  }

  /// 生成支付二维码
  Future<void> generatePaymentQrCode() async {
    try {
      state = state.copyWith(isLoading: true);

      if (state.order == null) return;

      final paymentMethod = state.order!.paymentMethod;
      final orderId = state.order!.id;
      final amount = state.order!.totalAmount;

      String qrCode = '';
      if (paymentMethod == PaymentMethod.wechatPay) {
        qrCode = 'weixin://wxpay/bizpayurl?pr=$orderId&amount=$amount';
      } else if (paymentMethod == PaymentMethod.alipay) {
        qrCode =
            'alipays://platformapi/startapp?appId=20000067&orderNo=$orderId&amount=$amount';
      }

      state = state.copyWith(paymentQrCode: qrCode);
      LoggerUtils.i('PaymentNotifier: QR code generated');
    } catch (e) {
      LoggerUtils.e('PaymentNotifier: Failed to generate QR code', e);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// 开始支付状态轮询
  void startPaymentPolling() {
    if (state.order == null) return;

    state = state.copyWith(isPolling: true);

    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await checkPaymentStatus();
    });

    LoggerUtils.i('PaymentNotifier: Payment polling started');
  }

  /// 停止支付状态轮询
  void stopPaymentPolling() {
    _pollingTimer?.cancel();
    state = state.copyWith(isPolling: false);
    LoggerUtils.i('PaymentNotifier: Payment polling stopped');
  }

  /// 检查支付状态
  Future<void> checkPaymentStatus() async {
    if (state.order == null) return;

    try {
      final orderRepository = ref.read(orderRepositoryProvider);
      final updatedOrder = await orderRepository.getOrderById(state.order!.id);

      if (updatedOrder.status == OrderStatus.paid) {
        stopPaymentPolling();
        _countdownTimer?.cancel();
        state = state.copyWith(order: updatedOrder);
        // UI层应该监听 order 状态的变化来决定是否跳转
      }
    } catch (e) {
      LoggerUtils.e('PaymentNotifier: Failed to check payment status', e);
    }
  }

  /// 开始倒计时
  void startCountdown() {
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.countdown > 0) {
        state = state.copyWith(countdown: state.countdown - 1);
      } else {
        stopPaymentPolling();
        timer.cancel();
      }
    });
  }

  /// 取消支付
  Future<void> cancelPayment() async {
    try {
      stopPaymentPolling();
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
