import 'package:lunchbox/core/network/response/paginated_response.dart';
import 'package:lunchbox/core/errors/failure.dart';
import 'package:lunchbox/features/cart/entities/cart_item_model.dart';
import 'package:lunchbox/features/order/datasources/order_rest_client.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_repository.g.dart';

@Riverpod(keepAlive: true)
OrderRepository orderRepository(Ref ref) {
  return OrderRepository(ref.watch(orderRestClientProvider));
}

/// 订单仓库类
/// 负责处理订单相关的数据访问 and 业务逻辑
class OrderRepository {
  OrderRepository(this._client);

  final OrderRestClient _client;

  /// 获取用户的订单列表
  Future<PaginatedResponse<OrderModel>> getOrders({
    int page = 1,
    int perPage = 10,
    String? status,
    String? payStatus,
  }) async {
    final response = await _client.getOrders(
      page: page,
      perPage: perPage,
      status: status,
      payStatus: payStatus,
    );
    if (response.success && response.data != null) {
      return response.data!;
    }
    throw Failure.server(message: response.message, statusCode: response.code);
  }

  /// 根据订单ID获取订单详情
  Future<OrderModel> getOrderDetail(String orderId) async {
    final response = await _client.getOrderDetail(orderId);
    if (response.success && response.data != null) {
      return response.data!;
    }
    throw Failure.server(message: response.message, statusCode: response.code);
  }

  /// 取消订单
  Future<void> cancelOrder(String orderId) async {
    final response = await _client.cancelOrderV1(orderId);
    if (response.success) {
      return;
    }
    throw Failure.server(message: response.message, statusCode: response.code);
  }

  /// 确认收货
  Future<void> confirmOrder(String orderId) async {
    final response = await _client.confirmOrder(orderId);
    if (response.success) {
      return;
    }
    throw Failure.server(message: response.message, statusCode: response.code);
  }

  /// 支付订单 (未实现)
  Future<void> payOrder(String orderId, String paymentMethod) async {
    throw const Failure.server(
      message: 'Pay order not implemented',
      statusCode: 501,
    );
  }

  /// 重新下单（基于历史订单）
  Future<List<CartItemModel>> reorder(OrderModel originalOrder) async {
    final cartItems = originalOrder.products.map((orderProduct) {
      return CartItemModel(
        id: '${DateTime.now().millisecondsSinceEpoch}_${orderProduct.id}',
        productId: orderProduct.id.toString(),
        product: orderProduct.toCartProductModel(),
        quantity: orderProduct.quantity,
        deviceId: originalOrder.device?.id.toString(),
        addedTime: DateTime.now(),
      );
    }).toList();

    return cartItems;
  }
}
