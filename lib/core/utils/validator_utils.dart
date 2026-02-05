/// 验证工具类
class ValidatorUtils {
  /// 验证手机号
  static bool isValidPhone(String phone) {
    if (phone.isEmpty) return false;
    final regex = RegExp(r'^1[3-9]\d{9}$');
    return regex.hasMatch(phone);
  }
  
  /// 验证邮箱
  static bool isValidEmail(String email) {
    if (email.isEmpty) return false;
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }
  
  /// 验证密码（6-20位，包含字母和数字）
  static bool isValidPassword(String password) {
    if (password.isEmpty) return false;
    if (password.length < 6 || password.length > 20) return false;
    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$');
    return regex.hasMatch(password);
  }
  
  /// 验证用户名（4-20位，字母、数字、下划线）
  static bool isValidUsername(String username) {
    if (username.isEmpty) return false;
    if (username.length < 4 || username.length > 20) return false;
    final regex = RegExp(r'^[a-zA-Z0-9_]{4,20}$');
    return regex.hasMatch(username);
  }
  
  /// 验证非空
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }
  
  /// 验证数字
  static bool isNumeric(String value) {
    if (value.isEmpty) return false;
    return double.tryParse(value) != null;
  }
  
  /// 验证正整数
  static bool isPositiveInteger(String value) {
    if (value.isEmpty) return false;
    final number = int.tryParse(value);
    return number != null && number > 0;
  }
}
