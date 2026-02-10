import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:lunchbox/features/auth/entities/password.dart';
import 'package:lunchbox/features/auth/entities/username.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(Username.pure()) Username username,
    @Default(Password.pure()) Password password,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(true) bool isValid,
    String? errorMessage,
  }) = _LoginState;
}
