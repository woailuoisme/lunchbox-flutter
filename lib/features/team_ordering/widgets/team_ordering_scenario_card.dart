import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 团队用餐场景卡片组件
class TeamOrderingScenarioCard extends StatelessWidget {
  const TeamOrderingScenarioCard({
    required this.icon,
    required this.title,
    required this.desc,
    super.key,
  });

  /// 图标（Emoji 或文本）
  final String icon;

  /// 场景标题
  final String title;

  /// 场景描述
  final String desc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(icon, style: TextStyle(fontSize: 32.sp)),
          SizedBox(height: 12.h),
          Text(
            title,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.sp,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
