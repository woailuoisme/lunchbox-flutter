import 'package:flutter/material.dart';
import 'package:lunchbox/core/widgets/custom_refresh_view.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:lunchbox/core/services/location_service.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:lunchbox/features/device/providers/device_provider.dart';
import 'package:lunchbox/features/device/entities/device_model.dart';
import 'package:lunchbox/features/device/widgets/device_card.dart';
import 'package:lunchbox/features/device/widgets/device_card_skeleton.dart';
import 'package:lunchbox/features/device/widgets/device_city_selector.dart';
import 'package:lunchbox/features/device/widgets/device_map_preview.dart';
import 'package:lunchbox/features/device/widgets/device_tab_selector.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
  }

  @override
  void dispose() {
    _tabController.dispose();
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

  /// 分页获取数据 (已废弃，接口不支持分页)
  @Deprecated(
    'API does not support pagination, use filteredDevicesProvider instead',
  )
  Future<List<DeviceModel>> _fetchPageData(
    int pageKey, {
    required bool isFrequent,
  }) async {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          t.device.title,
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
          DeviceTabSelector(controller: _tabController),
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
    return Consumer(
      builder: (context, ref, child) {
        final devicesAsync = ref.watch(filteredFrequentDevicesProvider);
        return CustomRefreshView(
          onRefresh: () async => ref.refresh(frequentDevicesProvider.future),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              // 设备列表
              SliverPadding(
                padding: EdgeInsets.all(16.w),
                sliver: devicesAsync.when(
                  data: (devices) {
                    if (devices.isEmpty) {
                      return SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            t.device.noFrequentDevices,
                            style: TextStyle(
                              color: theme.colorScheme.outline,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      );
                    }
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => DeviceCard(
                          device: devices[index],
                        ).animate().fadeIn(duration: 300.ms),
                        childCount: devices.length,
                      ),
                    );
                  },
                  loading: () => Skeletonizer.sliver(
                    enabled: true,
                    child: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => const DeviceCardSkeleton(),
                        childCount: 5,
                      ),
                    ),
                  ),
                  error: (err, stack) => SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: Text(err.toString())),
                  ),
                ),
              ),

              // 底部提示
              if (devicesAsync.hasValue && devicesAsync.value!.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Center(
                      child: Text(
                        t.common.noMoreData,
                        style: TextStyle(
                          color: theme.colorScheme.outline,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  /// 构建“附近营业点”视图
  Widget _buildNearbyTab(ThemeData theme) {
    return Consumer(
      builder: (context, ref, child) {
        final devicesAsync = ref.watch(filteredNearbyDevicesProvider);
        return CustomRefreshView(
          onRefresh: () async => ref.refresh(nearbyDevicesProvider.future),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              // 城市选择
              SliverToBoxAdapter(
                child: DeviceCitySelector(
                  onTap: () => context.push(AppRoutes.citySelection),
                ),
              ),

              // 地图预览区
              SliverToBoxAdapter(
                child: DeviceMapPreview(
                  mapController: _mapController,
                  center: _currentCenter,
                  isLocating: _isLocating,
                  onLocate: _locateUser,
                ),
              ),

              // 设备列表
              SliverPadding(
                padding: EdgeInsets.all(16.w),
                sliver: devicesAsync.when(
                  data: (devices) {
                    if (devices.isEmpty) {
                      return SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 40.h),
                          child: Center(
                            child: Text(
                              t.device.noNearbyDevices,
                              style: TextStyle(
                                color: theme.colorScheme.outline,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => DeviceCard(
                          device: devices[index],
                        ).animate().fadeIn(duration: 300.ms),
                        childCount: devices.length,
                      ),
                    );
                  },
                  loading: () => Skeletonizer.sliver(
                    enabled: true,
                    child: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => const DeviceCardSkeleton(),
                        childCount: 5,
                      ),
                    ),
                  ),
                  error: (err, stack) => SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.h),
                      child: Center(child: Text(err.toString())),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
