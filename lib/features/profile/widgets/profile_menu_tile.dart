import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 个人中心菜单列表项
class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailingText,
    this.trailingColor,
    this.onTap,
    this.showDivider = true,
  });

  final IconData icon;
  final String title;
  final String? trailingText;
  final Color? trailingColor;
  final VoidCallback? onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          border: showDivider
              ? Border(
                  bottom: BorderSide(color: theme.dividerColor, width: 1.h),
                )
              : null,
        ),
        child: Row(
          children: [
            Icon(icon, size: 24.sp, color: theme.colorScheme.primary),
            SizedBox(width: 16.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 15.sp,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
            const Spacer(),
            if (trailingText != null)
              Text(
                trailingText!,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: trailingColor ?? theme.hintColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            SizedBox(width: 4.w),
            Icon(
              Symbols.chevron_right,
              size: 20.sp,
              color: theme.disabledColor,
            ),
          ],
        ),
      ),
    );
  }
}
