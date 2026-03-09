import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 抽奖结果弹窗
///
/// 区分中奖（展示奖品名）和未中奖（展示参与感谢）
class LotteryResultDialog extends StatelessWidget {
  const LotteryResultDialog({required this.prizeName, super.key});

  final String prizeName;

  /// 是否为"谢谢参与"（无实际奖品）
  bool get _isThankYou => prizeName == t.lottery.thankYou;

  /// 显示弹窗的便捷静态方法
  static Future<void> show(BuildContext context, String prizeName) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => LotteryResultDialog(prizeName: prizeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _isThankYou ? Symbols.sentiment_satisfied : Symbols.celebration,
              size: 72.w,
              color: _isThankYou ? colorScheme.outline : Colors.amber,
              fill: 1.0,
            ),
            SizedBox(height: 12.h),
            Text(
              _isThankYou
                  ? t.lottery.thanksForParticipating
                  : t.lottery.congratulations,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              prizeName,
              style: TextStyle(
                fontSize: 22.sp,
                color: _isThankYou
                    ? colorScheme.onSurfaceVariant
                    : colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
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
                child: Text(t.lottery.accept),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
