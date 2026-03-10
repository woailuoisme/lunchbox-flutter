import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// 积分余额卡片组件
/// 用于展示当前用户的积分总额及相关操作入口
class PointsBalanceCard extends StatelessWidget {
  const PointsBalanceCard({
    required this.points,
    required this.title,
    required this.recordsLabel,
    this.isLoading = false,
    this.onRecordsTap,
    super.key,
  });

  final int points;
  final String title;
  final String recordsLabel;
  final bool isLoading;
  final VoidCallback? onRecordsTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: EdgeInsets.all(16.w),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary,
                  colorScheme.primaryContainer.withValues(alpha: 0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Symbols.stars,
                          size: 18.sp,
                          color: colorScheme.onPrimary.withValues(alpha: 0.9),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          title,
                          style: TextStyle(
                            color: colorScheme.onPrimary.withValues(alpha: 0.9),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    if (onRecordsTap != null) _buildRecordsButton(context),
                  ],
                ),
                SizedBox(height: 24.h),
                if (isLoading)
                  _buildLoadingShimmer()
                else
                  TweenAnimationBuilder<int>(
                    tween: IntTween(begin: 0, end: points),
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOutExpo,
                    builder: (context, value, _) => Text(
                      '$value',
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 48.sp,
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // 背景装饰
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(
              Symbols.database,
              size: 120.sp,
              color: colorScheme.onPrimary.withValues(alpha: 0.08),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordsButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onRecordsTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: colorScheme.onPrimary.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: colorScheme.onPrimary.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              recordsLabel,
              style: TextStyle(
                color: colorScheme.onPrimary,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 4.w),
            Icon(
              Symbols.chevron_right,
              color: colorScheme.onPrimary,
              size: 14.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingShimmer() {
    return Container(
      width: 100.w,
      height: 48.sp,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
    ).animate(onPlay: (c) => c.repeat()).shimmer(duration: 1.5.seconds);
  }
}
