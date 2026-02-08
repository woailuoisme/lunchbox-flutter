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

  /// 获取当前位置
  Future<Position?> getCurrentPosition() async {
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
      return await Geolocator.getCurrentPosition();
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
