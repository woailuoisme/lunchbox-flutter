import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 带底部导航栏的脚手架
///
/// 用于 StatefulShellRoute，提供底部导航栏和页面切换功能
class GNavScaffold extends StatelessWidget {
  const GNavScaffold({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: theme.shadowColor.withValues(alpha: .1),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
            child: GNav(
              rippleColor: colorScheme.primary.withValues(alpha: .1),
              hoverColor: colorScheme.primary.withValues(alpha: .05),
              gap: 8.w,
              activeColor: colorScheme.primary,
              iconSize: 24.sp,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: colorScheme.primary.withValues(alpha: .1),
              color: colorScheme.onSurfaceVariant,
              tabs: [
                GButton(icon: Symbols.garage_home, text: t.navigation.home),
                GButton(icon: Symbols.hard_drive_2, text: t.navigation.device),
                GButton(icon: Symbols.order_approve, text: t.navigation.orders),
                GButton(
                  icon: Symbols.person_outline,
                  text: t.navigation.profile,
                ),
              ],
              selectedIndex: navigationShell.currentIndex,
              onTabChange: (int index) => _onTap(context, index),
            ),
          ),
        ),
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
