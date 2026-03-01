import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 优惠券列表为空时的占位组件
class CouponEmptyState extends StatelessWidget {
  const CouponEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Symbols.airplane_ticket,
            size: 64.sp,
            color: theme.disabledColor,
          ),
          SizedBox(height: 16.h),
          Text(
            t.coupon.noCoupons,
            style: TextStyle(color: theme.hintColor, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
