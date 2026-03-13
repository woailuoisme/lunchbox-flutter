import 'package:dio/dio.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/order/entities/order_review_response.dart';
import 'package:lunchbox/features/order/providers/order_state.dart';
import 'package:lunchbox/features/order/repositories/order_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_provider.g.dart';

@riverpod
class OrderNotifier extends _$OrderNotifier {
  @override
  FutureOr<OrderState> build() {
    // 初始状态为空，由 UI 的 PagingController 驱动加载
    return const OrderState();
  }

  OrderRepository get _repository => ref.read(orderRepositoryProvider);

  /// 提交商品评价
  Future<OrderReviewResponse?> addProductReview({
    required int orderId,
    required int productId,
    required String content,
    required int rating,
    List<MultipartFile>? images,
  }) async {
    try {
      final response = await _repository.addProductReview(
        orderId: orderId,
        productId: productId,
        content: content,
        rating: rating,
        images: images,
      );
      LoggerUtils.i('OrderNotifier: Product review submitted: $productId');
      return response;
    } catch (e, stack) {
      LoggerUtils.e('OrderNotifier: Failed to submit product review', e, stack);
      rethrow;
    }
  }

  Future<List<OrderModel>> fetchOrdersPage({
    required int page,
    int pageSize = 10,
    String? status,
  }) async {
    try {
      final data = await _repository.getOrders(
        page: page,
        perPage: pageSize,
        status: status,
      );
      return data?.items ?? [];
    } catch (e, stack) {
      LoggerUtils.e('OrderNotifier: Failed to fetch orders page', e, stack);
      return [];
    }
  }

  Future<void> loadOrders({String? status}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final effectiveStatus = status ?? state.value?.selectedStatus ?? 'all';
      final data = await _repository.getOrders(
        status: effectiveStatus == 'all' ? null : effectiveStatus,
      );
      return (state.value ?? const OrderState()).copyWith(
        orders: data?.items ?? [],
        selectedStatus: effectiveStatus,
      );
    });
  }

  Future<OrderModel?> loadOrderById(String orderId) async {
    try {
      final order = await _repository.getOrderDetail(orderId);
      if (order != null) {
        state = await AsyncValue.guard(() async {
          return state.value!.copyWith(selectedOrder: order);
        });
      }
      return order;
    } catch (e, stack) {
      LoggerUtils.e('OrderNotifier: Failed to load order', e, stack);
      return null;
    }
  }

  Future<bool> cancelOrder(String orderId) async {
    try {
      final success = await _repository.cancelOrder(orderId);
      if (success == true) {
        await loadOrders(status: state.value?.selectedStatus);
        LoggerUtils.i('OrderNotifier: Order cancelled: $orderId');
        return true;
      }
    } catch (e, stack) {
      LoggerUtils.e('OrderNotifier: Failed to cancel order', e, stack);
    }
    return false;
  }

  Future<bool> confirmOrder(String orderId) async {
    try {
      final success = await _repository.confirmOrder(orderId);
      if (success == true) {
        await loadOrders(status: state.value?.selectedStatus);
        LoggerUtils.i('OrderNotifier: Order confirmed: $orderId');
        return true;
      }
    } catch (e, stack) {
      LoggerUtils.e('OrderNotifier: Failed to confirm order', e, stack);
    }
    return false;
  }

  Future<void> payOrder(String orderId, String paymentMethod) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repository.payOrder(orderId, paymentMethod);
      final data = await _repository.getOrders(
        status: state.value?.selectedStatus,
      );
      final order = await _repository.getOrderDetail(orderId);
      LoggerUtils.i('OrderNotifier: Order paid: $orderId');
      return state.value!.copyWith(
        orders: data?.items ?? [],
        selectedOrder: order,
      );
    });
  }

  Future<void> reorder(String orderId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final order = await _repository.getOrderDetail(orderId);
      if (order != null) {
        final cartItems = await _repository.reorder(order);
        final cartNotifier = ref.read(cartProvider.notifier);
        for (final item in cartItems) {
          await cartNotifier.addCartProductToCart(
            item.product,
            quantity: item.quantity,
          );
        }
        LoggerUtils.i('OrderNotifier: Reordered items from order: $orderId');
      }
      return state.value!;
    });
  }

  void filterByStatus(String status) {
    loadOrders(status: status);
  }

  void refreshOrders() => loadOrders(status: state.value?.selectedStatus);

  void selectPaymentMethod(String method) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(selectedPaymentMethod: method));
  }

  void updateOrderTotal(double total) {
    if (state.value == null) return;
    state = AsyncData(state.value!.copyWith(orderTotal: total));
  }
}
