import 'package:lunchbox/core/errors/failure_extensions.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/cart/providers/cart_notifier.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/order/providers/order_state.dart';
import 'package:lunchbox/features/order/repositories/order_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    final repository = ref.read(orderRepositoryProvider);
    final result = await repository.getUserOrders().run();

    result.fold(
      (failure) {
        LoggerUtils.e('OrderNotifier: Failed to load orders', failure);
        state = state.copyWith(isLoading: false);
      },
      (data) {
        List<OrderModel> filteredOrders;
        if (status != null && status != 'all') {
          filteredOrders = data
              .where((order) => order.status.name == status)
              .toList();
        } else {
          filteredOrders = data;
        }

        state = state.copyWith(orders: filteredOrders, isLoading: false);
        LoggerUtils.i('OrderNotifier: Loaded ${filteredOrders.length} orders');
      },
    );
  }

  Future<void> loadOrderById(String orderId) async {
    state = state.copyWith(isLoading: true);
    final repository = ref.read(orderRepositoryProvider);
    final result = await repository.getOrderById(orderId).run();

    result.fold(
      (failure) {
        LoggerUtils.e('OrderNotifier: Failed to load order', failure);
        state = state.copyWith(isLoading: false);
      },
      (order) {
        state = state.copyWith(selectedOrder: order, isLoading: false);
        LoggerUtils.i('OrderNotifier: Loaded order: ${order.id}');
      },
    );
  }

  Future<OrderModel?> createOrder(String deviceId) async {
    state = state.copyWith(isLoading: true);
    final cartState = ref.read(cartProvider);

    if (cartState.cartItems.isEmpty) {
      state = state.copyWith(isLoading: false);
      return null;
    }

    final repository = ref.read(orderRepositoryProvider);
    final result = await repository
        .createOrder(
          deviceId: deviceId,
          cartItems: cartState.cartItems,
          paymentMethod: state.selectedPaymentMethod,
        )
        .run();

    return result.fold(
      (failure) {
        LoggerUtils.e('OrderNotifier: Failed to create order', failure);
        state = state.copyWith(isLoading: false);
        // Throwing exception to be handled by UI
        throw Exception(failure.toUserMessage());
      },
      (order) async {
        // Clear cart
        await ref.read(cartProvider.notifier).clearCart();

        state = state.copyWith(isLoading: false, selectedOrder: order);
        LoggerUtils.i('OrderNotifier: Order created: ${order.id}');
        return order;
      },
    );
  }

  Future<void> cancelOrder(String orderId) async {
    final repository = ref.read(orderRepositoryProvider);
    final result = await repository.cancelOrder(orderId).run();

    result.fold(
      (failure) {
        LoggerUtils.e('OrderNotifier: Failed to cancel order', failure);
        throw Exception(failure.toUserMessage());
      },
      (_) async {
        await loadOrders(status: state.selectedStatus);
        LoggerUtils.i('OrderNotifier: Order cancelled: $orderId');
      },
    );
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
