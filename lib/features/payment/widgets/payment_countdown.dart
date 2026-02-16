import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 支付倒计时组件
class PaymentCountdown extends StatelessWidget {
  const PaymentCountdown({
    super.key,
    required this.countdownText,
    required this.countdownSeconds,
  });

  final String countdownText;
  final int countdownSeconds;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          t.payment.remainingTime,
          style: TextStyle(
            fontSize: 14.sp,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          countdownText,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: countdownSeconds < 60
                ? theme.colorScheme.error
                : theme.colorScheme.primary,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}
