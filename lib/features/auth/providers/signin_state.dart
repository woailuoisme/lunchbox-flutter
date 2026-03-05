import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_state.freezed.dart';

enum SignInStatus { initial, inProgress, success, failure }

enum SignInType { password }

extension SignInStatusX on SignInStatus {
  bool get isInitial => this == SignInStatus.initial;
  bool get isInProgress => this == SignInStatus.inProgress;
  bool get isSuccess => this == SignInStatus.success;
  bool get isFailure => this == SignInStatus.failure;
}

extension SignInStateX on SignInState {
  bool get canSignInWithPassword =>
      signInType == SignInType.password &&
      username.isNotEmpty &&
      password.isNotEmpty &&
      !status.isInProgress;

  bool get canSubmit => canSignInWithPassword;

  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;
}

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    @Default('') String username,
    @Default('') String password,
    @Default(SignInType.password) SignInType signInType,
    @Default(SignInStatus.initial) SignInStatus status,
    String? errorMessage,
  }) = _SignInState;
}
