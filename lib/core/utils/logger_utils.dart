import 'package:talker_flutter/talker_flutter.dart';

/// 日志工具类
class LoggerUtils {
  LoggerUtils._();

  static final Talker _talker = TalkerFlutter.init(
    settings: TalkerSettings(
      useHistory: true,
      useConsoleLogs: true,
      maxHistoryItems: 1000,
    ),
    logger: TalkerLogger(settings: TalkerLoggerSettings(enableColors: true)),
  );

  /// 获取 Talker 实例
  static Talker get instance => _talker;

  /// Debug 日志
  static void d(Object? message, [Object? error, StackTrace? stackTrace]) {
    _talker.debug(message, error, stackTrace);
  }

  /// Info 日志
  static void i(Object? message, [Object? error, StackTrace? stackTrace]) {
    _talker.info(message, error, stackTrace);
  }

  /// Warning 日志
  static void w(Object? message, [Object? error, StackTrace? stackTrace]) {
    _talker.warning(message, error, stackTrace);
  }

  /// Error 日志
  static void e(Object? message, [Object? error, StackTrace? stackTrace]) {
    _talker.error(message, error, stackTrace);
  }

  /// Fatal 日志
  static void f(Object? message, [Object? error, StackTrace? stackTrace]) {
    _talker.critical(message, error, stackTrace);
  }
}
