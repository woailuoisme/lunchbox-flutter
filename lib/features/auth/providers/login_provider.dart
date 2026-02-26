import 'dart:async';

import 'package:lunchbox/core/mixins/async_runner_mixin.dart';
import 'package:lunchbox/features/auth/providers/auth_provider.dart';
import 'package:lunchbox/features/auth/providers/login_state.dart';
import 'package:lunchbox/features/auth/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier with AsyncRunnerMixin<LoginState> {
  Timer? _timer;

  @override
  LoginState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    // 默认预填充 admin 账号，方便服务端不可用时直接登录
    return const LoginState(username: 'admin', password: 'admin');
  }

  void setLoginType(LoginType type) {
    state = state.copyWith(loginType: type);
    _clearError();
  }

  void usernameChanged(String value) {
    state = state.copyWith(username: value);
    _clearError();
  }

  void passwordChanged(String value) {
    state = state.copyWith(password: value);
    _clearError();
  }

  void phoneNumberChanged(String value) {
    state = state.copyWith(phoneNumber: value);
    _clearError();
  }

  void verificationCodeChanged(String value) {
    state = state.copyWith(verificationCode: value);
    _clearError();
  }

  Future<void> sendVerificationCode() async {
    if (state.phoneNumber.isEmpty || state.countdown > 0) {
      return;
    }

    await runAsync(
      () async {
        await ref
            .read(authRepositoryProvider)
            .sendVerificationCode(state.phoneNumber);

        state = state.copyWith(isCodeSent: true, countdown: 60);
        _startTimer();
      },
      loadingStateUpdater: (state, isLoading) => state.copyWith(
        status: isLoading ? LoginStatus.inProgress : LoginStatus.initial,
      ),
      errorLabel: 'Send verification code failed',
    );
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.countdown > 0) {
        state = state.copyWith(countdown: state.countdown - 1);
      } else {
        timer.cancel();
      }
    });
  }

  void _clearError() {
    if (state.errorMessage == null) {
      return;
    }
    state = state.copyWith(errorMessage: null);
  }

  Future<void> login() async {
    if (state.status.isInProgress) {
      return;
    }

    await runAsync(
      () async {
        if (state.loginType == LoginType.password) {
          await ref
              .read(authProvider.notifier)
              .login(state.username, state.password);
        } else {
          await ref
              .read(authProvider.notifier)
              .loginWithPhone(state.phoneNumber, state.verificationCode);
        }
      },
      loadingStateUpdater: (state, isLoading) => state.copyWith(
        status: isLoading ? LoginStatus.inProgress : LoginStatus.initial,
      ),
      errorLabel: 'Login failed',
    );
  }

  Future<void> loginWithGoogle() async {
    if (state.status.isInProgress) {
      return;
    }

    await runAsync(
      () async {
        await ref.read(authProvider.notifier).loginWithGoogle();
      },
      loadingStateUpdater: (state, isLoading) => state.copyWith(
        status: isLoading ? LoginStatus.inProgress : LoginStatus.initial,
      ),
      errorLabel: 'Google Login failed',
    );
  }
}
