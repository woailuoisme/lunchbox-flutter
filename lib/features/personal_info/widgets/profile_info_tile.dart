import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 个人信息列表项组件
/// 展示图标、标签、值，并支持点击交互
class ProfileInfoTile extends StatelessWidget {
  const ProfileInfoTile({
    required this.icon,
    required this.label,
    required this.value,
    this.isEditable = true,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool isEditable;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return InkWell(
      onTap: isEditable ? onTap : null,
      splashColor: theme.colorScheme.primary.withValues(alpha: 0.05),
      highlightColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: [
            // 图标容器
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, size: 20.sp, color: theme.colorScheme.primary),
            ),
            SizedBox(width: 14.w),

            // 标签
            Text(
              label,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.9),
              ),
            ),

            SizedBox(width: 16.w),

            // 值
            Expanded(
              child: Text(
                value,
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color:
                      (value == "未设置" ||
                          value == "Not set" ||
                          value == t.profile.info.notSet)
                      ? theme.hintColor.withValues(alpha: 0.5)
                      : theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ),

            if (isEditable) ...[
              SizedBox(width: 4.w),
              Icon(
                Symbols.chevron_right,
                size: 18.sp,
                color: theme.hintColor.withValues(alpha: 0.3),
              ),
            ] else
              SizedBox(width: 22.w), // 保持非编辑态的对齐间距
          ],
        ),
      ),
    );
  }
}
