import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/core/network/response/paginated_response.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/order/entities/order_review_response.dart';
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
  /// [status] 订单状态筛选 (pending:待支付, paid:已支付, used:已使用, cancelled:已取消, refund:退款中, completed:已完成)
  /// [payStatus] 支付状态筛选 (unpaid:未支付, paid:已支付, refunded:已退款)
  /// [perPage] 每页数量，默认10
  /// [page] 当前页码，从1开始
  @GET('/api/v1/user/orders')
  Future<ApiResponse<PaginatedResponse<OrderModel>>> getOrders({
    @Query('status') String? status,
    @Query('pay_status') String? payStatus,
    @Query('per_page') int? perPage,
    @Query('page') int? page,
  });

  /// 获取订单详情
  @GET('/api/v1/user/orders/{order}')
  Future<ApiResponse<OrderModel>> getOrderDetail(@Path('order') String orderId);

  /// 取消订单 (v1)
  @DELETE('/api/v1/user/orders/cancel/{id}')
  Future<ApiResponse<void>> cancelOrderV1(@Path('id') String id);

  /// 确认收货
  @POST('/api/v1/user/orders/confirm/{id}')
  Future<ApiResponse<void>> confirmOrder(@Path('id') String id);

  /// 添加商品评价
  /// [orderId] 订单ID
  /// [productId] 商品ID
  /// [content] 评价内容
  /// [rating] 评分 (1-5分)
  /// [images] 评价图片
  @POST('/api/v1/user/add_product_review')
  @MultiPart()
  Future<ApiResponse<OrderReviewResponse>> addProductReview({
    @Part(name: 'order_id') required int orderId,
    @Part(name: 'product_id') required int productId,
    @Part(name: 'content') required String content,
    @Part(name: 'rating') required int rating,
    @Part(name: 'images[]') List<MultipartFile>? images,
  });
}
