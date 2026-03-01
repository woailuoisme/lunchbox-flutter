import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 优惠券空状态组件
class CouponEmptyState extends StatelessWidget {
  const CouponEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Symbols.confirmation_number,
            size: 64.r,
            color: colorScheme.outlineVariant,
          ),
          SizedBox(height: 16.h),
          Text(
            '暂无优惠券',
            style: TextStyle(color: colorScheme.outline, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
