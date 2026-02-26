import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/community/entities/community_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'community_rest_client.g.dart';

@Riverpod(keepAlive: true)
CommunityRestClient communityRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return CommunityRestClient(dio);
}

@RestApi()
abstract class CommunityRestClient {
  factory CommunityRestClient(Dio dio, {String baseUrl}) = _CommunityRestClient;

  /// 获取社区群组
  ///
  /// [latitude] 纬度坐标，范围：-90到90。示例：39.9042
  /// [longitude] 经度坐标，范围：-180到180。示例：116.4074
  /// [radius] 搜索半径（公里），默认50公里。示例：50
  @GET('/api/v1/common/community')
  Future<ApiResponse<CommunityModel>> getCommunities({
    @Query('latitude') required double latitude,
    @Query('longitude') required double longitude,
    @Query('radius') double? radius,
  });
}
