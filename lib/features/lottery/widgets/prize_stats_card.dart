import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 奖品统计卡片（展示总次数、已中奖数量、已发放数量）
class PrizeStatsCard extends StatelessWidget {
  const PrizeStatsCard({
    required this.totalCount,
    required this.winCount,
    required this.distributedCount,
    super.key,
  });

  /// 总抽奖次数
  final int totalCount;

  /// 已中奖次数
  final int winCount;

  /// 已发放次数
  final int distributedCount;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 8.w),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryContainer,
            colorScheme.surfaceContainerHighest,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          _Header(colorScheme: colorScheme),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _StatItem(
                value: totalCount,
                label: t.lottery.prizeStats.total,
                colorScheme: colorScheme,
                isPrimary: true,
              ),
              _Divider(colorScheme: colorScheme),
              _StatItem(
                value: winCount,
                label: t.lottery.prizeStats.win,
                colorScheme: colorScheme,
              ),
              _Divider(colorScheme: colorScheme),
              _StatItem(
                value: distributedCount,
                label: t.lottery.prizeStats.distributed,
                colorScheme: colorScheme,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: colorScheme.surface.withValues(alpha: 0.6),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Symbols.card_giftcard,
            size: 32.w,
            color: colorScheme.primary,
            fill: 1.0,
          ),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.lottery.prizes,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            Text(
              t.lottery.prizeStats.viewAll,
              style: TextStyle(
                fontSize: 12.sp,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.value,
    required this.label,
    required this.colorScheme,
    this.isPrimary = false,
  });

  final int value;
  final String label;
  final ColorScheme colorScheme;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$value',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
            color: isPrimary ? colorScheme.primary : colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1,
      height: 30.h,
      child: ColoredBox(color: colorScheme.outlineVariant),
    );
  }
}
