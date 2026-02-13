import 'package:lunchbox/core/errors/app_exception.dart';
import 'package:lunchbox/core/errors/failure_extensions.dart';
import 'package:lunchbox/features/auth/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

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
    result.fold(
      (failure) => throw AppException(failure.toUserMessage()),
      (data) => state = true,
    );
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

    result.fold(
      (failure) => throw AppException(failure.toUserMessage()),
      (data) => state = true,
    );
  }

  Future<void> loginWithPhone(String phone, String code) async {
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.loginWithPhone(phone: phone, code: code).run();
    result.fold(
      (failure) => throw AppException(failure.toUserMessage()),
      (data) => state = true,
    );
  }

  Future<void> loginWithGoogle() async {
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.loginWithGoogle().run();
    result.fold(
      (failure) => throw AppException(failure.toUserMessage()),
      (data) => state = true,
    );
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.logout().run();
    result.fold(
      (failure) => throw AppException(failure.toUserMessage()),
      (data) => state = false,
    );
  }
}
