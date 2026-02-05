import 'package:formz/formz.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/auth/models/password.dart';
import 'package:lunchbox/features/auth/models/username.dart';
import 'package:lunchbox/features/auth/providers/auth_notifier.dart';
import 'package:lunchbox/features/auth/providers/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  LoginState build() {
    return const LoginState();
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
    if (!state.isValid) {
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
