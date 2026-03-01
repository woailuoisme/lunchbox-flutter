import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return InkWell(
      onTap: isEditable ? onTap : null,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: [
            Icon(icon, size: 20.sp, color: theme.colorScheme.primary),
            SizedBox(width: 12.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 15.sp,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: TextStyle(fontSize: 15.sp, color: theme.hintColor),
            ),
            if (isEditable) ...[
              SizedBox(width: 4.w),
              Icon(Symbols.chevron_right, size: 20.sp, color: theme.hintColor),
            ],
          ],
        ),
      ),
    );
  }
}
