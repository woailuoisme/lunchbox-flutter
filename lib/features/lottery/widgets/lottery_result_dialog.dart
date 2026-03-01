import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 抽奖结果弹窗
/// 展示中奖图标、恭喜语、奖品名称及领取按钮
class LotteryResultDialog extends StatelessWidget {
  const LotteryResultDialog({required this.prizeName, super.key});

  final String prizeName;

  /// 显示结果弹窗的便捷方法
  static Future<void> show(BuildContext context, String prizeName) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => LotteryResultDialog(prizeName: prizeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Symbols.celebration,
              size: 80.w,
              color: Colors.amber,
              fill: 1.0,
            ),
            SizedBox(height: 16.h),
            Text(
              t.home.lottery.congratulations,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              prizeName,
              style: TextStyle(
                fontSize: 24.sp,
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Text(t.home.lottery.accept),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
