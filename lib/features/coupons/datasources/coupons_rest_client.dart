import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/coupons/entities/coupon_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coupons_rest_client.g.dart';

@Riverpod(keepAlive: true)
CouponsRestClient couponsRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return CouponsRestClient(dio);
}

@RestApi()
abstract class CouponsRestClient {
  factory CouponsRestClient(Dio dio, {String baseUrl}) = _CouponsRestClient;

  /// 获取优惠券列表
  ///
  /// [category] 优惠券分类筛选 (shop: 商城, goods: 食品)
  /// [type] 优惠券类型筛选 (full_reduction: 满减券, discount: 折扣券, reduction: 减免)
  @GET('/api/v1/home/coupons')
  Future<ApiResponse<List<CouponModel>>> getCoupons({
    @Query('category') String? category,
    @Query('type') String? type,
  });

  /// 领取优惠券
  ///
  /// [couponId] 优惠券ID
  @POST('/api/v1/user/catch_coupon')
  Future<ApiResponse<void>> catchCoupon({
    @Field('coupon_id') required int couponId,
  });
}
