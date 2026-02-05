import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/app_routes.dart';
import '../../device/entities/device_model.dart';
import '../providers/profile_notifier.dart';

/// 收藏设备视图
class FavoriteDevicesView extends ConsumerWidget {
  const FavoriteDevicesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('收藏设备')),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80.sp, color: Colors.grey),
          SizedBox(height: 16.h),
          Text(
            '暂无收藏设备',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () => context.pop(),
            child: const Text('去逛逛'),
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
                      ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.storefront,
                  color: device.isOnline
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
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
                            color: device.isOnline ? Colors.green : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          device.isOnline ? '营业中' : '已打烊',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 4.h),

                    Row(
                      children: [
                        Icon(
                          Icons.place_outlined,
                          size: 14.sp,
                          color: Colors.grey[600],
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Text(
                            device.address,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[600],
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
                icon: const Icon(Icons.favorite, color: Colors.red),
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
        title: const Text('取消收藏'),
        content: Text('确定要取消收藏"${device.name}"吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('确定'),
          ),
        ],
      ),
    );

    if (result ?? false) {
      await notifier.removeFavoriteDevice(device.id);
    }
  }
}
