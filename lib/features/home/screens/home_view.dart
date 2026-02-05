import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/values/app_colors.dart';
import '../../device/entities/device_model.dart';
import '../providers/home_notifier.dart';

/// 首页视图
class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeNotifierProvider);
    final notifier = ref.read(homeNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: InkWell(
          onTap: notifier.changeCity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                state.currentCity?.name ?? '选择城市',
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(width: 4.w),
              Icon(Icons.arrow_drop_down, size: 24.sp),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => context.push('/cart'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: notifier.refreshData,
        child: Builder(
          builder: (context) {
             if (state.isLoading && state.nearbyDevices.isEmpty) {
               return const Center(child: CircularProgressIndicator());
             }
             
             return CustomScrollView(
               slivers: [
                 // 顶部横幅
                 SliverToBoxAdapter(child: _buildBanner()),
                 
                 // 附近设备标题
                 SliverToBoxAdapter(child: _buildSectionTitle('附近设备')),
                 
                 // 设备列表
                 _buildDeviceList(state.nearbyDevices, notifier, context),
               ],
             );
          },
        ),
      ),
    );
  }
  
  /// 构建横幅
  Widget _buildBanner() {
    return Container(
      margin: EdgeInsets.all(16.w),
      height: 150.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 24.w,
            top: 24.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '便捷购买',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '美味随行',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 24.w,
            bottom: 24.h,
            child: Icon(
              Icons.lunch_dining,
              size: 80.sp,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
  
  /// 构建分区标题
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
  
  /// 构建设备列表
  Widget _buildDeviceList(List<DeviceModel> devices, HomeNotifier notifier, BuildContext context) {
      if (devices.isEmpty) {
        return SliverFillRemaining(
          child: _buildEmptyState(notifier),
        );
      }
      
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final device = devices[index];
            return _buildDeviceCard(context, device);
          },
          childCount: devices.length,
        ),
      );
  }
  
  /// 构建设备卡片
  Widget _buildDeviceCard(BuildContext context, DeviceModel device) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => context.push('/device/${device.id}', extra: device),
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // 设备图标
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      color: device.isOnline
                          ? AppColors.primary.withOpacity(0.1)
                          : AppColors.textHint.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.storefront,
                      color: device.isOnline ? AppColors.primary : AppColors.textHint,
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
                            color: AppColors.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            // 状态指示器
                            Container(
                              width: 8.w,
                              height: 8.w,
                              decoration: BoxDecoration(
                                color: device.isOnline
                                    ? AppColors.success
                                    : AppColors.textHint,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              device.isOnline ? '营业中' : '已打烊',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            if (device.distance != null) ...[
                              SizedBox(width: 12.w),
                              Icon(
                                Icons.location_on_outlined,
                                size: 14.sp,
                                color: AppColors.textSecondary,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                device.distanceText,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  // 箭头
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.textHint,
                    size: 24.sp,
                  ),
                ],
              ),
              
              SizedBox(height: 12.h),
              
              // 地址
              Row(
                children: [
                  Icon(
                    Icons.place_outlined,
                    size: 16.sp,
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      device.address,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
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
      ),
    );
  }
  
  /// 构建空状态
  Widget _buildEmptyState(HomeNotifier notifier) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.store_outlined,
            size: 64.sp,
            color: AppColors.textHint,
          ),
          SizedBox(height: 16.h),
          Text(
            '附近暂无设备',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          TextButton(
            onPressed: notifier.changeCity,
            child: const Text('切换城市'),
          ),
        ],
      ),
    );
  }
}
