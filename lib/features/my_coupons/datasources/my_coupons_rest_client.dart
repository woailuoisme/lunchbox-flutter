import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/coupons/entities/coupon_model.dart';
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
  @GET('/api/v1/user/coupons')
  Future<ApiResponse<List<CouponModel>>> getUserCoupons({
    @Query('status') int? status, // 0:未使用, 1:已使用, 2:已过期
  });
}
