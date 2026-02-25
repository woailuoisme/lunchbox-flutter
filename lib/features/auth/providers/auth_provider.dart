import 'package:lunchbox/core/errors/app_exception.dart';
import 'package:lunchbox/core/errors/failure.dart';
import 'package:lunchbox/core/errors/failure_extensions.dart';
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
    final result = await repo
        .login(username: username, password: password)
        .run();
    result.fold(_handleFailure, (_) => _setAuthenticated(true));
  }

  Future<void> register(
    String username,
    String password,
    String nickname,
  ) async {
    final repo = ref.read(authRepositoryProvider);
    final result = await repo
        .register(username: username, password: password, nickname: nickname)
        .run();

    result.fold(_handleFailure, (_) => _setAuthenticated(true));
  }

  Future<void> loginWithPhone(String phone, String code) async {
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.loginWithPhone(phone: phone, code: code).run();
    result.fold(_handleFailure, (_) => _setAuthenticated(true));
  }

  Future<void> loginWithGoogle() async {
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.loginWithGoogle().run();
    result.fold(_handleFailure, (_) => _setAuthenticated(true));
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.logout().run();
    result.fold(_handleFailure, (_) => _setAuthenticated(false));
  }

  Never _handleFailure(Failure failure) {
    throw AppException(failure.toUserMessage());
  }

  void _setAuthenticated(bool value) {
    if (state == value) {
      return;
    }
    state = value;
  }
}
