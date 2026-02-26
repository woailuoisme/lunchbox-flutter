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
  @GET('/api/v1/home/coupons')
  Future<ApiResponse<List<CouponModel>>> getCoupons({
    @Query('type') String? type,
  });
}
