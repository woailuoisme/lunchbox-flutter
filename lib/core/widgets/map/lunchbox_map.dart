import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// 统一封装的地图组件
///
/// 封装了 [FlutterMap] 的基础配置，统一了 TileLayer 源，
/// 并简化了 Marker 的使用。
class LunchboxMap extends StatelessWidget {
  const LunchboxMap({
    super.key,
    required this.center,
    this.zoom = 13.0,
    this.markers = const [],
    this.mapController,
    this.interactionOptions = const InteractionOptions(
      flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
    ),
    this.onTap,
    this.onMapReady,
  });

  /// 地图中心点
  final LatLng center;

  /// 缩放级别
  final double zoom;

  /// 标记点列表
  final List<Marker> markers;

  /// 地图控制器 (可选)
  final MapController? mapController;

  /// 交互选项 (可选)
  final InteractionOptions interactionOptions;

  /// 点击地图的回调
  final void Function(TapPosition, LatLng)? onTap;

  /// 地图创建完成的回调
  final void Function(MapController)? onMapReady;

  @override
  Widget build(BuildContext context) {
    // 获取当前语言环境
    final locale = Localizations.localeOf(context);
    // 高德地图语言参数：zh_cn (中文), en (英文)
    final lang = locale.languageCode == 'en' ? 'en' : 'zh_cn';

    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: center,
        initialZoom: zoom,
        interactionOptions: interactionOptions,
        onTap: onTap,
        onMapReady: () {
          if (onMapReady != null && mapController != null) {
            onMapReady!(mapController!);
          }
        },
      ),
      children: [
        // 使用高德地图
        // 注意：高德地图使用 GCJ-02 坐标系，与 WGS-84 (GPS) 有偏移
        // 如果需要精确定位，建议后续添加坐标转换逻辑
        TileLayer(
          urlTemplate:
              'https://webrd0{s}.is.autonavi.com/appmaptile?lang=$lang&size=1&scale=1&style=8&x={x}&y={y}&z={z}',
          subdomains: const ['1', '2', '3', '4'],
          userAgentPackageName: 'com.hxg.lunchbox',
          // 优化体验：平滑过渡和视网膜屏支持
          tileDisplay: const TileDisplay.fadeIn(
            duration: Duration(milliseconds: 300),
          ),
          retinaMode: MediaQuery.of(context).devicePixelRatio > 1.0,
          // 错误处理
          errorImage: const AssetImage('assets/icons/icon.png'),
          // 性能优化：使用 NetworkTileProvider 并配置缓存
          // maxCacheSize: 1000个瓦片 (约20-30MB)
          tileProvider: NetworkTileProvider(
            headers: {'User-Agent': 'lunchbox/1.0.0'},
          ),
          // 限制缩放级别，避免无效请求
          minZoom: 3,
          maxZoom: 18,
        ),

        // 标记层
        if (markers.isNotEmpty) MarkerLayer(markers: markers),
      ],
    );
  }
}
