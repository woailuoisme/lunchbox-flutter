import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 社群特色功能列表组件
///
/// 显示加入社群可享受的福利特色
class CommunityFeatures extends StatelessWidget {
  const CommunityFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final features = [
      {
        'icon': Symbols.card_giftcard,
        'title': t.community.features.coupon,
        'subtitle': t.community.features.couponHint,
        'color': colorScheme.primary,
      },
      {
        'icon': Symbols.group,
        'title': t.community.features.activity,
        'subtitle': t.community.features.activityHint,
        'color': colorScheme.primary,
      },
      {
        'icon': Symbols.forum,
        'title': t.community.features.topic,
        'subtitle': t.community.features.topicHint,
        'color': colorScheme.primary,
      },
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          top: BorderSide(color: colorScheme.outlineVariant, width: 0.5),
        ),
      ),
      child: Column(
        children: features
            .map(
              (d) => _CommunityFeatureItem(
                icon: d['icon'] as IconData,
                title: d['title'] as String,
                subtitle: d['subtitle'] as String,
                iconColor: d['color'] as Color,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _CommunityFeatureItem extends StatelessWidget {
  const _CommunityFeatureItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            alignment: Alignment.center,
            child: Icon(icon, size: 24.sp, color: iconColor),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12.sp, color: colorScheme.outline),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
