import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/auth/providers/auth_notifier.dart';
import 'package:lunchbox/features/auth/providers/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  LoginState build() {
    // 默认预填充 admin 账号，方便服务端不可用时直接登录
    return const LoginState(username: 'admin', password: 'admin');
  }

  void usernameChanged(String value) {
    state = state.copyWith(username: value);
  }

  void passwordChanged(String value) {
    state = state.copyWith(password: value);
  }

  Future<void> login() async {
    if (state.status.isInProgress) {
      return;
    }

    state = state.copyWith(status: LoginStatus.inProgress);

    try {
      await ref
          .read(authProvider.notifier)
          .login(state.username, state.password);
      state = state.copyWith(status: LoginStatus.success);
    } catch (e) {
      LoggerUtils.e('Login failed', e);
      state = state.copyWith(
        status: LoginStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }
}
