import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/values/app_colors.dart';
import '../../device/entities/device_model.dart';
import '../../device/entities/location_model.dart';
import '../providers/home_notifier.dart';

/// 首页视图
class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final notifier = ref.watch(homeProvider.notifier);

    // 骨架屏数据准备
    final bool showSkeleton = state.isLoading && state.nearbyDevices.isEmpty;
    final List<DeviceModel> displayDevices = showSkeleton
        ? List.generate(
            3,
            (index) => const DeviceModel(
              id: 'dummy',
              name: 'Loading Device Name',
              cityId: 'dummy',
              status: 'online',
              location: LocationModel(
                latitude: 0,
                longitude: 0,
                address: 'Loading Address...',
              ),
              productIds: [],
              lastUpdated: '',
            ),
          )
        : state.nearbyDevices;

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
        child: Skeletonizer(
          enabled: showSkeleton,
          child: CustomScrollView(
            slivers: [
              // 顶部轮播图
              SliverToBoxAdapter(child: _buildCarousel(context)),

              // 附近设备标题
              SliverToBoxAdapter(child: _buildSectionTitle('附近设备')),

              // 设备列表
              _buildDeviceList(displayDevices, notifier, context),
            ],
          ),
        ),
      ),
    );
  }

  /// 构建轮播图
  Widget _buildCarousel(BuildContext context) {
    final List<Map<String, String>> banners = [
      {'title': '便捷购买', 'subtitle': '美味随行', 'color': '0xFFF44336'},
      {'title': '新鲜速递', 'subtitle': '每日更新', 'color': '0xFF2196F3'},
      {'title': '超值优惠', 'subtitle': '限时特价', 'color': '0xFF4CAF50'},
    ];

    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 150.h,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 2,
        ),
        items: banners.map((banner) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Color(int.parse(banner['color']!)),
                  borderRadius: BorderRadius.circular(16.r),
                  gradient: LinearGradient(
                    colors: [
                      Color(int.parse(banner['color']!)),
                      Color(int.parse(banner['color']!)).withValues(alpha: 0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
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
                            banner['title']!,
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            banner['subtitle']!,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white.withValues(alpha: 0.9),
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
                        color: Colors.white.withValues(alpha: 0.3),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
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
  Widget _buildDeviceList(
    List<DeviceModel> devices,
    HomeNotifier notifier,
    BuildContext context,
  ) {
    if (devices.isEmpty) {
      return SliverFillRemaining(child: _buildEmptyState(notifier));
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final device = devices[index];
        return _buildDeviceCard(context, device);
      }, childCount: devices.length),
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
                          ? AppColors.primary.withValues(alpha: 0.1)
                          : AppColors.textHint.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.storefront,
                      color: device.isOnline
                          ? AppColors.primary
                          : AppColors.textHint,
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
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          device.address,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  // 距离
                  if (device.distanceText.isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        device.distanceText,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                ],
              ),

              SizedBox(height: 12.h),

              // 状态标签
              Row(
                children: [
                  _buildStatusChip(
                    device.isOnline ? '营业中' : '休息中',
                    device.isOnline ? AppColors.success : AppColors.textHint,
                  ),
                  SizedBox(width: 8.w),
                  if (device.supportMobilePayment)
                    _buildStatusChip('支持移动支付', AppColors.info),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 构建状态标签
  Widget _buildStatusChip(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 10.sp, color: color),
      ),
    );
  }

  /// 构建空状态
  Widget _buildEmptyState(HomeNotifier notifier) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_off, size: 64.sp, color: AppColors.textHint),
          SizedBox(height: 16.h),
          Text(
            '附近暂无设备',
            style: TextStyle(fontSize: 16.sp, color: AppColors.textSecondary),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: notifier.refreshData,
            child: const Text('刷新重试'),
          ),
        ],
      ),
    );
  }
}
