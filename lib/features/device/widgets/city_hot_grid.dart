import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/device/entities/city_model.dart';
import 'package:lunchbox/features/device/widgets/city_chip.dart';

/// 热门城市网格组件
class CityHotGrid extends StatelessWidget {
  const CityHotGrid({required this.cities, required this.onSelect, super.key});

  final List<CityModel> cities;
  final ValueChanged<CityModel> onSelect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      color: theme.scaffoldBackgroundColor,
      child: Wrap(
        spacing: 12.w,
        runSpacing: 12.h,
        children: cities
            .map((city) => CityChip(city: city, onSelect: onSelect))
            .toList(),
      ),
    );
  }
}
