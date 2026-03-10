import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 积分商城顶部余额展示组件
/// 采用精致的渐变卡片设计，支持余额变动动画
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
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary,
            colorScheme.primaryContainer.withValues(alpha: 0.8),
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
      child: Stack(
        children: [
          // 背景装饰图标
          Positioned(
            right: -10.w,
            bottom: -10.h,
            child: Icon(
              Symbols.database,
              size: 80.sp,
              color: colorScheme.onPrimary.withValues(alpha: 0.1),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Symbols.stars,
                    size: 18.sp,
                    color: colorScheme.onPrimary.withValues(alpha: 0.9),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    unitText,
                    style: TextStyle(
                      color: colorScheme.onPrimary.withValues(alpha: 0.9),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              TweenAnimationBuilder<int>(
                tween: IntTween(begin: 0, end: balance),
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeOutCirc,
                builder: (context, value, child) {
                  return Text(
                    '$value',
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
