import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/logger_utils.dart';

part 'location_service.g.dart';

@Riverpod(keepAlive: true)
LocationService locationService(Ref ref) {
  return LocationService();
}

class LocationService {
  /// 获取当前位置
  Future<Position?> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      LoggerUtils.w('LocationService: Location services are disabled.');
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        LoggerUtils.w('LocationService: Location permissions are denied');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      LoggerUtils.w(
        'LocationService: Location permissions are permanently denied, we cannot request permissions.',
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
