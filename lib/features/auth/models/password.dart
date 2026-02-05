import 'package:formz/formz.dart';

/// 密码验证错误类型
enum PasswordValidationError { empty }

/// 密码输入模型
class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }
    return null;
  }
}
