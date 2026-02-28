import 'package:lunchbox/features/auth/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  bool build() {
    final repo = ref.watch(authRepositoryProvider);
    return repo.isLoggedIn();
  }

  Future<void> login(String username, String password) async {
    final repo = ref.read(authRepositoryProvider);
    await repo.login(username: username, password: password);
    _setAuthenticated(true);
  }

  Future<void> register(
    String username,
    String password,
    String nickname,
  ) async {
    final repo = ref.read(authRepositoryProvider);
    await repo.register(
      username: username,
      password: password,
      nickname: nickname,
    );
    _setAuthenticated(true);
  }

  Future<void> loginWithPhone(String phone, String code) async {
    final repo = ref.read(authRepositoryProvider);
    await repo.loginWithPhone(phone: phone, code: code);
    _setAuthenticated(true);
  }

  Future<void> loginWithGoogle() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.loginWithGoogle();
    _setAuthenticated(true);
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.logout();
    _setAuthenticated(false);
  }

  /// 处理未授权（401）情况
  ///
  /// 当拦截器检测到 401 错误时调用，同步清除本地 Token 并触发路由重定向
  Future<void> handleUnauthorized() async {
    final repo = ref.read(authRepositoryProvider);
    // 仅清除本地 Token，保留其他用户信息（如手机号、配置等）
    await repo.clearToken();
    // 更新认证状态为 false，触发 GoRouter 重定向
    _setAuthenticated(false);
  }

  void _setAuthenticated(bool value) {
    if (state == value) {
      return;
    }
    state = value;
  }
}
