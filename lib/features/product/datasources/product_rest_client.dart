import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/core/network/response/paginated_response.dart';
import 'package:lunchbox/features/product/entities/product_daily_limit_model.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/features/product/entities/product_review_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_rest_client.g.dart';

@Riverpod(keepAlive: true)
ProductRestClient productRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ProductRestClient(dio);
}

@RestApi()
abstract class ProductRestClient {
  factory ProductRestClient(Dio dio, {String baseUrl}) = _ProductRestClient;

  /// 获取用户当日产品购买限制信息
  @GET('/api/v1/home/product_daily_limit')
  Future<ApiResponse<ProductDailyLimitModel>> getProductDailyLimit();

  /// 获取指定设备的所有商品
  @GET('/api/v1/home/device_products')
  Future<ApiResponse<List<ProductModel>>> getDeviceProducts({
    @Query('device_id') String? deviceId,
  });

  /// 获取商品详情
  @GET('/api/v1/home/products/{product_id}')
  Future<ApiResponse<ProductModel>> getProductDetail(
    @Path('product_id') String productId,
  );

  /// 获取商品评价
  @GET('/api/v1/home/product_reviews')
  Future<ApiResponse<List<ProductReviewModel>>> getProductReviews({
    @Query('product_id') String? productId,
    @Query('page') int? page,
    @Query('size') int? size,
  });

  /// 获取设备的所有产品列表
  @GET('/api/devices/{deviceId}/products')
  Future<ApiResponse<PaginatedResponse<ProductModel>>> getProductsByDeviceId(
    @Path('deviceId') String deviceId,
  );

  /// 根据产品ID获取产品详情
  @GET('/api/products/{id}')
  Future<ApiResponse<ProductModel>> getProductById(@Path('id') String id);

  /// 更新产品库存
  @POST('/api/devices/{deviceId}/products/{productId}/stock')
  Future<ApiResponse<bool>> updateProductStock(
    @Path('deviceId') String deviceId,
    @Path('productId') String productId,
    @Body() Map<String, dynamic> body,
  );

  /// 批量获取产品
  @POST('/api/products/batch')
  Future<ApiResponse<List<ProductModel>>> getProductsBatch(
    @Body() Map<String, dynamic> body,
  );
}
