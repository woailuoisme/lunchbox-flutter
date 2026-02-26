import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_rest_client.g.dart';

@Riverpod(keepAlive: true)
OrderRestClient orderRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return OrderRestClient(dio);
}

@RestApi()
abstract class OrderRestClient {
  factory OrderRestClient(Dio dio, {String baseUrl}) = _OrderRestClient;

  /// 获取用户订单列表
  @GET('/api/v1/user/orders')
  Future<ApiResponse<List<OrderModel>>> getOrders({
    @Query('page') int? page,
    @Query('size') int? size,
    @Query('status') String? status,
  });

  /// 获取订单详情
  @GET('/api/v1/user/orders/{order}')
  Future<ApiResponse<OrderModel>> getOrderDetail(@Path('order') String orderId);

  /// 取消订单
  @DELETE('/api/v1/user/orders/cancel/{id}')
  Future<ApiResponse<void>> cancelOrder(@Path('id') String id);

  /// 确认收货
  @POST('/api/v1/user/orders/confirm/{id}')
  Future<ApiResponse<void>> confirmOrder(@Path('id') String id);
}
