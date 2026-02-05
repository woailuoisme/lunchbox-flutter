import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toastification/toastification.dart';

import '../providers/navigator_key_provider.dart';

part 'toast_service.g.dart';

/// Toast 服务
///
/// 提供统一的 Toast 通知功能，支持成功、错误、信息和警告四种类型。
/// 使用 Toastification 库实现现代化、可定制的通知提示。
///
/// 使用示例：
/// ```dart
/// final toastService = ref.read(toastServiceProvider);
/// toastService.showSuccess('操作成功');
/// toastService.showError('操作失败，请重试');
/// ```
@riverpod
ToastService toastService(Ref ref) {
  final navigatorKey = ref.watch(navigatorKeyProvider);
  return ToastService(navigatorKey: navigatorKey);
}

/// Toast 服务实现类
class ToastService {
  /// 构造函数
  const ToastService({required this.navigatorKey});

  /// 全局 Navigator Key
  final GlobalKey<NavigatorState> navigatorKey;

  /// 默认的 Toast 持续时间
  static const Duration _defaultDuration = Duration(seconds: 3);

  /// 错误 Toast 的持续时间（稍长）
  static const Duration _errorDuration = Duration(seconds: 5);

  /// 动画持续时间
  static const Duration _animationDuration = Duration(milliseconds: 300);

  /// Toast 对齐位置
  static const Alignment _alignment = Alignment.topCenter;

  /// 显示成功消息
  ///
  /// [message] 要显示的消息内容
  /// [title] 可选的标题，默认为 "成功"
  /// [autoCloseDuration] 可选的自动关闭时间，默认为 3 秒
  /// [context] 可选的 BuildContext，如果不提供则使用全局 navigator key
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
      icon: const Icon(Icons.check_circle),
      context: context,
      autoCloseDuration: autoCloseDuration ?? _defaultDuration,
    );
  }

  /// 显示错误消息
  ///
  /// [message] 要显示的消息内容
  /// [title] 可选的标题，默认为 "错误"
  /// [autoCloseDuration] 可选的自动关闭时间，默认为 5 秒
  /// [context] 可选的 BuildContext，如果不提供则使用全局 navigator key
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
      icon: const Icon(Icons.error),
      context: context,
      autoCloseDuration: autoCloseDuration ?? _errorDuration,
    );
  }

  /// 显示信息消息
  ///
  /// [message] 要显示的消息内容
  /// [title] 可选的标题，默认为 "提示"
  /// [autoCloseDuration] 可选的自动关闭时间，默认为 3 秒
  /// [context] 可选的 BuildContext，如果不提供则使用全局 navigator key
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
      icon: const Icon(Icons.info),
      context: context,
      autoCloseDuration: autoCloseDuration ?? _defaultDuration,
    );
  }

  /// 显示警告消息
  ///
  /// [message] 要显示的消息内容
  /// [title] 可选的标题，默认为 "警告"
  /// [autoCloseDuration] 可选的自动关闭时间，默认为 3 秒
  /// [context] 可选的 BuildContext，如果不提供则使用全局 navigator key
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
      icon: const Icon(Icons.warning),
      context: context,
      autoCloseDuration: autoCloseDuration ?? _defaultDuration,
    );
  }

  /// 内部方法：显示 Toast
  void _show({
    required String message,
    required String title,
    required ToastificationType type,
    required Icon icon,
    required Duration autoCloseDuration,
    BuildContext? context,
  }) {
    // 如果没有提供 context，尝试从全局 navigator key 获取
    final targetContext = context ?? _getGlobalContext();

    if (targetContext == null) {
      // 如果无法获取 context，记录警告并返回
      debugPrint('ToastService: Unable to show toast - no context available');
      return;
    }

    toastification.show(
      context: targetContext,
      type: type,
      style: ToastificationStyle.fillColored,
      title: Text(title),
      description: Text(message),
      alignment: _alignment,
      autoCloseDuration: autoCloseDuration,
      animationDuration: _animationDuration,
      icon: icon,
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
