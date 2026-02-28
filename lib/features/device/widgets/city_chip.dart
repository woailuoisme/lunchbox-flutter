import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/device/entities/city_model.dart';

/// 城市芯片组件
class CityChip extends StatelessWidget {
  const CityChip({required this.city, required this.onSelect, super.key});

  final CityModel city;
  final ValueChanged<CityModel> onSelect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => onSelect(city),
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: Text(
          city.name,
          style: TextStyle(fontSize: 14.sp, color: theme.colorScheme.onSurface),
        ),
      ),
    );
  }
}
