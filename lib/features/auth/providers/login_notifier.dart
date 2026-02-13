import 'dart:async';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/auth/providers/auth_notifier.dart';
import 'package:lunchbox/features/auth/providers/login_state.dart';
import 'package:lunchbox/features/auth/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
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
  }

  void usernameChanged(String value) {
    state = state.copyWith(username: value);
  }

  void passwordChanged(String value) {
    state = state.copyWith(password: value);
  }

  void phoneNumberChanged(String value) {
    state = state.copyWith(phoneNumber: value);
  }

  void verificationCodeChanged(String value) {
    state = state.copyWith(verificationCode: value);
  }

  Future<void> sendVerificationCode() async {
    if (state.phoneNumber.isEmpty || state.countdown > 0) {
      return;
    }

    try {
      await ref
          .read(authRepositoryProvider)
          .sendVerificationCode(state.phoneNumber)
          .run();
      state = state.copyWith(isCodeSent: true, countdown: 60);
      _startTimer();
    } catch (e) {
      LoggerUtils.e('Send verification code failed', e);
      state = state.copyWith(errorMessage: e.toString());
    }
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

  Future<void> login() async {
    if (state.status.isInProgress) {
      return;
    }

    state = state.copyWith(status: LoginStatus.inProgress, errorMessage: null);

    try {
      if (state.loginType == LoginType.password) {
        await ref
            .read(authProvider.notifier)
            .login(state.username, state.password);
      } else {
        await ref
            .read(authProvider.notifier)
            .loginWithPhone(state.phoneNumber, state.verificationCode);
      }
      state = state.copyWith(status: LoginStatus.success);
    } catch (e) {
      LoggerUtils.e('Login failed', e);
      state = state.copyWith(
        status: LoginStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> loginWithGoogle() async {
    if (state.status.isInProgress) {
      return;
    }

    state = state.copyWith(status: LoginStatus.inProgress, errorMessage: null);

    try {
      await ref.read(authProvider.notifier).loginWithGoogle();
      state = state.copyWith(status: LoginStatus.success);
    } catch (e) {
      LoggerUtils.e('Google Login failed', e);
      state = state.copyWith(
        status: LoginStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }
}
