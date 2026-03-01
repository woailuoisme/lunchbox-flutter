import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 团队用餐顶部横幅组件
class TeamOrderingHeader extends StatelessWidget {
  const TeamOrderingHeader({
    required this.title,
    required this.subtitle,
    required this.tags,
    super.key,
  });

  /// 横幅主标题
  final String title;

  /// 横幅副标题
  final String subtitle;

  /// 标签列表
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      height: 180.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [colorScheme.primaryContainer, colorScheme.primary],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: colorScheme.onPrimary,
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle,
            style: TextStyle(
              color: colorScheme.onPrimary.withValues(alpha: 0.8),
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: tags.map((tag) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: colorScheme.onPrimary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: colorScheme.onPrimary.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 10.sp,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
