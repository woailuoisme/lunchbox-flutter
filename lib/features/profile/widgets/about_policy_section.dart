import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/profile/widgets/section_title.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

class AboutPolicySection extends StatelessWidget {
  const AboutPolicySection({super.key, required this.onTapPolicy});

  final VoidCallback onTapPolicy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: t.about.policyTitle),
          SizedBox(height: 12.h),
          Container(
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 4.h,
              ),
              leading: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Symbols.description,
                  color: theme.colorScheme.primary,
                  size: 20.sp,
                ),
              ),
              title: Text(
                t.about.userAgreementAndPrivacy,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                t.about.viewDetails,
                style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
              ),
              trailing: Icon(
                Symbols.chevron_right,
                size: 20.sp,
                color: theme.hintColor,
              ),
              onTap: onTapPolicy,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
