import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/device/providers/city_provider.dart';

/// 设备列表城市选择入口组件
class DeviceCitySelector extends ConsumerWidget {
  const DeviceCitySelector({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final selectedCityAsync = ref.watch(selectedCityProvider);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 8.w),
        height: 50.h,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: theme.colorScheme.outlineVariant),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: selectedCityAsync.when(
          data: (city) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                city?.name ?? '深圳市',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.keyboard_arrow_down, size: 20.sp),
            ],
          ),
          loading: () => SizedBox(
            height: 20.h,
            width: 20.h,
            child: const CircularProgressIndicator(strokeWidth: 2),
          ),
          error: (_, _) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '选择城市',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.keyboard_arrow_down, size: 20.sp),
            ],
          ),
        ),
      ),
    );
  }
}
