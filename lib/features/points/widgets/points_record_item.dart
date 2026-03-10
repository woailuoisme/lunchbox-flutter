import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/points/entities/points_record_response.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 积分记录项组件
/// 展示单条积分变动记录（获取或消耗）
class PointsRecordItem extends StatelessWidget {
  const PointsRecordItem({required this.item, super.key});

  final PointsRecordResponse item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isGain = item.inte > 0;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: theme.dividerColor.withValues(alpha: 0.05),
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          _buildLeadingIcon(context, isGain),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.redemptionContent,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.titleMedium?.color,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  item.createdAt,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: theme.hintColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            isGain ? '+${item.inte}' : '${item.inte}',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
              color: isGain ? colorScheme.primary : colorScheme.error,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadingIcon(BuildContext context, bool isGain) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: 44.w,
      height: 44.w,
      decoration: BoxDecoration(
        color: isGain
            ? colorScheme.primary.withValues(alpha: 0.08)
            : colorScheme.error.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        isGain ? Symbols.add_circle : Symbols.do_not_disturb_on,
        color: isGain ? colorScheme.primary : colorScheme.error,
        size: 24.sp,
      ),
    );
  }
}
