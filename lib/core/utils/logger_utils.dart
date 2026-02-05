import 'package:logger/logger.dart';

/// 日志工具类
class LoggerUtils {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      printTime: true,
    ),
  );
  
  /// Debug 日志
  static void d(message, [error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }
  
  /// Info 日志
  static void i(message, [error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }
  
  /// Warning 日志
  static void w(message, [error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }
  
  /// Error 日志
  static void e(message, [error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
  
  /// Fatal 日志
  static void f(message, [error, StackTrace? stackTrace]) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }
}
