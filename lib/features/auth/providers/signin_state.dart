import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_state.freezed.dart';

enum SignInStatus { initial, inProgress, success, failure }

enum SignInType { password, phone }

extension SignInStatusX on SignInStatus {
  bool get isInitial => this == SignInStatus.initial;
  bool get isInProgress => this == SignInStatus.inProgress;
  bool get isSuccess => this == SignInStatus.success;
  bool get isFailure => this == SignInStatus.failure;
}

extension SignInStateX on SignInState {
  bool get canSendCode =>
      phoneNumber.isNotEmpty && countdown <= 0 && !status.isInProgress;

  bool get canSignInWithPassword =>
      signInType == SignInType.password &&
      username.isNotEmpty &&
      password.isNotEmpty &&
      !status.isInProgress;

  bool get canSignInWithPhone =>
      signInType == SignInType.phone &&
      phoneNumber.isNotEmpty &&
      verificationCode.isNotEmpty &&
      !status.isInProgress;

  bool get canSubmit => canSignInWithPassword || canSignInWithPhone;

  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;
}

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    @Default('') String username,
    @Default('') String password,
    @Default('') String phoneNumber,
    @Default('') String verificationCode,
    @Default(SignInType.password) SignInType signInType,
    @Default(false) bool isCodeSent,
    @Default(0) int countdown,
    @Default(SignInStatus.initial) SignInStatus status,
    String? errorMessage,
  }) = _SignInState;
}
