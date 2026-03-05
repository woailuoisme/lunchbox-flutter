import 'package:lunchbox/core/mixins/async_runner_mixin.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/order/providers/order_state.dart';
import 'package:lunchbox/features/order/repositories/order_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_provider.g.dart';

@riverpod
class OrderNotifier extends _$OrderNotifier with AsyncRunnerMixin<OrderState> {
  @override
  OrderState build() {
    return const OrderState();
  }

  OrderRepository get _repository => ref.read(orderRepositoryProvider);

  Future<List<OrderModel>> fetchOrdersPage({
    required int page,
    int pageSize = 10,
    String? status,
  }) async {
    return runAsync(
      () async {
        final data = await _repository.getOrders(
          page: page,
          perPage: pageSize,
          status: status,
        );
        final items = data?.items ?? [];
        return items;
      },
      showLoading: false,
      errorLabel: 'Failed to load orders page',
    ).then((value) => value ?? []);
  }

  Future<void> loadOrders({String? status}) async {
    await runAsync(() async {
      final data = await _repository.getOrders(status: status);
      if (data != null) {
        state = state.copyWith(orders: data.items);
        LoggerUtils.i('OrderNotifier: Loaded ${data.items.length} orders');
      }
    }, errorLabel: 'Failed to load orders');
  }

  Future<OrderModel?> loadOrderById(String orderId) async {
    return await runAsync<OrderModel?>(() async {
      final order = await _repository.getOrderDetail(orderId);
      if (order != null) {
        state = state.copyWith(selectedOrder: order);
        LoggerUtils.i('OrderNotifier: Loaded order: ${order.id}');
      }
      return order;
    }, errorLabel: 'Failed to load order');
  }

  Future<OrderModel?> createOrder(String deviceId) async {
    final cartState = ref.read(cartProvider);
    if (cartState.cartItems.isEmpty) return null;

    throw Exception('Order creation not implemented');
  }

  Future<bool> cancelOrder(String orderId) async {
    final success = await runAsync(
      () => _repository.cancelOrder(orderId),
      showLoading: false,
    );
    if (success == true) {
      await loadOrders(status: state.selectedStatus);
      LoggerUtils.i('OrderNotifier: Order cancelled: $orderId');
    }
    return success ?? false;
  }

  Future<void> payOrder(String orderId, String paymentMethod) async {
    await runAsync(() => _repository.payOrder(orderId, paymentMethod));
    await loadOrders(status: state.selectedStatus);
    final updatedOrder = await loadOrderById(orderId);
    if (updatedOrder != null && state.selectedOrder?.id.toString() == orderId) {
      // state already updated in loadOrderById
    }
    LoggerUtils.i('OrderNotifier: Order paid: $orderId');
  }

  Future<void> reorder(String orderId) async {
    await runAsync(() async {
      final order = await _repository.getOrderDetail(orderId);
      if (order == null) return;
      final cartItems = await _repository.reorder(order);

      final cartNotifier = ref.read(cartProvider.notifier);
      for (final item in cartItems) {
        await cartNotifier.addCartProductToCart(
          item.product,
          quantity: item.quantity,
        );
      }
      LoggerUtils.i('OrderNotifier: Reordered items from order: $orderId');
    }, errorLabel: 'Failed to reorder');
  }

  void filterByStatus(String status) {
    state = state.copyWith(selectedStatus: status);
    loadOrders(status: status);
  }

  void refreshOrders() => loadOrders(status: state.selectedStatus);

  void selectPaymentMethod(String method) {
    state = state.copyWith(selectedPaymentMethod: method);
  }

  void updateOrderTotal(double total) {
    state = state.copyWith(orderTotal: total);
  }
}
