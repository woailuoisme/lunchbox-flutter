import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 奖品分类 TabBar（3 个 Tab：全部 / 已中奖 / 未中奖）
class PrizeTabBar extends StatelessWidget {
  const PrizeTabBar({super.key, required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: TabBar(
        controller: controller,
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurfaceVariant,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          color: colorScheme.primaryContainer.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        indicatorPadding: EdgeInsets.all(4.w),
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        tabs: [
          Tab(text: t.lottery.tabs.all),
          Tab(text: t.lottery.tabs.win),
          Tab(text: t.lottery.tabs.lose),
        ],
      ),
    );
  }
}
