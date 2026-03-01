import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 社群头部组件
///
/// 显示红色背景的引导标题和副标题
class CommunityHeader extends StatelessWidget {
  const CommunityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 30.h),
      color: colorScheme.primary,
      child: Column(
        children: [
          Text(
            t.community.join,
            style: TextStyle(
              color: colorScheme.onPrimary,
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            t.community.share,
            style: TextStyle(
              color: colorScheme.onPrimary.withValues(alpha: 0.9),
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
