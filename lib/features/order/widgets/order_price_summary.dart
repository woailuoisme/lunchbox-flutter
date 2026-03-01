import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 订单详情中的价格汇总行
class OrderPriceSummary extends StatelessWidget {
  const OrderPriceSummary({
    super.key,
    required this.label,
    required this.amount,
  });
  final String label;
  final String amount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 13.sp, color: theme.hintColor),
          ),
          Text(
            '¥$amount',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
