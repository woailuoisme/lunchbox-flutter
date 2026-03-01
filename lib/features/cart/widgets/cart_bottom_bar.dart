import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 购物车底部结算栏组件
class CartBottomBar extends StatelessWidget {
  const CartBottomBar({
    super.key,
    required this.totalQuantity,
    required this.totalAmount,
    required this.isEmpty,
    required this.onCheckout,
  });
  final int totalQuantity;
  final double totalAmount;
  final bool isEmpty;
  final VoidCallback onCheckout;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.fromLTRB(
        24.w,
        16.h,
        24.w,
        MediaQuery.of(context).padding.bottom + 16.h,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.08),
            offset: const Offset(0, -4),
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      t.cart.total,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: theme.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (totalQuantity > 0) ...[
                      SizedBox(width: 6.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          '$totalQuantity',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 4.h),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '¥',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.error,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      TextSpan(
                        text: totalAmount.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w800,
                          color: theme.colorScheme.error,
                          height: 1.1,
                          letterSpacing: -0.5,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            flex: 3,
            child: FilledButton(
              onPressed: isEmpty ? null : onCheckout,
              style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
                backgroundColor: theme.colorScheme.primary,
                disabledBackgroundColor:
                    theme.colorScheme.surfaceContainerHighest,
              ),
              child: Text(
                t.cart.checkout,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
