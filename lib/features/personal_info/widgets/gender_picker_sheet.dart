import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 性别选择底部弹窗
class GenderPickerSheet extends StatelessWidget {
  const GenderPickerSheet({
    super.key,
    required this.selectedGender,
    required this.onSelected,
  });

  final String? selectedGender;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 12.h),
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: theme.dividerColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 24.h),
          _buildOption(context, 'male', t.profile.gender.male),
          _buildOption(context, 'female', t.profile.gender.female),
          _buildOption(context, 'unknown', t.profile.gender.unknown),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context, String value, String label) {
    final isSelected = selectedGender == value;
    final theme = Theme.of(context);

    return ListTile(
      title: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected
              ? theme.colorScheme.primary
              : theme.textTheme.bodyLarge?.color,
        ),
      ),
      trailing: isSelected
          ? Icon(Symbols.check, color: theme.colorScheme.primary)
          : null,
      onTap: () {
        onSelected(value);
        Navigator.pop(context);
      },
    );
  }
}
