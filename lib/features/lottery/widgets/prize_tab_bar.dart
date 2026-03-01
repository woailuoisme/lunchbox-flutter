import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 奖品分类 TabBar
///
/// 用于在“我的奖品”页面中切换不同状态的奖品列表
class PrizeTabBar extends StatelessWidget {
  /// 构造函数
  const PrizeTabBar({super.key, required this.controller});

  /// Tab 控制器
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
        tabs: const [
          Tab(text: '全部'),
          Tab(text: '可用'),
          Tab(text: '已使用'),
          Tab(text: '已过期'),
        ],
      ),
    );
  }
}
