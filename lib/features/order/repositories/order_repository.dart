import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lunchbox/core/errors/errors.dart';
import 'package:lunchbox/core/network/network.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:lunchbox/features/order/repositories/simulated_order_repository.dart';

part 'order_repository.g.dart';

@Riverpod(keepAlive: true)
OrderRepository orderRepository(Ref ref) {
  // Use simulated repository for UI development without backend
  return SimulatedOrderRepository();
}

/// 订单仓库类
/// 负责处理订单相关的数据访问和业务逻辑
class OrderRepository {
  OrderRepository(this._client);

  final RestClient _client;

  /// 创建订单
  TaskEither<Failure, OrderModel> createOrder({
    required String deviceId,
    required List<CartItemModel> cartItems,
    required String paymentMethod,
    String? remark,
  }) {
    return TaskEither.tryCatch(() async {
      final orderData = <String, dynamic>{
        'deviceId': deviceId,
        'items': cartItems
            .map(
              (item) => <String, dynamic>{
                'productId': item.productId,
                'quantity': item.quantity,
                'price': item.product.price,
              },
            )
            .toList(),
        'paymentMethod': paymentMethod,
        'remark': remark,
        'totalAmount': cartItems.fold<double>(
          0,
          (total, item) => total + item.totalPrice,
        ),
      };

      final response = await _client.createOrder(orderData);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 获取用户的订单列表
  TaskEither<Failure, List<OrderModel>> getUserOrders({
    int page = 1,
    int pageSize = 10,
    String? status,
  }) {
    return TaskEither.tryCatch(() async {
      final params = {'page': page, 'pageSize': pageSize, 'status': status};
      final response = await _client.getUserOrders(params);
      if (response.success && response.data != null) {
        return response.data!.items;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 根据订单ID获取订单详情
  TaskEither<Failure, OrderModel> getOrderById(String orderId) {
    return TaskEither.tryCatch(() async {
      final response = await _client.getOrderById(orderId);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 取消订单
  TaskEither<Failure, bool> cancelOrder(String orderId) {
    return TaskEither.tryCatch(() async {
      final response = await _client.cancelOrder(orderId);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 支付订单
  TaskEither<Failure, Map<String, dynamic>> payOrder(
    String orderId,
    String paymentMethod,
  ) {
    return TaskEither.tryCatch(() async {
      final response = await _client.payOrder(orderId, {
        'paymentMethod': paymentMethod,
      });
      if (response.success && response.data != null) {
        return response.data! as Map<String, dynamic>;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 查询订单支付状态
  TaskEither<Failure, String> checkPaymentStatus(
    String orderId,
    String paymentId,
  ) {
    return TaskEither.tryCatch(() async {
      final response = await _client.checkPaymentStatus(orderId, paymentId);
      if (response.success && response.data != null) {
        final data = response.data! as Map<String, dynamic>;
        return data['status'] as String;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 获取设备的订单统计
  TaskEither<Failure, Map<String, dynamic>> getDeviceOrderStatistics(
    String deviceId,
  ) {
    return TaskEither.tryCatch(() async {
      final response = await _client.getDeviceOrderStatistics(deviceId);
      if (response.success && response.data != null) {
        return response.data! as Map<String, dynamic>;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 重新下单（基于历史订单）
  TaskEither<Failure, OrderModel> reorder(String orderId) {
    return getOrderById(orderId).flatMap((originalOrder) {
      // 构建购物车项
      final cartItems = originalOrder.items
          .map(
            (item) => CartItemModel(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              productId: item.productId,
              product: item.product,
              quantity: item.quantity,
              deviceId: originalOrder.deviceId,
              addedTime: DateTime.now(),
            ),
          )
          .toList();

      // 创建新订单
      return createOrder(
        deviceId: originalOrder.deviceId,
        cartItems: cartItems,
        paymentMethod: originalOrder.paymentMethod == PaymentMethod.wechatPay
            ? 'wechat'
            : 'alipay',
        remark: originalOrder.remark,
      );
    });
  }

  Failure _handleError(Object error, StackTrace stackTrace) {
    if (error is DioException) {
      return Failure.network(
        message: error.message ?? 'Unknown network error',
        statusCode: error.response?.statusCode,
      );
    }
    return Failure.server(message: error.toString(), statusCode: 500);
  }
}
