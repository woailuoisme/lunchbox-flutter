import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines_plus/timelines_plus.dart';

/// 邀请规则区块组件
/// 使用 timelines_plus 构建垂直规则列表
class InviteRuleSection extends StatelessWidget {
  const InviteRuleSection({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.rules,
  });

  final String title;
  final IconData icon;
  final Color color;
  final List<String> rules;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 16.w,
                height: 16.w,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          FixedTimeline.tileBuilder(
            theme: TimelineThemeData(
              nodePosition: 0,
              connectorTheme: ConnectorThemeData(
                thickness: 1.5,
                color: color.withValues(alpha: 0.2),
              ),
              indicatorTheme: IndicatorThemeData(size: 8.w, color: color),
            ),
            builder: TimelineTileBuilder.connected(
              indicatorPositionBuilder: (context, index) => 0.5,
              indicatorBuilder: (context, index) =>
                  DotIndicator(size: 8.w, color: color),
              connectorBuilder: (context, index, type) =>
                  SolidLineConnector(color: color.withValues(alpha: 0.2)),
              contentsBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.h,
                ).copyWith(left: 12.w),
                child: Text(
                  rules[index],
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
              ),
              itemCount: rules.length,
            ),
          ),
        ],
      ),
    );
  }
}
