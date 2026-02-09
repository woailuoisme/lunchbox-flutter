import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart'
    as isp;
import 'package:latlong2/latlong.dart';
import 'package:lunchbox/core/services/location_service.dart';
import 'package:lunchbox/core/widgets/map/lunchbox_map.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:lunchbox/features/device/entities/device_model.dart';
import 'package:lunchbox/features/device/repositories/simulated_device_repository.dart';
import 'package:lunchbox/features/device/screens/city_selection_view.dart';

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

  late final isp.PagingController<int, DeviceModel> _frequentPagingController;
  late final isp.PagingController<int, DeviceModel> _nearbyPagingController;

  // 地图控制器
  final MapController _mapController = MapController();

  // 当前地图中心点 (默认东莞)
  LatLng _currentCenter = const LatLng(23.02067, 113.75179);

  // 是否正在定位
  bool _isLocating = false;

  @override
  void initState() {
    super.initState();
    // 默认选中“附近营业点” (index: 1)
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);

    _frequentPagingController = isp.PagingController<int, DeviceModel>(
      getNextPageKey: (state) {
        if (state.pages == null || state.pages!.isEmpty) {
          return 0;
        }
        final lastPageItemCount = state.pages!.last.length;
        if (lastPageItemCount < 10) {
          return null;
        }
        return (state.keys?.last ?? 0) + 10;
      },
      fetchPage: (pageKey) => _fetchPageData(pageKey, isFrequent: true),
    );

    _nearbyPagingController = isp.PagingController<int, DeviceModel>(
      getNextPageKey: (state) {
        if (state.pages == null || state.pages!.isEmpty) {
          return 0;
        }
        final lastPageItemCount = state.pages!.last.length;
        if (lastPageItemCount < 10) {
          return null;
        }
        return (state.keys?.last ?? 0) + 10;
      },
      fetchPage: (pageKey) => _fetchPageData(pageKey, isFrequent: false),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _frequentPagingController.dispose();
    _nearbyPagingController.dispose();
    _mapController.dispose();
    super.dispose();
  }

  /// 获取当前位置
  Future<void> _locateUser() async {
    if (_isLocating) {
      return;
    }

    setState(() {
      _isLocating = true;
    });

    try {
      final position = await ref
          .read(locationServiceProvider)
          .getCurrentPosition();
      if (position != null) {
        final newCenter = LatLng(position.latitude, position.longitude);
        setState(() {
          _currentCenter = newCenter;
        });
        _mapController.move(newCenter, 15.0);
        // TODO: 可以在这里刷新附近设备列表
        // _nearbyPagingController.refresh();
      } else {
        // 定位失败提示已在 Service 中处理日志，UI 上可以加个 Toast
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('定位失败，请检查定位权限')));
        }
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLocating = false;
        });
      }
    }
  }

  /// 分页获取数据
  Future<List<DeviceModel>> _fetchPageData(
    int pageKey, {
    required bool isFrequent,
  }) async {
    final repository = ref.read(simulatedDeviceRepositoryProvider);
    const pageSize = 10;
    return isFrequent
        ? await repository.fetchFrequentDevices(pageKey, pageSize)
        : await repository.fetchNearbyDevices(pageKey, pageSize);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          '取餐机',
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 分段式 TabBar
          Container(
            height: 48.h,
            margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: TabBar(
              controller: _tabController,
              padding: EdgeInsets.all(4.w),
              labelColor: theme.colorScheme.onPrimary,
              unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
              indicator: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
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
              children: [
                _buildFrequentTab(theme), // 常去营业点
                _buildNearbyTab(theme), // 附近营业点
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建“常去营业点”视图
  Widget _buildFrequentTab(ThemeData theme) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        // 顶部提示条
        SliverToBoxAdapter(
          child: _buildStatusBanner(
            text: '已加载3个常用设备',
            icon: Icons.refresh,
            bgColor: Colors.green.shade50, // 浅绿色背景
            textColor: Colors.green, // 绿色文字
          ),
        ),

        // 设备列表 (使用 PagedSliverList)
        SliverPadding(
          padding: EdgeInsets.all(16.w),
          sliver: isp.PagingListener(
            controller: _frequentPagingController,
            builder: (context, state, fetchNextPage) =>
                isp.PagedSliverList<int, DeviceModel>(
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate: isp.PagedChildBuilderDelegate<DeviceModel>(
                    itemBuilder: (context, item, index) =>
                        _buildDeviceCard(item, theme),
                    noItemsFoundIndicatorBuilder: (context) => Center(
                      child: Text(
                        '暂无常去营业点',
                        style: TextStyle(
                          color: theme.colorScheme.outline,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
          ),
        ),

        // 底部提示
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Center(
              child: Text(
                '- 已经到底啦 -',
                style: TextStyle(
                  color: theme.colorScheme.outline,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 构建“附近营业点”视图
  Widget _buildNearbyTab(ThemeData theme) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        // 城市选择
        SliverToBoxAdapter(child: _buildCitySelector(theme)),

        // 顶部提示条
        SliverToBoxAdapter(
          child: _buildStatusBanner(
            text: '正在刷新...',
            icon: Icons.refresh,
            bgColor: Colors.green.shade50,
            textColor: Colors.green,
          ),
        ),

        // 地图预览区
        SliverToBoxAdapter(child: _buildMapPreview(theme)),

        // 设备列表 (使用 PagedSliverList)
        SliverPadding(
          padding: EdgeInsets.all(16.w),
          sliver: isp.PagingListener(
            controller: _nearbyPagingController,
            builder: (context, state, fetchNextPage) =>
                isp.PagedSliverList<int, DeviceModel>(
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate: isp.PagedChildBuilderDelegate<DeviceModel>(
                    itemBuilder: (context, item, index) =>
                        _buildDeviceCard(item, theme),
                    noItemsFoundIndicatorBuilder: (context) => Center(
                      child: Text(
                        '暂无附近营业点',
                        style: TextStyle(
                          color: theme.colorScheme.outline,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }

  /// 构建状态提示条
  Widget _buildStatusBanner({
    required String text,
    required Color bgColor,
    required Color textColor,
    IconData? icon,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 13.sp),
            ),
          ),
          if (icon != null) Icon(icon, color: textColor, size: 18.sp),
        ],
      ),
    );
  }

  /// 构建城市选择器
  Widget _buildCitySelector(ThemeData theme) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute<String>(
            builder: (context) => const CitySelectionView(),
          ),
        );
        if (result != null) {
          // TODO: 更新城市
          debugPrint('Selected city: $result');
        }
      },
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '东莞市',
              style: TextStyle(
                fontSize: 16.sp,
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.keyboard_arrow_down, size: 20.sp),
          ],
        ),
      ),
    );
  }

  /// 构建地图预览
  Widget _buildMapPreview(ThemeData theme) {
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
              mapController: _mapController,
              center: _currentCenter,
              zoom: 13.0,
              markers: [
                Marker(
                  point: _currentCenter,
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
            // 地图工具按钮
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
                    Icons.refresh,
                    theme: theme,
                    onTap: () {
                      // 刷新地图/设备
                      _nearbyPagingController.refresh();
                    },
                  ),
                  SizedBox(height: 8.h),
                  _buildMapTool(
                    _isLocating ? Icons.gps_not_fixed : Icons.my_location,
                    theme: theme,
                    color: theme.colorScheme.primary,
                    onTap: _locateUser,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建地图工具按钮
  Widget _buildMapTool(
    IconData icon, {
    required ThemeData theme,
    Color? color,
    VoidCallback? onTap,
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
        child: _isLocating && icon == Icons.gps_not_fixed
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

  /// 构建设备卡片
  ///
  /// 展示机器名称、地址、营业时间、距离及在线状态
  Widget _buildDeviceCard(DeviceModel device, ThemeData theme) {
    return GestureDetector(
      onTap: () {
        context.push('${AppRoutes.deviceList}/${device.id}');
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        color: Colors.transparent, // 确保点击区域覆盖整个卡片
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
                        device.name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '09:00-18:00', // 暂无营业时间字段，使用默认
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        device.location.address ?? '',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Icon(
                  Icons.navigation_outlined,
                  size: 24.sp,
                  color: theme.colorScheme.onSurface,
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                if (device.isOnline)
                  _buildStatusTag('在线', Colors.lightGreen)
                else
                  _buildStatusTag('离线', theme.colorScheme.outline),
                SizedBox(width: 8.w),
                _buildStatusTag('已启用', Colors.blue),
                const Spacer(),
                Text(
                  '500m', // 暂无距离字段，使用模拟
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: theme.colorScheme.outline,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Divider(height: 1, color: theme.dividerColor),
          ],
        ),
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
