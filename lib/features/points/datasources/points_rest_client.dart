import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/core/network/response/paginated_response.dart';
import 'package:lunchbox/features/points/entities/mall_product_response.dart';
import 'package:lunchbox/features/points/entities/points_record_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'points_rest_client.g.dart';

@Riverpod(keepAlive: true)
PointsRestClient pointsRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return PointsRestClient(dio);
}

@RestApi()
abstract class PointsRestClient {
  factory PointsRestClient(Dio dio, {String baseUrl}) = _PointsRestClient;

  /// 获取所有可兑换的物品列表
  @GET('/api/v1/redemption/items')
  Future<ApiResponse<PaginatedResponse<MallProductResponse>>>
  getRedemptionItems({@Query('page') int? page, @Query('type') String? type});

  /// 兑换物品
  @POST('/api/v1/redemption/redeem/{id}')
  Future<ApiResponse<dynamic>> redeemItem(@Path('id') int id);

  /// 获取当前用户的兑换历史记录
  @GET('/api/v1/redemption/history')
  Future<ApiResponse<PaginatedResponse<PointsRecordResponse>>>
  getRedemptionHistory({@Query('page') int? page, @Query('type') String? type});
}
