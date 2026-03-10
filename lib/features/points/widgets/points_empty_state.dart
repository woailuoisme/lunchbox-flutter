import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 24.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.3,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 64.sp,
                    color: theme.disabledColor.withValues(alpha: 0.5),
                  ),
                )
                .animate(onPlay: (c) => c.repeat(reverse: true))
                .moveY(
                  begin: -5,
                  end: 5,
                  duration: 2.seconds,
                  curve: Curves.easeInOut,
                ),
            SizedBox(height: 16.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.disabledColor,
                fontSize: 15.sp,
                height: 1.5,
              ),
            ).animate().fadeIn(duration: 600.ms),
          ],
        ),
      ),
    );
  }
}
