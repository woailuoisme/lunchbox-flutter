import 'package:lunchbox/features/auth/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  FutureOr<bool> build() {
    final repo = ref.watch(authRepositoryProvider);
    return repo.isLoggedIn();
  }

  Future<void> login(String username, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      await repo.login(username: username, password: password);
      return true;
    });
  }

  Future<void> register({
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      await repo.register(
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      return true;
    });
  }

  Future<void> loginWithGoogle() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      await repo.loginWithGoogle();
      return true;
    });
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.logout();
    state = const AsyncValue.data(false);
  }

  /// 处理未授权（401）情况
  ///
  /// 当拦截器检测到 401 错误时调用，同步清除本地 Token 并触发路由重定向
  Future<void> handleUnauthorized() async {
    final repo = ref.read(authRepositoryProvider);
    // 仅清除本地 Token，保留其他用户信息（如手机号、配置等）
    await repo.clearToken();
    // 更新认证状态为 false，触发 GoRouter 重定向
    state = const AsyncValue.data(false);
  }
}
