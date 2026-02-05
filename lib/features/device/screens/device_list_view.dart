import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../entities/device_model.dart';
import '../providers/device_providers.dart';

/// 设备列表视图
class DeviceListView extends ConsumerWidget {
  const DeviceListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devicesAsync = ref.watch(filteredDevicesProvider);
    final onlineOnly = ref.watch(deviceFilterOnlineProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('附近设备'),
        actions: [
          // 排序按钮
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort),
            onSelected: (value) {
              ref.read(deviceSortProvider.notifier).set(value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'distance', child: Text('按距离排序')),
              const PopupMenuItem(value: 'name', child: Text('按名称排序')),
            ],
          ),
          // 过滤按钮
          IconButton(
            icon: Icon(
              onlineOnly ? Icons.filter_alt : Icons.filter_alt_outlined,
            ),
            onPressed: () {
              ref.read(deviceFilterOnlineProvider.notifier).toggle();
            },
            tooltip: '仅显示在线设备',
          ),
        ],
      ),
      body: devicesAsync.when(
        data: (devices) {
          if (devices.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.devices_other, size: 64.sp, color: Colors.grey),
                  SizedBox(height: 16.h),
                  Text(
                    '附近暂无设备',
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {
                      ref.invalidate(rawDevicesProvider);
                    },
                    child: const Text('刷新'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(rawDevicesProvider);
            },
            child: ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: devices.length,
              itemBuilder: (context, index) {
                final device = devices[index];
                return _buildDeviceCard(context, device);
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64.sp, color: Colors.red),
              SizedBox(height: 16.h),
              Text(
                '加载失败',
                style: TextStyle(fontSize: 16.sp, color: Colors.red),
              ),
              Text(error.toString()),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(rawDevicesProvider);
                },
                child: const Text('重试'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 构建设备卡片
  Widget _buildDeviceCard(BuildContext context, DeviceModel device) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        onTap: () => context.push('/device/${device.id}'),
        borderRadius: BorderRadius.circular(8.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 设备名称和状态
              Row(
                children: [
                  Expanded(
                    child: Text(
                      device.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildStatusBadge(device),
                ],
              ),
              SizedBox(height: 8.h),

              // 地址
              Row(
                children: [
                  Icon(Icons.location_on, size: 16.sp, color: Colors.grey),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      device.address,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),

              // 距离
              if (device.distance != null) ...[
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(
                      Icons.directions_walk,
                      size: 16.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      device.distanceText,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],

              // 支付方式
              SizedBox(height: 8.h),
              Row(
                children: [
                  if (device.supportMobilePayment) ...[
                    Icon(Icons.phone_android, size: 16.sp, color: Colors.green),
                    SizedBox(width: 4.w),
                    Text('移动支付', style: TextStyle(fontSize: 12.sp)),
                    SizedBox(width: 12.w),
                  ],
                  if (device.supportCashPayment) ...[
                    Icon(Icons.payments, size: 16.sp, color: Colors.orange),
                    SizedBox(width: 4.w),
                    Text('现金支付', style: TextStyle(fontSize: 12.sp)),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 构建状态徽章
  Widget _buildStatusBadge(DeviceModel device) {
    Color color;
    String text;

    switch (device.status) {
      case 'online':
        color = Colors.green;
        text = '在线';
        break;
      case 'offline':
        color = Colors.grey;
        text = '离线';
        break;
      case 'maintenance':
        color = Colors.orange;
        text = '维护中';
        break;
      default:
        color = Colors.grey;
        text = '未知';
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: color),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12.sp, color: color),
      ),
    );
  }
}
