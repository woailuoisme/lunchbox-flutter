import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/lottery/entities/lottery_prize.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 奖品卡片组件
/// 展示奖品名称、数量、状态及有效期
class PrizeCard extends StatelessWidget {
  const PrizeCard({required this.prize, super.key});

  final LotteryPrize prize;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isExpired =
        prize.expiredAt != null && prize.expiredAt!.isBefore(DateTime.now());
    final isUsed = prize.isUsed;

    // 状态标签配置
    Color statusColor;
    String statusText;
    IconData statusIcon;

    if (isUsed) {
      statusColor = colorScheme.outline;
      statusText = '已使用';
      statusIcon = Symbols.check_circle;
    } else if (isExpired) {
      statusColor = colorScheme.error;
      statusText = '已过期';
      statusIcon = Symbols.cancel;
    } else {
      statusColor = Colors.green;
      statusText = '可使用';
      statusIcon = Symbols.check_circle;
    }

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                  color: isUsed || isExpired
                      ? colorScheme.surfaceContainerHighest
                      : Colors.amber.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Symbols.star,
                  color: isUsed || isExpired
                      ? colorScheme.outline
                      : Colors.amber,
                  size: 32.w,
                  fill: 1.0,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${prize.amount.toInt()} ${t.points.unit}',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: isUsed || isExpired
                                ? colorScheme.onSurfaceVariant
                                : colorScheme.onSurface,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(statusIcon, size: 14.w, color: statusColor),
                              SizedBox(width: 4.w),
                              Text(
                                statusText,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: statusColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '可在${t.points.mall}兑换商品',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Divider(
              height: 1,
              color: colorScheme.outlineVariant.withValues(alpha: 0.3),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '获得时间: ${prize.createdAt.toString().substring(0, 16)}',
                style: TextStyle(fontSize: 11.sp, color: colorScheme.outline),
              ),
              if (prize.expiredAt != null)
                Text(
                  '有效期至: ${prize.expiredAt.toString().substring(0, 16)}',
                  style: TextStyle(fontSize: 11.sp, color: colorScheme.outline),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
