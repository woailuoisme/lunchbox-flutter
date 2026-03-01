import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 积分模块空状态组件
/// 用于记录列表或商品列表为空时的统一占位展示
class PointsEmptyState extends StatelessWidget {
  const PointsEmptyState({
    required this.message,
    this.icon = Symbols.history,
    super.key,
  });

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48.sp, color: theme.disabledColor),
            SizedBox(height: 8.h),
            Text(
              message,
              style: TextStyle(color: theme.disabledColor, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
