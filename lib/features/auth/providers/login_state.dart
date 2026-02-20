import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

enum LoginStatus { initial, inProgress, success, failure }

enum LoginType { password, phone }

extension LoginStatusX on LoginStatus {
  bool get isInitial => this == LoginStatus.initial;
  bool get isInProgress => this == LoginStatus.inProgress;
  bool get isSuccess => this == LoginStatus.success;
  bool get isFailure => this == LoginStatus.failure;
}

extension LoginStateX on LoginState {
  bool get canSendCode =>
      phoneNumber.isNotEmpty && countdown <= 0 && !status.isInProgress;

  bool get canLoginWithPassword =>
      loginType == LoginType.password &&
      username.isNotEmpty &&
      password.isNotEmpty &&
      !status.isInProgress;

  bool get canLoginWithPhone =>
      loginType == LoginType.phone &&
      phoneNumber.isNotEmpty &&
      verificationCode.isNotEmpty &&
      !status.isInProgress;

  bool get canSubmit => canLoginWithPassword || canLoginWithPhone;

  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;
}

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String username,
    @Default('') String password,
    @Default('') String phoneNumber,
    @Default('') String verificationCode,
    @Default(LoginType.password) LoginType loginType,
    @Default(false) bool isCodeSent,
    @Default(0) int countdown,
    @Default(LoginStatus.initial) LoginStatus status,
    String? errorMessage,
  }) = _LoginState;
}
