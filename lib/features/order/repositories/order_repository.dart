import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/core/network/response/paginated_response.dart';
import 'package:lunchbox/core/errors/errors.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/order/datasources/order_rest_client.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:lunchbox/core/errors/repository_error_handler_mixin.dart';

part 'order_repository.g.dart';

@Riverpod(keepAlive: true)
OrderRepository orderRepository(Ref ref) {
  return OrderRepository(ref.watch(orderRestClientProvider));
}

/// 订单仓库类
/// 负责处理订单相关的数据访问 and 业务逻辑
class OrderRepository with RepositoryErrorHandlerMixin {
  OrderRepository(this._client);

  final OrderRestClient _client;

  /// 获取用户的订单列表
  Future<PaginatedResponse<OrderModel>> getOrders({
    int page = 1,
    int perPage = 10,
    String? status,
    String? payStatus,
  }) async {
    try {
      final response = await _client.getOrders(
        page: page,
        perPage: perPage,
        status: status,
        payStatus: payStatus,
      );
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }

  /// 根据订单ID获取订单详情
  Future<OrderModel> getOrderDetail(String orderId) async {
    try {
      final response = await _client.getOrderDetail(orderId);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }

  /// 取消订单
  Future<void> cancelOrder(String orderId) async {
    try {
      final response = await _client.cancelOrderV1(orderId);
      if (response.success) {
        return;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }

  /// 确认收货
  Future<void> confirmOrder(String orderId) async {
    try {
      final response = await _client.confirmOrder(orderId);
      if (response.success) {
        return;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
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
    try {
      final cartItems = originalOrder.products.map((product) {
        return CartItemModel(
          id: '${DateTime.now().millisecondsSinceEpoch}_${product.id}',
          productId: product.id.toString(),
          product: ProductModel(
            id: product.id.toString(),
            name: product.name,
            category: product.category,
            imageUrl: product.thumb,
            description: product.description,
            price: double.tryParse(product.salePrice) ?? 0.0,
            updateTime: DateTime.now(),
          ),
          quantity: product.quantity,
          deviceId: originalOrder.device?.id.toString(),
          addedTime: DateTime.now(),
        );
      }).toList();

      return cartItems;
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }
}
