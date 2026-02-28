import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 个人中心资产展示项
class ProfileAssetItem extends StatelessWidget {
  const ProfileAssetItem({
    super.key,
    required this.value,
    required this.label,
    this.onTap,
  });

  final String value;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                color: theme.colorScheme.onPrimary.withValues(alpha: 0.8),
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
