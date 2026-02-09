import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/features/device/entities/device_model.dart';
import 'package:lunchbox/features/profile/providers/profile_notifier.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 收藏设备视图
class FavoriteDevicesView extends ConsumerWidget {
  const FavoriteDevicesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(t.profile.favoriteDevices)),
      body: state.favoriteDevices.isEmpty
          ? _buildEmptyState(context)
          : ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: state.favoriteDevices.length,
              itemBuilder: (context, index) {
                final device = state.favoriteDevices[index];
                return _buildDeviceCard(context, device, notifier);
              },
            ),
    );
  }

  /// 构建空状态
  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Symbols.favorite, size: 80.sp, color: theme.colorScheme.outline),
          SizedBox(height: 16.h),
          Text(
            t.profile.noFavoriteDevices,
            style: TextStyle(
              fontSize: 16.sp,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () => context.pop(),
            child: Text(t.cart.goShopping),
          ),
        ],
      ),
    );
  }

  /// 构建设备卡片
  Widget _buildDeviceCard(
    BuildContext context,
    DeviceModel device,
    ProfileNotifier notifier,
  ) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        onTap: () {
          context.push('${AppRoutes.deviceDetail}/${device.id}', extra: device);
        },
        borderRadius: BorderRadius.circular(8.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              // 设备图标
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  color: device.isOnline
                      ? theme.colorScheme.primary.withValues(alpha: 0.1)
                      : theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Symbols.storefront,
                  color: device.isOnline
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurfaceVariant,
                  size: 24.sp,
                ),
              ),

              SizedBox(width: 12.w),

              // 设备信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      device.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),

                    Row(
                      children: [
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            color: device.isOnline
                                ? theme.colorScheme.primary
                                : theme.colorScheme.outline,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          device.isOnline ? t.device.online : t.device.offline,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 4.h),

                    Row(
                      children: [
                        Icon(
                          Symbols.location_on,
                          size: 14.sp,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Text(
                            device.address,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // 取消收藏按钮
              IconButton(
                icon: Icon(
                  Symbols.favorite,
                  fill: 1,
                  color: theme.colorScheme.error,
                ),
                onPressed: () =>
                    _confirmRemoveFavorite(context, device, notifier),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 确认取消收藏
  Future<void> _confirmRemoveFavorite(
    BuildContext context,
    DeviceModel device,
    ProfileNotifier notifier,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.profile.removeFavorite),
        content: Text(t.profile.removeFavoriteConfirm(name: device.name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(t.common.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(t.common.confirm),
          ),
        ],
      ),
    );

    if (result ?? false) {
      await notifier.removeFavoriteDevice(device.id);
    }
  }
}
