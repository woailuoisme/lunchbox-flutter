import 'dart:async';

import 'package:lunchbox/features/auth/providers/auth_provider.dart';
import 'package:lunchbox/features/auth/providers/signin_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signin_provider.g.dart';

@riverpod
class SignInNotifier extends _$SignInNotifier {
  @override
  SignInState build() {
    return const SignInState();
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
