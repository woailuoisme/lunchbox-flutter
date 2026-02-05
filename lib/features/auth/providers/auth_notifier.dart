import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/auth_repository.dart';

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
    await repo.login(username: username, password: password);
    state = true;
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
    state = true;
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.logout();
    state = false;
  }
}
