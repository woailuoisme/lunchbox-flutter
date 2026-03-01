import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 抽奖页面顶部标题卡片
/// 展示活动名称、副标题及剩余抽奖次数
class LotteryHeader extends StatelessWidget {
  const LotteryHeader({required this.remainingSpins, super.key});

  final int remainingSpins;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Symbols.card_giftcard,
            size: 48.w,
            color: colorScheme.primary,
            fill: 1.0,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.home.grid.lottery,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  t.home.lottery.subtitle,
                  style: TextStyle(fontSize: 12.sp, color: colorScheme.outline),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Flexible(
            flex: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                t.home.lottery.remaining(count: remainingSpins),
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
