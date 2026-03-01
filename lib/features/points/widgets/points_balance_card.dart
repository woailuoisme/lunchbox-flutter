import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';

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

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.primary.withValues(alpha: 0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Symbols.monetization_on,
                      size: 18.sp,
                      color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      title,
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary.withValues(
                          alpha: 0.9,
                        ),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (isLoading)
                      SizedBox(
                        height: 36.sp,
                        width: 36.sp,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            theme.colorScheme.onPrimary,
                          ),
                        ),
                      )
                    else
                      Text(
                        '$points',
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.bold,
                          height: 1.0,
                        ),
                      ),
                    GestureDetector(
                      onTap: onRecordsTap,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface.withValues(
                            alpha: 0.2,
                          ),
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(
                            color: theme.colorScheme.surface.withValues(
                              alpha: 0.3,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Symbols.history,
                              color: theme.colorScheme.onPrimary,
                              size: 16.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              recordsLabel,
                              style: TextStyle(
                                color: theme.colorScheme.onPrimary,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: -20,
            top: -20,
            child: Icon(
              Symbols.monetization_on,
              size: 120.sp,
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.1),
            ),
          ),
        ],
      ),
    );
  }
}
