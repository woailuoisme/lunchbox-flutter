import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/core/network/response/paginated_response.dart';
import 'package:lunchbox/features/auth/auth.dart';
import 'package:lunchbox/features/device/device.dart';
import 'package:lunchbox/features/order/order.dart';
import 'package:lunchbox/features/product/product.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rest_client.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return RestClient(dio);
}

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // ===========================================================================
  // Auth & User
  // ===========================================================================

  @POST('/api/auth/login')
  Future<ApiResponse<dynamic>> login(@Body() Map<String, dynamic> body);

  @POST('/api/auth/register')
  Future<ApiResponse<dynamic>> register(@Body() Map<String, dynamic> body);

  @POST('/api/auth/logout')
  Future<ApiResponse<void>> logout();

  @GET('/api/users/profile')
  Future<ApiResponse<UserModel>> getUserProfile();

  @PUT('/api/users/profile')
  Future<ApiResponse<UserModel>> updateUserProfile(
    @Body() Map<String, dynamic> body,
  );

  @PUT('/api/users/password')
  Future<ApiResponse<bool>> changePassword(@Body() Map<String, dynamic> body);

  @POST('/api/auth/refresh')
  Future<ApiResponse<dynamic>> refreshToken(@Body() Map<String, dynamic> body);

  @POST('/api/auth/send-code')
  Future<ApiResponse<void>> sendVerificationCode(
    @Body() Map<String, dynamic> body,
  );

  @POST('/api/auth/verify-code')
  Future<ApiResponse<dynamic>> verifyCode(@Body() Map<String, dynamic> body);

  @POST('/api/users/favorite-devices')
  Future<ApiResponse<bool>> addFavoriteDevice(
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/api/users/favorite-devices/{deviceId}')
  Future<ApiResponse<bool>> removeFavoriteDevice(
    @Path('deviceId') String deviceId,
  );

  // ===========================================================================
  // City
  // ===========================================================================

  @GET('/api/cities')
  Future<ApiResponse<PaginatedResponse<CityModel>>> getCities();

  @GET('/api/cities/{id}')
  Future<ApiResponse<CityModel>> getCityById(@Path('id') String id);

  // ===========================================================================
  // Device
  // ===========================================================================

  @GET('/api/devices')
  Future<ApiResponse<PaginatedResponse<DeviceModel>>> getDevices();

  @GET('/api/devices/city/{cityId}')
  Future<ApiResponse<PaginatedResponse<DeviceModel>>> getDevicesByCity(
    @Path('cityId') String cityId,
  );

  @GET('/api/devices/{id}')
  Future<ApiResponse<DeviceModel>> getDeviceById(@Path('id') String id);

  @GET('/api/devices/{id}/status')
  Future<ApiResponse<DeviceModel>> getDeviceStatus(@Path('id') String id);

  @GET('/api/devices/{id}/statistics')
  Future<ApiResponse<dynamic>> getDeviceStatistics(@Path('id') String id);

  @GET('/api/devices/{deviceId}/orders/statistics')
  Future<ApiResponse<dynamic>> getDeviceOrderStatistics(
    @Path('deviceId') String deviceId,
  );

  // ===========================================================================
  // Product
  // ===========================================================================

  @GET('/api/devices/{deviceId}/products')
  Future<ApiResponse<PaginatedResponse<ProductModel>>> getProductsByDeviceId(
    @Path('deviceId') String deviceId,
  );

  @GET('/api/products/{id}')
  Future<ApiResponse<ProductModel>> getProductById(@Path('id') String id);

  @POST('/api/devices/{deviceId}/products/{productId}/stock')
  Future<ApiResponse<bool>> updateProductStock(
    @Path('deviceId') String deviceId,
    @Path('productId') String productId,
    @Body() Map<String, dynamic> body,
  );

  @POST('/api/products/batch')
  Future<ApiResponse<List<ProductModel>>> getProductsBatch(
    @Body() Map<String, dynamic> body,
  );

  // ===========================================================================
  // Order
  // ===========================================================================

  @POST('/api/orders')
  Future<ApiResponse<OrderModel>> createOrder(
    @Body() Map<String, dynamic> body,
  );

  @GET('/api/orders')
  Future<ApiResponse<PaginatedResponse<OrderModel>>> getUserOrders(
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/api/orders/{id}')
  Future<ApiResponse<OrderModel>> getOrderById(@Path('id') String id);

  @PUT('/api/orders/{id}/cancel')
  Future<ApiResponse<bool>> cancelOrder(@Path('id') String id);

  @POST('/api/orders/{id}/pay')
  Future<ApiResponse<dynamic>> payOrder(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @GET('/api/orders/{id}/payment/status')
  Future<ApiResponse<dynamic>> checkPaymentStatus(
    @Path('id') String id,
    @Query('paymentId') String? paymentId,
  );

  @POST('/api/orders/{id}/payment/intent')
  Future<ApiResponse<dynamic>> createPaymentIntent(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @POST('/api/orders/{id}/payment/cancel')
  Future<ApiResponse<bool>> cancelPayment(@Path('id') String id);

  // ===========================================================================
  // Home
  // ===========================================================================
}
