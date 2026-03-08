import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/auth/auth.dart';
import 'package:lunchbox/features/profile/entities/user_profile.dart';
import 'package:lunchbox/features/profile/providers/profile_state.dart';
import 'package:lunchbox/features/profile/repositories/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  FutureOr<ProfileState> build() async {
    final user = await loadUserInfo();
    return ProfileState(currentUser: user);
  }

  /// 加载用户信息
  Future<UserProfile?> loadUserInfo() async {
    try {
      LoggerUtils.i('ProfileNotifier: Loading user info');
      // 注意：这里 repositoryProvider 本身也是一个 AsyncNotifierProvider
      final repository = ref.read(profileRepositoryProvider.notifier);
      return await repository.getUserInfo();
    } catch (e, stack) {
      LoggerUtils.e('ProfileNotifier: Failed to load user info', e, stack);
      return null;
    }
  }

  /// 更新用户信息
  Future<void> updateUserInfo({
    String? nickname,
    String? avatar,
    String? gender,
    DateTime? birthday,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final currentUser = state.value?.currentUser;
      if (currentUser == null) throw Exception('User not logged in');

      final repository = ref.read(profileRepositoryProvider.notifier);
      final updatedUser = await repository.updateUserInfo(
        currentUser: currentUser,
        nickname: nickname,
        avatar: avatar,
        gender: gender,
        birthday: birthday,
      );

      LoggerUtils.i('ProfileNotifier: User info updated');
      return state.value!.copyWith(currentUser: updatedUser);
    });
  }

  /// 登出
  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(authProvider.notifier).logout();
      LoggerUtils.i('ProfileNotifier: User logged out');
      return const ProfileState(currentUser: null);
    });
  }
}
