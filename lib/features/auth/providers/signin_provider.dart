import 'dart:async';

import 'package:lunchbox/features/auth/providers/auth_provider.dart';
import 'package:lunchbox/features/auth/providers/signin_state.dart';
import 'package:lunchbox/features/auth/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signin_provider.g.dart';

@riverpod
class SignInNotifier extends _$SignInNotifier {
  Timer? _timer;

  @override
  SignInState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    // Default admin account for easy testing
    return const SignInState(username: 'admin', password: 'admin');
  }

  void setSignInType(SignInType type) {
    state = state.copyWith(signInType: type);
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

    state = state.copyWith(status: SignInStatus.inProgress);
    try {
      await ref
          .read(authRepositoryProvider)
          .sendVerificationCode(state.phoneNumber);

      state = state.copyWith(
        isCodeSent: true,
        countdown: 60,
        status: SignInStatus.initial,
      );
      _startTimer();
    } catch (e) {
      state = state.copyWith(
        status: SignInStatus.failure,
        errorMessage: e.toString(),
      );
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

  void _clearError() {
    if (state.errorMessage == null) {
      return;
    }
    state = state.copyWith(errorMessage: null);
  }

  Future<void> signIn() async {
    if (state.status == SignInStatus.inProgress) {
      return;
    }

    state = state.copyWith(status: SignInStatus.inProgress);
    try {
      if (state.signInType == SignInType.password) {
        await ref
            .read(authProvider.notifier)
            .login(state.username, state.password);
      } else {
        await ref
            .read(authProvider.notifier)
            .loginWithPhone(state.phoneNumber, state.verificationCode);
      }

      state = state.copyWith(status: SignInStatus.success);
    } catch (e) {
      state = state.copyWith(
        status: SignInStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }
}
