import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/auth/providers/signin_state.dart';
import 'package:lunchbox/i18n/translations.g.dart';

class SignInTypeSelector extends StatelessWidget {
  const SignInTypeSelector({
    super.key,
    required this.colorScheme,
    required this.tabController,
    required this.signInType,
    required this.onTabTap,
  });

  final ColorScheme colorScheme;
  final TabController tabController;
  final SignInType signInType;
  final ValueChanged<int> onTabTap;

  @override
  Widget build(BuildContext context) {
    if (!tabController.indexIsChanging) {
      final targetIndex = signInType == SignInType.password ? 0 : 1;
      if (tabController.index != targetIndex) {
        tabController.animateTo(targetIndex);
      }
    }

    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: TabBar(
        controller: tabController,
        padding: EdgeInsets.all(4.w),
        labelColor: colorScheme.onPrimary,
        unselectedLabelColor: colorScheme.onSurfaceVariant,
        indicator: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
        tabs: [
          Tab(text: t.auth.passwordLoginTab),
          Tab(text: t.auth.codeLoginTab),
        ],
        onTap: onTabTap,
      ),
    );
  }
}
