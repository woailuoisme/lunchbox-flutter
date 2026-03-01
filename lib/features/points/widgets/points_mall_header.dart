import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 积分商城顶部余额展示组件
class PointsMallHeader extends StatelessWidget {
  const PointsMallHeader({
    required this.balance,
    required this.unitText,
    super.key,
  });

  /// 当前积分余额
  final int balance;

  /// 积分单位文案
  final String unitText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            unitText,
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '$balance',
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Monospace',
            ),
          ),
        ],
      ),
    );
  }
}
