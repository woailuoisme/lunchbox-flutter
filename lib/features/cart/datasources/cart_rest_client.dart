import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/cart/entities/cart_item_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_rest_client.g.dart';

@Riverpod(keepAlive: true)
CartRestClient cartRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return CartRestClient(dio);
}

@RestApi()
abstract class CartRestClient {
  factory CartRestClient(Dio dio, {String baseUrl}) = _CartRestClient;

  /// 获取购物车商品列表
  @GET('/api/v1/user/cart')
  Future<ApiResponse<List<CartItemModel>>> getCartItems();

  /// 添加商品到购物车
  @POST('/api/v1/user/cart/add')
  Future<ApiResponse<CartItemModel>> addToCart(
    @Body() Map<String, dynamic> body,
  );

  /// 更新购物车
  @POST('/api/v1/user/cart/update_cart')
  Future<ApiResponse<CartItemModel>> updateCart(
    @Body() Map<String, dynamic> body,
  );

  /// 更新购物车商品数量
  @POST('/api/v1/user/cart/quantity')
  Future<ApiResponse<CartItemModel>> updateQuantity(
    @Body() Map<String, dynamic> body,
  );

  /// 清空购物车
  @DELETE('/api/v1/user/cart/clear')
  Future<ApiResponse<void>> clearCart();
}
