import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/lottery/entities/lottery_record_response.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 奖品记录卡片
///
/// 展示单条抽奖记录：奖品名称、价值、时间、中奖状态
class PrizeCard extends StatelessWidget {
  const PrizeCard({required this.record, super.key});

  final LotteryRecordResponse record;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isWin = record.result == 'win';
    final prizeName =
        record.prize?.name ??
        (isWin ? t.lottery.prizeCard.reward : t.lottery.thankYou);
    final createdStr = record.createdAt != null
        ? record.createdAt.toString().substring(0, 16)
        : '';

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
              _PrizeIcon(isWin: isWin, colorScheme: colorScheme),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            prizeName,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: isWin
                                  ? colorScheme.onSurface
                                  : colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        _StatusBadge(isWin: isWin, colorScheme: colorScheme),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${t.lottery.prizes}: ${record.prizeValue} ${record.prizeType}',
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
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Divider(
              height: 1,
              color: colorScheme.outlineVariant.withValues(alpha: 0.3),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.lottery.prizeCard.id(id: record.id.toString()),
                style: TextStyle(fontSize: 11.sp, color: colorScheme.outline),
              ),
              if (createdStr.isNotEmpty)
                Text(
                  t.lottery.prizeCard.getTime(time: createdStr),
                  style: TextStyle(fontSize: 11.sp, color: colorScheme.outline),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PrizeIcon extends StatelessWidget {
  const _PrizeIcon({required this.isWin, required this.colorScheme});

  final bool isWin;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52.w,
      height: 52.w,
      decoration: BoxDecoration(
        color: isWin
            ? Colors.amber.withValues(alpha: 0.1)
            : colorScheme.surfaceContainerHighest,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Icon(
        isWin ? Symbols.star : Symbols.sentiment_dissatisfied,
        color: isWin ? Colors.amber : colorScheme.outline,
        size: 28.w,
        fill: 1.0,
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.isWin, required this.colorScheme});

  final bool isWin;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final color = isWin ? Colors.green : colorScheme.outline;
    final icon = isWin ? Symbols.check_circle : Symbols.cancel;
    final label = isWin
        ? t.lottery.prizeCard.obtained
        : t.lottery.prizeCard.notWon;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12.w, color: color),
          SizedBox(width: 3.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
