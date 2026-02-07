import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/values/app_colors.dart';

/// 设备列表视图 (取餐机)
///
/// 按照最新 UI 截图重构，包含分段 Tab、地图预览、城市选择和设备列表
class DeviceListView extends ConsumerStatefulWidget {
  const DeviceListView({super.key});

  @override
  ConsumerState<DeviceListView> createState() => _DeviceListViewState();
}

class _DeviceListViewState extends ConsumerState<DeviceListView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '取餐机',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(Icons.more_horiz, color: Colors.black, size: 24.sp),
          SizedBox(width: 12.w),
          Icon(Icons.radio_button_checked, color: Colors.black, size: 24.sp),
          SizedBox(width: 16.w),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 分段式 TabBar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: TabBar(
              controller: _tabController,
              labelColor: const Color(0xFFFF5252),
              // 红色激活态
              unselectedLabelColor: const Color(0xFF999999),
              indicatorColor: const Color(0xFFFF5252),
              // 红色指示器
              indicatorWeight: 3.h,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              tabs: const [
                Tab(text: '常去营业点'),
                Tab(text: '附近营业点'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildListView(), _buildListView()],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建列表视图
  ///
  /// 包含城市选择器、嵌入式地图预览和机器列表
  Widget _buildListView() {
    return CustomScrollView(
      slivers: [
        // 城市选择
        SliverToBoxAdapter(child: _buildCitySelector()),

        // 地图预览区
        SliverToBoxAdapter(child: _buildMapPreview()),

        // 设备列表
        SliverPadding(
          padding: EdgeInsets.all(16.w),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _buildDeviceCard(index);
            }, childCount: 2),
          ),
        ),
      ],
    );
  }

  /// 构建城市选择器
  Widget _buildCitySelector() {
    return Container(
      margin: EdgeInsets.all(16.w),
      height: 50.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFF0F0F0)),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '东莞市',
            style: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xFF333333),
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.keyboard_arrow_down, size: 20.sp),
        ],
      ),
    );
  }

  /// 构建地图预览
  Widget _buildMapPreview() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      height: 240.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: const DecorationImage(
          image: NetworkImage('https://picsum.photos/seed/map/600/400'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // 地图工具按钮 (模拟)
          Positioned(
            right: 12.w,
            top: 12.h,
            child: Column(
              children: [
                _buildMapTool(Icons.search),
                SizedBox(height: 8.h),
                _buildMapTool(Icons.refresh),
                SizedBox(height: 8.h),
                _buildMapTool(
                  Icons.location_on,
                  color: const Color(0xFFFF5252),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建地图工具按钮
  Widget _buildMapTool(IconData icon, {Color? color}) {
    return Container(
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, size: 20.sp, color: color ?? const Color(0xFF666666)),
    );
  }

  /// 构建设备卡片
  ///
  /// 展示机器名称、地址、营业时间、距离及在线状态
  Widget _buildDeviceCard(int index) {
    final devices = [
      {
        'name': '10号机/中科云计算研究院',
        'time': '09:00-18:00',
        'address': '东莞市广东省东莞市大岭山镇东莞暨南大学研究院中科云计算研究院',
        'distance': '8.8km',
      },
      {
        'name': '20号机',
        'time': '09:00-18:00',
        'address': '东莞市寮步镇科技二路光大We谷',
        'distance': '8.9km',
      },
    ];

    final device = devices[index];

    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      device['name']!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      device['time']!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF999999),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      device['address']!,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              Icon(Icons.navigation_outlined, size: 24.sp, color: Colors.black),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            '在线',
            style: TextStyle(fontSize: 13.sp, color: const Color(0xFF8BC34A)),
          ),
          Text(
            device['distance']!,
            style: TextStyle(fontSize: 13.sp, color: const Color(0xFF999999)),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              _buildStatusTag('在线', const Color(0xFF8BC34A)),
              SizedBox(width: 8.w),
              _buildStatusTag('已启用', const Color(0xFF2196F3)),
            ],
          ),
          SizedBox(height: 16.h),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
        ],
      ),
    );
  }

  /// 构建状态标签
  Widget _buildStatusTag(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
