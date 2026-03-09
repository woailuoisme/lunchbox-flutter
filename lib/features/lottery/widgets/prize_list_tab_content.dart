import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/lottery/entities/lottery_record_response.dart';
import 'package:lunchbox/features/lottery/widgets/prize_card.dart';

/// 奖品列表内容组件
/// 处理奖品列表的显示，包括空状态
class PrizeListTabContent extends StatelessWidget {
  const PrizeListTabContent({required this.records, super.key});

  final List<LotteryRecordResponse> records;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (records.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Symbols.inbox, size: 64.w, color: colorScheme.outlineVariant),
            SizedBox(height: 16.h),
            Text(
              '暂无奖品',
              style: TextStyle(color: colorScheme.outline, fontSize: 14.sp),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: records.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final record = records[index];
        return PrizeCard(record: record)
            .animate(delay: (index * 50).ms)
            .fadeIn(duration: 400.ms)
            .slideX(begin: 0.1, end: 0, curve: Curves.easeOut);
      },
    );
  }
}
