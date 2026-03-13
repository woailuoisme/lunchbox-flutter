import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lunchbox/features/home/providers/home_provider.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/routes.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// 首页欢迎区和主要操作按钮组件
class HomeWelcomeSection extends ConsumerWidget {
  const HomeWelcomeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final homeState = ref.watch(homeProvider);
    final nearestDevice = homeState.value?.nearestDevice;
    final isLoading = homeState.isLoading;

    return Skeletonizer(
      enabled: isLoading,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.home.welcome,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Icon(
                  Symbols.location_on,
                  size: 14.sp,
                  color: colorScheme.primary,
                ),
                SizedBox(width: 4.w),
                Text(
                  isLoading
                      ? t.home.locatingDevice
                      : (nearestDevice != null
                            ? t.home.nearestDevice(
                                name: nearestDevice.name,
                                distance: nearestDevice.distanceKm,
                              )
                            : t.home.noAvailableDevice),
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    const DeviceRoute().go(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer.withValues(
                        alpha: 0.3,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: colorScheme.primary.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Symbols.store,
                          size: 14.sp,
                          color: colorScheme.primary,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          t.home.moreDevices,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Icon(
                          Symbols.chevron_right,
                          size: 14.sp,
                          color: colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    context,
                    title: t.home.selfPickup,
                    subtitle: t.home.selfPickupHint,
                    icon: Symbols.storefront,
                    color: colorScheme.primary,
                    onTap: () {
                      const DeviceRoute().go(context);
                    },
                    iconColor: colorScheme.onPrimary,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: _buildActionButton(
                    context,
                    title: t.home.teamOrder,
                    subtitle: t.home.teamOrderHint,
                    icon: Symbols.moped,
                    color: colorScheme.primary,
                    onTap: () {
                      const TeamOrderingRoute().push<void>(context);
                    },
                    iconColor: colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 构建点餐按钮
  Widget _buildActionButton(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    VoidCallback? onTap,
    Color? iconColor,
  }) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      openBuilder: (context, _) {
        return const SizedBox();
      },
      closedElevation: 0,
      closedColor: Colors.transparent,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      tappable: false,
      closedBuilder: (context, openContainer) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(icon, color: iconColor ?? Colors.white, size: 24.sp),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 10.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).animate().scale(
      duration: 400.ms,
      curve: Curves.easeOutBack,
      begin: const Offset(0.9, 0.9),
    );
  }
}
