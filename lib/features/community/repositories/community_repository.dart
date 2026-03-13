import 'package:lunchbox/features/community/datasources/community_rest_client.dart';
import 'package:lunchbox/features/community/entities/community_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'community_repository.g.dart';

@Riverpod(keepAlive: true)
CommunityRepository communityRepository(Ref ref) {
  return CommunityRepository(ref.watch(communityRestClientProvider));
}

class CommunityRepository {
  CommunityRepository(this._client);
  final CommunityRestClient _client;

  /// 获取社群信息
  Future<CommunityModel?> getCommunity({
    required double latitude,
    required double longitude,
    double? radius,
  }) async {
    final response = await _client.getCommunities(
      latitude: latitude,
      longitude: longitude,
      radius: radius,
    );
    return response.data;
  }
}
