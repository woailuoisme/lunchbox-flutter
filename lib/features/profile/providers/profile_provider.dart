import 'package:lunchbox/core/mixins/async_runner_mixin.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/auth/auth.dart';
import 'package:lunchbox/features/profile/providers/profile_state.dart';
import 'package:lunchbox/features/profile/repositories/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier
    with AsyncRunnerMixin<ProfileState> {
  static const String _keyFavoriteDevices = 'favorite_devices';

  @override
  ProfileState build() {
    // 异步初始化
    Future.microtask(_init);
    return const ProfileState();
  }

  Future<void> _init() async {
    await loadUserInfo();
  }

  /// 加载用户信息
  Future<void> loadUserInfo() async {
    await runAsync(() async {
      LoggerUtils.i(
        'ProfileNotifier: Loading user info from Profile Repository',
      );
      final repository = ref.read(profileRepositoryProvider.notifier);
      final user = await repository.getUserInfo();

      state = state.copyWith(currentUser: user);
      LoggerUtils.i('ProfileNotifier: User info loaded successfully');
    }, errorLabel: '加载用户信息失败');
  }

  /// 更新用户信息
  Future<void> updateUserInfo({
    String? nickname,
    String? avatar,
    String? gender,
    DateTime? birthday,
  }) async {
    await runAsync(() async {
      if (state.currentUser == null) {
        return;
      }

      final repository = ref.read(profileRepositoryProvider.notifier);
      final updatedUser = await repository.updateUserInfo(
        currentUser: state.currentUser!,
        nickname: nickname,
        avatar: avatar,
        gender: gender,
        birthday: birthday,
      );

      state = state.copyWith(currentUser: updatedUser);
      LoggerUtils.i('ProfileNotifier: User info updated');
    }, errorLabel: '更新用户信息失败');
  }

  /// 登出
  Future<void> logout() async {
    await runAsync(() async {
      // 1. 调用 AuthProvider 的登出逻辑（API 登出 + 清除本地存储）
      await ref.read(authProvider.notifier).logout();
      // 2. 清除个人资料状态
      state = state.copyWith(currentUser: null);
      LoggerUtils.i('ProfileNotifier: User logged out');
    }, errorLabel: '登出失败');
  }
}
