import 'package:formz/formz.dart';

/// 用户名验证错误类型
enum UsernameValidationError { empty }

/// 用户名输入模型
class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');
  const Username.dirty([super.value = '']) : super.dirty();

  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) {
      return UsernameValidationError.empty;
    }
    return null;
  }
}
