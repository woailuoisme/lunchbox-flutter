import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/device/entities/city_model.dart';
import 'package:lunchbox/features/device/providers/city_provider.dart';

/// 城市列表项组件
class CityItem extends ConsumerWidget {
  const CityItem({required this.city, required this.onSelect, super.key});

  final CityModel city;
  final ValueChanged<CityModel> onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final selectedCityAsync = ref.watch(selectedCityProvider);
    final selectedCity = selectedCityAsync.asData?.value;
    final isSelected = selectedCity?.code == city.code;

    return ColoredBox(
      color: theme.colorScheme.surface,
      child: ListTile(
        title: Text(
          city.name,
          style: TextStyle(
            fontSize: 16.sp,
            color: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.onSurface,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        trailing: isSelected
            ? Icon(
                Icons.check_circle,
                color: theme.colorScheme.primary,
                size: 24.sp,
              )
            : null,
        onTap: () => onSelect(city),
      ),
    );
  }
}
