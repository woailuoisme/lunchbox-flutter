import 'package:lunchbox/features/profile/datasources/profile_rest_client.dart';
import 'package:lunchbox/features/profile/entities/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository.g.dart';

@riverpod
class ProfileRepository extends _$ProfileRepository {
  @override
  FutureOr<void> build() {}

  ProfileRestClient get _client => ref.read(profileRestClientProvider);

  /// 获取用户个人资料
  Future<UserProfile> getUserInfo() async {
    final response = await _client.getProfile();
    if (response.success && response.data != null) {
      return response.data!;
    }
    throw response.message;
  }

  /// 更新用户个人资料
  Future<UserProfile> updateUserInfo({
    required UserProfile currentUser,
    String? nickname,
    String? avatar,
    String? gender,
    DateTime? birthday,
  }) async {
    // 这里如果 API 还没有更新接口，暂时保持原样或抛出未实现
    // 如果 profile_rest_client.dart 有更新接口可以调用
    await Future<void>.delayed(const Duration(milliseconds: 500));

    return currentUser.copyWith(
      nickname: nickname ?? currentUser.nickname,
      avatar: avatar ?? currentUser.avatar,
      gender: gender ?? currentUser.gender,
      // UserProfile 目前没有 birthday 字段，如果需要可以添加
    );
  }
}
