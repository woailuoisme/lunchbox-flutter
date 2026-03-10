import 'package:flutter/material.dart';
import 'package:lunchbox/core/providers/navigator_key_provider.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'toast_service.g.dart';

/// Toast 服务
@riverpod
ToastService toastService(Ref ref) {
  final navigatorKey = ref.watch(navigatorKeyProvider);
  return ToastService(navigatorKey: navigatorKey);
}

/// Toast 服务实现类
class ToastService {
  const ToastService({required this.navigatorKey});

  final GlobalKey<NavigatorState> navigatorKey;

  static const Duration _defaultDuration = Duration(seconds: 3);
  static const Duration _errorDuration = Duration(seconds: 5);
  static const Duration _animationDuration = Duration(milliseconds: 400);
  static const Alignment _alignment = Alignment.topCenter;

  void showSuccess(
    String message, {
    String? title,
    Duration? autoCloseDuration,
    BuildContext? context,
  }) {
    _show(
      message: message,
      title: title ?? '成功',
      type: ToastificationType.success,
      icon: Symbols.check_circle,
      color: Colors.green,
      context: context,
      autoCloseDuration: autoCloseDuration ?? _defaultDuration,
    );
  }

  void showError(
    String message, {
    String? title,
    Duration? autoCloseDuration,
    BuildContext? context,
  }) {
    _show(
      message: message,
      title: title ?? '错误',
      type: ToastificationType.error,
      icon: Symbols.error,
      color: Colors.red,
      context: context,
      autoCloseDuration: autoCloseDuration ?? _errorDuration,
    );
  }

  void showInfo(
    String message, {
    String? title,
    Duration? autoCloseDuration,
    BuildContext? context,
  }) {
    _show(
      message: message,
      title: title ?? '提示',
      type: ToastificationType.info,
      icon: Symbols.info,
      color: Colors.blue,
      context: context,
      autoCloseDuration: autoCloseDuration ?? _defaultDuration,
    );
  }

  void showWarning(
    String message, {
    String? title,
    Duration? autoCloseDuration,
    BuildContext? context,
  }) {
    _show(
      message: message,
      title: title ?? '警告',
      type: ToastificationType.warning,
      icon: Symbols.warning,
      color: Colors.orange,
      context: context,
      autoCloseDuration: autoCloseDuration ?? _defaultDuration,
    );
  }

  void _show({
    required String message,
    required String title,
    required ToastificationType type,
    required IconData icon,
    required Color color,
    required Duration autoCloseDuration,
    BuildContext? context,
  }) {
    final targetContext = context ?? navigatorKey.currentContext;
    if (targetContext == null) return;

    final theme = Theme.of(targetContext);

    toastification.show(
      context: targetContext,
      type: type,
      style: ToastificationStyle.fillColored,
      title: Text(title),
      description: Text(message),
      alignment: _alignment,
      autoCloseDuration: autoCloseDuration,
      animationDuration: _animationDuration,
      icon: Icon(icon, color: color, size: 24.sp),
      showProgressBar: true,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
    );
  }

  /// 获取全局 context
  ///
  /// 尝试从 GoRouter 的 navigator key 获取 context
  BuildContext? _getGlobalContext() {
    return navigatorKey.currentContext;
  }
}
