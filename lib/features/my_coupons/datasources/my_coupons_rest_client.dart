import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/my_coupons/entities/user_coupon_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_coupons_rest_client.g.dart';

@Riverpod(keepAlive: true)
MyCouponsRestClient myCouponsRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return MyCouponsRestClient(dio);
}

@RestApi()
abstract class MyCouponsRestClient {
  factory MyCouponsRestClient(Dio dio, {String baseUrl}) = _MyCouponsRestClient;

  /// 获取用户优惠券列表
  ///
  /// [category] 优惠券分类筛选 (shop: 商城, goods: 食品)
  /// [type] 优惠券类型筛选 (full_reduction: 满减券, discount: 折扣券, exchange: N元购券, gift: 赠品券)
  /// [usedType] 使用状态筛选 (active: 可用, inactive: 已使用, expired: 已过期)
  @GET('/api/v1/user/coupons')
  Future<ApiResponse<List<UserCouponModel>>> getUserCoupons({
    @Query('category') String? category,
    @Query('type') String? type,
    @Query('used_type') String? usedType,
  });
}
