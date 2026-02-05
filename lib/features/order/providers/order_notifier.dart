import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/logger_utils.dart';
import '../../cart/providers/cart_notifier.dart';
import '../entities/order_model.dart';
import '../repositories/order_repository.dart';
import 'order_state.dart';

part 'order_notifier.g.dart';

@riverpod
class OrderNotifier extends _$OrderNotifier {
  @override
  OrderState build() {
    Future.microtask(loadOrders);
    return const OrderState();
  }

  Future<void> loadOrders({String? status}) async {
    state = state.copyWith(isLoading: true);
    try {
      final repository = ref.read(orderRepositoryProvider);
      final result = await repository.getUserOrders();

      List<OrderModel> filteredOrders;
      if (status != null && status != 'all') {
        filteredOrders = result
            .where((order) => order.status.name == status)
            .toList();
      } else {
        filteredOrders = result;
      }

      state = state.copyWith(orders: filteredOrders, isLoading: false);
      LoggerUtils.i('OrderNotifier: Loaded ${filteredOrders.length} orders');
    } catch (e) {
      LoggerUtils.e('OrderNotifier: Failed to load orders', e);
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> loadOrderById(String orderId) async {
    state = state.copyWith(isLoading: true);
    try {
      final repository = ref.read(orderRepositoryProvider);
      final order = await repository.getOrderById(orderId);
      state = state.copyWith(selectedOrder: order, isLoading: false);
      LoggerUtils.i('OrderNotifier: Loaded order: ${order.id}');
    } catch (e) {
      LoggerUtils.e('OrderNotifier: Failed to load order', e);
      state = state.copyWith(isLoading: false);
    }
  }

  Future<OrderModel?> createOrder(String deviceId) async {
    state = state.copyWith(isLoading: true);
    try {
      final cartState = ref.read(cartProvider);

      if (cartState.cartItems.isEmpty) {
        state = state.copyWith(isLoading: false);
        return null;
      }

      final repository = ref.read(orderRepositoryProvider);
      final order = await repository.createOrder(
        deviceId: deviceId,
        cartItems: cartState.cartItems,
        paymentMethod: state.selectedPaymentMethod,
      );

      // Clear cart
      await ref.read(cartProvider.notifier).clearCart();

      state = state.copyWith(isLoading: false, selectedOrder: order);
      LoggerUtils.i('OrderNotifier: Order created: ${order.id}');
      return order;
    } catch (e) {
      LoggerUtils.e('OrderNotifier: Failed to create order', e);
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> cancelOrder(String orderId) async {
    try {
      final repository = ref.read(orderRepositoryProvider);
      await repository.cancelOrder(orderId);
      await loadOrders(status: state.selectedStatus);
      LoggerUtils.i('OrderNotifier: Order cancelled: $orderId');
    } catch (e) {
      LoggerUtils.e('OrderNotifier: Failed to cancel order', e);
      rethrow;
    }
  }

  void filterByStatus(String status) {
    state = state.copyWith(selectedStatus: status);
    loadOrders(status: status);
  }

  void refreshOrders() {
    loadOrders(status: state.selectedStatus);
  }

  void selectPaymentMethod(String method) {
    state = state.copyWith(selectedPaymentMethod: method);
  }

  void updateOrderTotal(double total) {
    state = state.copyWith(orderTotal: total);
  }

  // Helpers for UI
  String getStatusText(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return '待支付';
      case OrderStatus.paid:
        return '已支付';
      case OrderStatus.completed:
        return '已完成';
      case OrderStatus.cancelled:
        return '已取消';
      case OrderStatus.refunded:
        return '已退款';
      case OrderStatus.failed:
        return '支付失败';
    }
  }
}
