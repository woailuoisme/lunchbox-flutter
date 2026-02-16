import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lunchbox/i18n/translations.g.dart';

class AppDialog {
  static Future<void> showInfo(
    BuildContext context, {
    String? title,
    required String message,
    String? okText,
    VoidCallback? onOk,
  }) {
    return _show(
      context,
      dialogType: DialogType.info,
      title: title ?? t.common.info,
      message: message,
      okText: okText ?? t.common.ok,
      onOk: onOk,
    );
  }

  static Future<void> showSuccess(
    BuildContext context, {
    String? title,
    required String message,
    String? okText,
    VoidCallback? onOk,
  }) {
    return _show(
      context,
      dialogType: DialogType.success,
      title: title ?? t.common.success,
      message: message,
      okText: okText ?? t.common.ok,
      onOk: onOk,
    );
  }

  static Future<void> showError(
    BuildContext context, {
    String? title,
    required String message,
    String? okText,
    VoidCallback? onOk,
  }) {
    return _show(
      context,
      dialogType: DialogType.error,
      title: title ?? t.common.error,
      message: message,
      okText: okText ?? t.common.ok,
      onOk: onOk,
    );
  }

  static Future<void> showWarning(
    BuildContext context, {
    String? title,
    required String message,
    String? okText,
    VoidCallback? onOk,
  }) {
    return _show(
      context,
      dialogType: DialogType.warning,
      title: title ?? t.common.warning,
      message: message,
      okText: okText ?? t.common.ok,
      onOk: onOk,
    );
  }

  static Future<bool?> showConfirm(
    BuildContext context, {
    String? title,
    required String message,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    final completer = Completer<bool?>();
    final theme = Theme.of(context);

    AwesomeDialog(
      context: context,
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
        if (!completer.isCompleted) {
          completer.complete(null);
        }
      },
    ).show();

    return completer.future;
  }

  static Future<void> _show(
    BuildContext context, {
    required DialogType dialogType,
    required String title,
    required String message,
    String? okText,
    VoidCallback? onOk,
  }) {
    final theme = Theme.of(context);
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.scale,
      title: title,
      desc: message,
      btnOkText: okText ?? t.common.ok,
      btnOkColor: theme.colorScheme.primary,
      btnOkOnPress: onOk ?? () {},
    ).show();
  }
}
