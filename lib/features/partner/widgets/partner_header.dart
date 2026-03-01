import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 合作申请页面的头部组件
/// 展示标题和副标题，带有渐变背景
class PartnerHeader extends StatelessWidget {
  const PartnerHeader({required this.title, required this.subtitle, super.key});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primaryContainer,
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle,
            style: TextStyle(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.8),
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
