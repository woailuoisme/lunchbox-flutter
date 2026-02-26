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
  @GET('/api/v1/common/community')
  Future<ApiResponse<List<CommunityModel>>> getCommunities();
}
