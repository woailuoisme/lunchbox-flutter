import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:lunchbox/core/values/app_colors.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 带底部导航栏的脚手架
///
/// 用于 StatefulShellRoute，提供底部导航栏和页面切换功能
class GNavScaffold extends StatelessWidget {
  const GNavScaffold({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withValues(alpha: .1),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
            child: GNav(
              rippleColor: AppColors.primary.withValues(alpha: .1),
              hoverColor: AppColors.primary.withValues(alpha: .05),
              gap: 8.w,
              activeColor: AppColors.primary,
              iconSize: 24.sp,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: AppColors.primary.withValues(alpha: .1),
              color: AppColors.textSecondary,
              tabs: [
                GButton(icon: Icons.home_rounded, text: t.navigation.home),
                GButton(icon: Icons.store_rounded, text: t.navigation.device),
                GButton(icon: Icons.receipt_rounded, text: t.navigation.orders),
                GButton(icon: Icons.person_rounded, text: t.navigation.profile),
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
