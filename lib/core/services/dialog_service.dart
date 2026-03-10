import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/providers/navigator_key_provider.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dialog_service.g.dart';

/// 对话框服务
///
/// 提供统一的对话框功能，支持信息、成功、错误、警告和确认五种类型。
/// 基于 AwesomeDialog 实现。
@riverpod
DialogService dialogService(Ref ref) {
  final navigatorKey = ref.watch(navigatorKeyProvider);
  return DialogService(navigatorKey: navigatorKey);
}

class DialogService {
  const DialogService({required this.navigatorKey});

  final GlobalKey<NavigatorState> navigatorKey;

  BuildContext? get _context => navigatorKey.currentContext;

  /// 显示提示对话框
  Future<void> showInfo({
    String? title,
    required String message,
    String? okText,
    VoidCallback? onOk,
    BuildContext? context,
  }) {
    return _show(
      context: context,
      dialogType: DialogType.info,
      title: title ?? t.common.info,
      message: message,
      okText: okText ?? t.common.ok,
      onOk: onOk,
    );
  }

  /// 显示成功对话框
  Future<void> showSuccess({
    String? title,
    required String message,
    String? okText,
    VoidCallback? onOk,
    BuildContext? context,
  }) {
    return _show(
      context: context,
      dialogType: DialogType.success,
      title: title ?? t.common.success,
      message: message,
      okText: okText ?? t.common.ok,
      onOk: onOk,
    );
  }

  /// 显示错误对话框
  Future<void> showError({
    String? title,
    required String message,
    String? okText,
    VoidCallback? onOk,
    BuildContext? context,
  }) {
    return _show(
      context: context,
      dialogType: DialogType.error,
      title: title ?? t.common.error,
      message: message,
      okText: okText ?? t.common.ok,
      onOk: onOk,
    );
  }

  /// 显示警告对话框
  Future<void> showWarning({
    String? title,
    required String message,
    String? okText,
    VoidCallback? onOk,
    BuildContext? context,
  }) {
    return _show(
      context: context,
      dialogType: DialogType.warning,
      title: title ?? t.common.warning,
      message: message,
      okText: okText ?? t.common.ok,
      onOk: onOk,
    );
  }

  /// 显示确认对话框
  Future<bool?> showConfirm({
    String? title,
    required String message,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    BuildContext? context,
  }) {
    final targetContext = context ?? _context;
    if (targetContext == null) return Future.value(null);

    final completer = Completer<bool?>();
    final theme = Theme.of(targetContext);

    AwesomeDialog(
      context: targetContext,
      dialogType: DialogType.question,
      animType: AnimType.scale,
      title: title ?? t.common.confirm,
      desc: message,
      btnOkText: confirmText ?? t.common.confirm,
      btnCancelText: cancelText ?? t.common.cancel,
      btnOkColor: theme.colorScheme.primary,
      btnCancelColor: theme.colorScheme.surfaceContainerHighest,
      btnOkOnPress: () {
        onConfirm?.call();
        if (!completer.isCompleted) {
          completer.complete(true);
        }
      },
      btnCancelOnPress: () {
        onCancel?.call();
        if (!completer.isCompleted) {
          completer.complete(false);
        }
      },
      onDismissCallback: (type) {
        // 如果是通过按钮点击触发的关闭，我们让按钮的回调去完成 Completer
        if (type == DismissType.btnOk || type == DismissType.btnCancel) {
          return;
        }

        if (!completer.isCompleted) {
          completer.complete(null);
        }
      },
    ).show();

    return completer.future;
  }

  /// 显示自定义内容对话框
  Future<void> showContent({
    String? title,
    required Widget content,
    String? okText,
    VoidCallback? onOk,
    bool dismissOnTouchOutside = true,
    DialogType dialogType = DialogType.noHeader,
    double? width,
    EdgeInsetsGeometry? padding,
    BuildContext? context,
  }) {
    final targetContext = context ?? _context;
    if (targetContext == null) return Future.value();

    final theme = Theme.of(targetContext);
    return AwesomeDialog(
      context: targetContext,
      dialogType: dialogType,
      animType: AnimType.scale,
      title: title,
      body: content,
      btnOkText: okText ?? t.common.ok,
      btnOkColor: theme.colorScheme.primary,
      btnOkOnPress: onOk ?? () {},
      dismissOnTouchOutside: dismissOnTouchOutside,
      width: width,
      padding: padding,
    ).show();
  }

  Future<void> _show({
    required DialogType dialogType,
    required String title,
    required String message,
    String? okText,
    VoidCallback? onOk,
    BuildContext? context,
  }) {
    final targetContext = context ?? _context;
    if (targetContext == null) return Future.value();

    final theme = Theme.of(targetContext);
    return AwesomeDialog(
      context: targetContext,
      dialogType: dialogType,
      animType: AnimType.scale,
      headerAnimationLoop: false,
      title: title,
      desc: message,
      // 使用主题中的字体样式
      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onSurface,
      ),
      descTextStyle: TextStyle(
        fontSize: 15.sp,
        color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
      ),
      btnOkText: okText ?? t.common.ok,
      btnOkColor: theme.colorScheme.primary,
      buttonsBorderRadius: BorderRadius.circular(12.r),
      btnOkOnPress: onOk ?? () {},
    ).show();
  }
}
