import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:lunchbox/core/widgets/map/lunchbox_map.dart';

/// 设备列表地图预览组件
class DeviceMapPreview extends StatelessWidget {
  const DeviceMapPreview({
    required this.mapController,
    required this.center,
    required this.isLocating,
    required this.onLocate,
    super.key,
  });

  final MapController mapController;
  final LatLng center;
  final bool isLocating;
  final VoidCallback onLocate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      height: 240.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Stack(
          children: [
            LunchboxMap(
              mapController: mapController,
              center: center,
              zoom: 13.0,
              markers: [
                Marker(
                  point: center,
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.location_on,
                    color: theme.colorScheme.primary,
                    size: 40,
                  ),
                ),
              ],
            ),
            Positioned(
              right: 12.w,
              top: 12.h,
              child: Column(
                children: [
                  _buildMapTool(
                    Icons.search,
                    theme: theme,
                    onTap: () {
                      // TODO: 地图搜索
                    },
                  ),
                  SizedBox(height: 8.h),
                  _buildMapTool(
                    isLocating ? Icons.gps_not_fixed : Icons.my_location,
                    theme: theme,
                    color: theme.colorScheme.primary,
                    onTap: onLocate,
                    isLoading: isLocating,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapTool(
    IconData icon, {
    required ThemeData theme,
    Color? color,
    VoidCallback? onTap,
    bool isLoading = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.w,
        height: 36.w,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: isLoading && icon == Icons.gps_not_fixed
            ? Padding(
                padding: EdgeInsets.all(8.w),
                child: CircularProgressIndicator(
                  strokeWidth: 2.w,
                  color: color ?? theme.colorScheme.onSurfaceVariant,
                ),
              )
            : Icon(
                icon,
                size: 20.sp,
                color: color ?? theme.colorScheme.onSurfaceVariant,
              ),
      ),
    );
  }
}
