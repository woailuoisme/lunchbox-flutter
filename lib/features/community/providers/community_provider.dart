import 'package:lunchbox/core/services/location_service.dart';
import 'package:lunchbox/features/community/entities/community_model.dart';
import 'package:lunchbox/features/community/repositories/community_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'community_provider.g.dart';

@riverpod
class CommunityNotifier extends _$CommunityNotifier {
  @override
  FutureOr<CommunityModel?> build() async {
    return _fetchCommunity();
  }

  Future<CommunityModel?> _fetchCommunity() async {
    final locationService = ref.read(locationServiceProvider);
    final repository = ref.read(communityRepositoryProvider);

    // 获取位置，如果失败则使用默认位置（例如深圳）
    final position = await locationService.getCurrentPosition();

    final lat = position?.latitude ?? 22.5431;
    final lng = position?.longitude ?? 114.0579;

    return await repository.getCommunity(latitude: lat, longitude: lng);
  }

  /// 刷新社群信息
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchCommunity());
  }
}
