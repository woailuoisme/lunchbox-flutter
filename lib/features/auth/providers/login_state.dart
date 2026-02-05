import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/password.dart';
import '../models/username.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(Username.pure()) Username username,
    @Default(Password.pure()) Password password,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool isValid,
    String? errorMessage,
  }) = _LoginState;
}
