import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 奖品统计卡片组件
/// 展示奖品总数、已使用和可用数量
class PrizeStatsCard extends StatelessWidget {
  const PrizeStatsCard({
    required this.totalCount,
    required this.usedCount,
    required this.availableCount,
    super.key,
  });

  final int totalCount;
  final int usedCount;
  final int availableCount;

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
          Row(
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
                    t.home.lottery.prizes,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    '查看您获得的所有奖品',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(
                totalCount.toString(),
                t.home.lottery.prizeStats.total,
                colorScheme,
                isPrimary: true,
              ),
              Container(
                width: 1,
                height: 30.h,
                color: colorScheme.outlineVariant,
              ),
              _buildStatItem(
                usedCount.toString(),
                t.home.lottery.prizeStats.used,
                colorScheme,
              ),
              Container(
                width: 1,
                height: 30.h,
                color: colorScheme.outlineVariant,
              ),
              _buildStatItem(
                availableCount.toString(),
                t.home.lottery.prizeStats.available,
                colorScheme,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 构建单个统计项
  Widget _buildStatItem(
    String value,
    String label,
    ColorScheme colorScheme, {
    bool isPrimary = false,
  }) {
    return Column(
      children: [
        Text(
          value,
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
