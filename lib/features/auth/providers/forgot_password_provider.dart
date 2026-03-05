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
    return const ForgotPasswordState();
  }

  void identifierChanged(String value) {
    state = state.copyWith(identifier: value, errorMessage: null);
  }

  void oldPasswordChanged(String value) {
    state = state.copyWith(oldPassword: value, errorMessage: null);
  }

  void newPasswordChanged(String value) {
    state = state.copyWith(newPassword: value, errorMessage: null);
  }

  void confirmPasswordChanged(String value) {
    state = state.copyWith(confirmPassword: value, errorMessage: null);
  }

  /// 重置密码
  Future<void> resetPassword() async {
    if (state.identifier.isEmpty ||
        state.oldPassword.isEmpty ||
        state.newPassword.isEmpty ||
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
      await ref
          .read(authRepositoryProvider)
          .resetPassword(
            email: state.identifier,
            oldPassword: state.oldPassword,
            newPassword: state.newPassword,
            confirmPassword: state.confirmPassword,
          );

      state = state.copyWith(status: ForgotPasswordStatus.success);
    } catch (e) {
      state = state.copyWith(
        status: ForgotPasswordStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }

  void resetStatus() {
    state = state.copyWith(status: ForgotPasswordStatus.initial);
  }
}
