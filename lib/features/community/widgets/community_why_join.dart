import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 加入社群理由组件
///
/// 以列表形式展示加入社群的具体好处
class CommunityWhyJoin extends StatelessWidget {
  const CommunityWhyJoin({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorScheme.primaryContainer),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.community.whyJoin,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 16.h),
          _WhyJoinBulletPoint(text: t.community.reason1),
          _WhyJoinBulletPoint(text: t.community.reason2),
          _WhyJoinBulletPoint(text: t.community.reason3),
          _WhyJoinBulletPoint(text: t.community.reason4),
        ],
      ),
    );
  }
}

class _WhyJoinBulletPoint extends StatelessWidget {

  const _WhyJoinBulletPoint({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: Container(
              width: 4.w,
              height: 4.w,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13.sp,
                color: colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
