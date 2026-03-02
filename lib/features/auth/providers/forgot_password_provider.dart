import 'dart:async';

import 'package:lunchbox/features/auth/providers/forgot_password_state.dart';
import 'package:lunchbox/features/auth/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_provider.g.dart';

@riverpod
class ForgotPasswordNotifier extends _$ForgotPasswordNotifier {
  Timer? _timer;

  @override
  ForgotPasswordState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return const ForgotPasswordState();
  }

  void identifierChanged(String value) {
    state = state.copyWith(identifier: value, errorMessage: null);
  }

  void otpChanged(String value) {
    state = state.copyWith(otp: value, errorMessage: null);
  }

  void newPasswordChanged(String value) {
    state = state.copyWith(newPassword: value, errorMessage: null);
  }

  void confirmPasswordChanged(String value) {
    state = state.copyWith(confirmPassword: value, errorMessage: null);
  }

  /// 发送重置密码验证码
  Future<void> sendOtp() async {
    if (state.identifier.isEmpty || state.countdown > 0) return;

    state = state.copyWith(status: ForgotPasswordStatus.inProgress);
    try {
      await ref
          .read(authRepositoryProvider)
          .sendVerificationCode(state.identifier);

      state = state.copyWith(
        isOtpSent: true,
        countdown: 60,
        status: ForgotPasswordStatus.initial,
      );
      _startTimer();
    } catch (e) {
      state = state.copyWith(
        status: ForgotPasswordStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }

  /// 验证验证码
  Future<void> verifyOtp() async {
    if (state.otp.isEmpty || state.status == ForgotPasswordStatus.inProgress) {
      return;
    }

    state = state.copyWith(status: ForgotPasswordStatus.inProgress);
    try {
      // 模拟验证 OTP 逻辑
      await Future<void>.delayed(const Duration(seconds: 1));
      if (state.otp == '123456') {
        state = state.copyWith(
          status: ForgotPasswordStatus.initial,
          isOtpVerified: true,
        );
      } else {
        throw Exception('Invalid verification code');
      }
    } catch (e) {
      state = state.copyWith(
        status: ForgotPasswordStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }

  /// 重置密码
  Future<void> resetPassword() async {
    if (state.newPassword.isEmpty ||
        state.confirmPassword.isEmpty ||
        state.status == ForgotPasswordStatus.inProgress) {
      return;
    }

    if (state.newPassword != state.confirmPassword) {
      state = state.copyWith(errorMessage: 'Passwords do not match');
      return;
    }

    state = state.copyWith(status: ForgotPasswordStatus.inProgress);
    try {
      // 模拟调用后端接口重置密码
      // await ref.read(authRepositoryProvider).resetPassword(state.identifier, state.otp, state.newPassword);
      await Future<void>.delayed(const Duration(seconds: 1));

      state = state.copyWith(status: ForgotPasswordStatus.success);
    } catch (e) {
      state = state.copyWith(
        status: ForgotPasswordStatus.failure,
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

  void resetStatus() {
    state = state.copyWith(status: ForgotPasswordStatus.initial);
  }
}
