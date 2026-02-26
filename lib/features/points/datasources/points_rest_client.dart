import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/points/entities/mall_product_model.dart';
import 'package:lunchbox/features/points/entities/points_record_model.dart';
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
  Future<ApiResponse<List<MallProductModel>>> getRedemptionItems();

  /// 兑换物品
  @POST('/api/v1/redemption/items/{item_id}')
  Future<ApiResponse<void>> redeemItem(@Path('item_id') String itemId);

  /// 获取当前用户的兑换历史记录
  @GET('/api/v1/redemption/history')
  Future<ApiResponse<List<PointsRecordModel>>> getRedemptionHistory();
}
