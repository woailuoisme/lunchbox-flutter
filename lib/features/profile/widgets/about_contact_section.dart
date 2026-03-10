import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/profile/widgets/section_title.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

class AboutContactSection extends StatelessWidget {
  const AboutContactSection({
    super.key,
    required this.onTapPhone,
    required this.onTapAddress,
  });

  final VoidCallback onTapPhone;
  final VoidCallback onTapAddress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: t.about.contactTitle),
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
            child: Column(
              children: [
                _AboutContactTile(
                  icon: Symbols.phone,
                  title: t.about.customerServiceHotline,
                  subtitle: t.about.customerServiceNumber,
                  onTap: onTapPhone,
                  isFirst: true,
                ),
                Divider(
                  height: 1,
                  indent: 56.w,
                  color: theme.dividerColor.withValues(alpha: 0.5),
                ),
                _AboutContactTile(
                  icon: Symbols.location_on,
                  title: t.about.companyAddress,
                  subtitle: t.about.addressDetails,
                  onTap: onTapAddress,
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutContactTile extends StatelessWidget {
  const _AboutContactTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isFirst = false,
    this.isLast = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      leading: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: theme.colorScheme.primary, size: 20.sp),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 4.h),
        child: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),
      ),
      trailing: Icon(
        Symbols.chevron_right,
        size: 20.sp,
        color: theme.hintColor,
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: isFirst ? Radius.circular(16.r) : Radius.zero,
          bottom: isLast ? Radius.circular(16.r) : Radius.zero,
        ),
      ),
    );
  }
}
