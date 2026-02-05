import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigator_key_provider.g.dart';

/// 全局 Navigator Key Provider
///
/// 提供应用级别的 GlobalKey NavigatorState，用于在没有 BuildContext 的情况下
/// 访问导航和显示对话框、Toast 等功能。
@riverpod
GlobalKey<NavigatorState> navigatorKey(Ref ref) {
  return GlobalKey<NavigatorState>();
}
