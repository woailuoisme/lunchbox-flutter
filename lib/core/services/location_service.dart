import 'package:geolocator/geolocator.dart';
import 'package:lunchbox/core/services/permission_service.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_service.g.dart';

@Riverpod(keepAlive: true)
LocationService locationService(Ref ref) {
  final permissionService = ref.watch(permissionServiceProvider);
  return LocationService(permissionService);
}

class LocationService {
  LocationService(this._permissionService);

  final PermissionService _permissionService;

  // 内存缓存当前位置和获取时间
  Position? _lastPosition;
  DateTime? _lastFetchTime;
  // 缓存有效时间 (1分钟)
  static const _cacheDuration = Duration(minutes: 1);

  /// 获取当前位置
  Future<Position?> getCurrentPosition({bool forceRefresh = false}) async {
    // 检查缓存是否有效且不是强制刷新
    if (!forceRefresh &&
        _lastPosition != null &&
        _lastFetchTime != null &&
        DateTime.now().difference(_lastFetchTime!) < _cacheDuration) {
      LoggerUtils.d('LocationService: Using cached position.');
      return _lastPosition;
    }

    bool serviceEnabled;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      LoggerUtils.w('LocationService: Location services are disabled.');
      return null;
    }

    // 统一使用 PermissionService 处理权限
    final hasPermission = await _permissionService.requestLocationPermission();
    if (!hasPermission) {
      LoggerUtils.w(
        'LocationService: Location permissions are denied or permanently denied.',
      );
      return null;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    try {
      final position = await Geolocator.getCurrentPosition();
      _lastPosition = position;
      _lastFetchTime = DateTime.now();
      return position;
    } catch (e) {
      LoggerUtils.e('LocationService: Failed to get current position', e);
      return null;
    }
  }

  /// 计算两个坐标之间的距离（米）
  double calculateDistance(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    return Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
  }
}
