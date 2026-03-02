import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';

enum ForgotPasswordStatus { initial, inProgress, success, failure }

extension ForgotPasswordStatusX on ForgotPasswordStatus {
  bool get isInitial => this == ForgotPasswordStatus.initial;
  bool get isInProgress => this == ForgotPasswordStatus.inProgress;
  bool get isSuccess => this == ForgotPasswordStatus.success;
  bool get isFailure => this == ForgotPasswordStatus.failure;
}

@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default('') String identifier, // Email or Phone
    @Default('') String otp,
    @Default('') String newPassword,
    @Default('') String confirmPassword,
    @Default(0) int countdown,
    @Default(false) bool isOtpSent,
    @Default(false) bool isOtpVerified,
    @Default(ForgotPasswordStatus.initial) ForgotPasswordStatus status,
    String? errorMessage,
  }) = _ForgotPasswordState;
}
