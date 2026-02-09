import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 使用 ConvexAppBar 的底部导航栏脚手架
///
/// 用于 StatefulShellRoute，提供凸起式底部导航栏和页面切换功能
class ConvexScaffold extends StatelessWidget {
  const ConvexScaffold({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        backgroundColor: colorScheme.surface,
        activeColor: colorScheme.primary,
        color: colorScheme.onSurfaceVariant,
        height: 50.h,
        elevation: 2,
        items: [
          TabItem(icon: Symbols.home, title: t.navigation.home),
          TabItem(icon: Symbols.store, title: t.navigation.device),
          TabItem(icon: Symbols.receipt, title: t.navigation.orders),
          TabItem(icon: Symbols.person, title: t.navigation.profile),
        ],
        initialActiveIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  /// 处理底部导航栏点击事件
  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
