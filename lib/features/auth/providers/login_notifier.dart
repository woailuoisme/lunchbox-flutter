import 'package:formz/formz.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/auth/entities/password.dart';
import 'package:lunchbox/features/auth/entities/username.dart';
import 'package:lunchbox/features/auth/providers/auth_notifier.dart';
import 'package:lunchbox/features/auth/providers/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  LoginState build() {
    // 默认预填充 admin 账号，方便服务端不可用时直接登录
    const username = Username.dirty('admin');
    const password = Password.dirty('admin');
    return const LoginState(
      username: username,
      password: password,
      isValid: true,
    );
  }

  void usernameChanged(String value) {
    final username = Username.dirty(value);
    state = state.copyWith(
      username: username,
      isValid: Formz.validate([username, state.password]),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    state = state.copyWith(
      password: password,
      isValid: Formz.validate([state.username, password]),
    );
  }

  Future<void> login() async {
    if (state.status.isInProgress) {
      return;
    }

    // 强制验证表单（将 pure 状态转为 dirty）
    final username = Username.dirty(state.username.value);
    final password = Password.dirty(state.password.value);
    final isValid = Formz.validate([username, password]);

    if (!isValid) {
      state = state.copyWith(
        username: username,
        password: password,
        isValid: false,
      );
      return;
    }

    state = state.copyWith(status: FormzSubmissionStatus.inProgress);

    try {
      await ref
          .read(authProvider.notifier)
          .login(state.username.value, state.password.value);
      state = state.copyWith(status: FormzSubmissionStatus.success);
    } catch (e) {
      LoggerUtils.e('Login failed', e);
      state = state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }
}
