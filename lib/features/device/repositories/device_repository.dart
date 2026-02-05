import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/api_response_model.dart';
import '../../../shared/services/api_provider.dart';
import '../../../shared/services/base_repository.dart';
import '../../../shared/services/mock_provider.dart';
import '../entities/device_model.dart';

part 'device_repository.g.dart';

@Riverpod(keepAlive: true)
DeviceRepository deviceRepository(Ref ref) {
  final apiProvider = ref.watch(apiProviderProvider);
  final mockProvider = ref.watch(mockProviderProvider);
  return DeviceRepository(apiProvider, mockProvider);
}

/// 设备仓库类
/// 负责处理自动售货机设备相关的数据访问和业务逻辑
class DeviceRepository extends BaseRepository {
  DeviceRepository(super.apiService, super.mockService, {super.useMockData});

  /// 获取所有设备列表
  Future<List<DeviceModel>> getAllDevices() async {
    return handleListResponse(() async {
      if (useMockData) {
        return mockService.getDevices();
      } else {
        return apiService.get('/api/devices', (json) {
          final data = (json! as Map<String, dynamic>)['data'] as List;
          return List<DeviceModel>.from(
            data.map(
              (item) => DeviceModel.fromJson(item as Map<String, dynamic>),
            ),
          );
        });
      }
    }, '获取所有设备');
  }

  /// 根据城市ID获取设备列表
  Future<List<DeviceModel>> getDevicesByCityId(String cityId) async {
    return handleListResponse(() async {
      if (useMockData) {
        final response = await mockService.getDevices();
        final filteredDevices = response.data!
            .where((device) => device.cityId == cityId)
            .toList();
        return ApiResponseModel.success(filteredDevices);
      } else {
        return apiService.get('/api/devices/city/$cityId', (json) {
          final data = (json! as Map<String, dynamic>)['data'] as List;
          return List<DeviceModel>.from(
            data.map(
              (item) => DeviceModel.fromJson(item as Map<String, dynamic>),
            ),
          );
        });
      }
    }, '根据城市获取设备');
  }

  /// 根据设备ID获取设备详情
  Future<DeviceModel> getDeviceById(String deviceId) async {
    return handleResponse(() async {
      if (useMockData) {
        return mockService.getDeviceById(deviceId);
      } else {
        return apiService.get(
          '/api/devices/$deviceId',
          (json) => DeviceModel.fromJson(
            (json! as Map<String, dynamic>)['data'] as Map<String, dynamic>,
          ),
        );
      }
    }, '获取设备详情');
  }

  /// 获取用户当前位置附近的设备
  Future<List<DeviceModel>> getNearbyDevices(
    double latitude,
    double longitude, {
    double radius = 1.0,
    int limit = 10,
  }) async {
    final allDevices = await getAllDevices();

    // 计算并排序设备距离
    final deviceWithDistance = <DeviceModel, double>{};

    for (final device in allDevices) {
      final distance = _calculateDistance(
        latitude,
        longitude,
        device.location.latitude,
        device.location.longitude,
      );

      if (distance <= radius) {
        deviceWithDistance[device] = distance;
      }
    }

    // 按距离排序并限制数量
    final sortedDevices = deviceWithDistance.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    return sortedDevices.take(limit).map((entry) => entry.key).toList();
  }

  /// 获取在线设备列表
  Future<List<DeviceModel>> getOnlineDevices() async {
    final allDevices = await getAllDevices();
    return allDevices.where((device) => device.isOnline).toList();
  }

  /// 搜索设备
  Future<List<DeviceModel>> searchDevices(
    String keyword, {
    String? cityId,
  }) async {
    List<DeviceModel> devices;

    if (cityId != null) {
      devices = await getDevicesByCityId(cityId);
    } else {
      devices = await getAllDevices();
    }

    if (keyword.isEmpty) {
      return devices;
    }

    final lowercaseKeyword = keyword.toLowerCase();

    return devices
        .where(
          (device) =>
              device.name.toLowerCase().contains(lowercaseKeyword) ||
              (device.location.address?.toLowerCase().contains(
                    lowercaseKeyword,
                  ) ??
                  false),
        )
        .toList();
  }

  /// 检查设备状态
  Future<DeviceModel> checkDeviceStatus(String deviceId) async {
    return handleResponse(() async {
      if (useMockData) {
        // 在Mock数据中模拟设备状态检查
        return mockService.getDeviceById(deviceId);
      } else {
        return apiService.get(
          '/api/devices/$deviceId/status',
          (json) => DeviceModel.fromJson(
            (json! as Map<String, dynamic>)['data'] as Map<String, dynamic>,
          ),
        );
      }
    }, '检查设备状态');
  }

  /// 获取设备使用统计
  Future<Map<String, dynamic>> getDeviceStatistics(String deviceId) async {
    return handleResponse(() async {
      if (useMockData) {
        // 返回模拟的统计数据
        final stats = {
          'todayOrders': Random().nextInt(100) + 50,
          'todaySales': (Random().nextInt(5000) + 2000).toDouble(),
          'totalOrders': Random().nextInt(10000) + 5000,
          'totalSales': (Random().nextInt(100000) + 50000).toDouble(),
          'stockRate': (Random().nextDouble() * 0.3 + 0.7).toStringAsFixed(2),
        };
        return ApiResponseModel.success(stats);
      } else {
        return apiService.get(
          '/api/devices/$deviceId/statistics',
          (json) =>
              (json! as Map<String, dynamic>)['data'] as Map<String, dynamic>,
        );
      }
    }, '获取设备统计');
  }

  /// 计算两点之间的距离（单位：千米）
  double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371; // 地球半径（千米）

    final double dLat = _degreesToRadians(lat2 - lat1);
    final double dLon = _degreesToRadians(lon2 - lon1);

    final double a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    final double distance = earthRadius * c;

    return distance;
  }

  /// 将角度转换为弧度
  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }
}
