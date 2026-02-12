import 'dart:math';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lunchbox/core/errors/failure.dart';
import 'package:lunchbox/core/network/rest_client.dart';
import 'package:lunchbox/features/device/entities/device_model.dart';
import 'package:lunchbox/features/device/repositories/simulated_device_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_repository.g.dart';

@Riverpod(keepAlive: true)
DeviceRepository deviceRepository(Ref ref) {
  final restClient = ref.watch(restClientProvider);
  // 使用模拟仓库
  return SimulatedDeviceRepository(restClient);
}

/// 设备仓库类
/// 负责处理自动售货机设备相关的数据访问和业务逻辑
class DeviceRepository {
  DeviceRepository(this._client);

  final RestClient _client;

  /// 获取所有设备列表
  TaskEither<Failure, List<DeviceModel>> getAllDevices() {
    return TaskEither.tryCatch(() async {
      final response = await _client.getDevices();
      if (response.success && response.data != null) {
        return response.data!.items;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 根据城市ID获取设备列表
  TaskEither<Failure, List<DeviceModel>> getDevicesByCityId(String cityId) {
    return TaskEither.tryCatch(() async {
      final response = await _client.getDevicesByCity(cityId);
      if (response.success && response.data != null) {
        return response.data!.items;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 根据设备ID获取设备详情
  TaskEither<Failure, DeviceModel> getDeviceById(String deviceId) {
    return TaskEither.tryCatch(() async {
      final response = await _client.getDeviceById(deviceId);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 获取用户当前位置附近的设备
  TaskEither<Failure, List<DeviceModel>> getNearbyDevices(
    double latitude,
    double longitude, {
    double radius = 1.0,
    int limit = 10,
  }) {
    return getAllDevices().map((allDevices) {
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
    });
  }

  /// 获取在线设备列表
  TaskEither<Failure, List<DeviceModel>> getOnlineDevices() {
    return getAllDevices().map(
      (devices) => devices.where((device) => device.isOnline).toList(),
    );
  }

  /// 搜索设备
  TaskEither<Failure, List<DeviceModel>> searchDevices(
    String keyword, {
    String? cityId,
  }) {
    final devicesTask = cityId != null
        ? getDevicesByCityId(cityId)
        : getAllDevices();

    return devicesTask.map((devices) {
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
    });
  }

  /// 检查设备状态
  TaskEither<Failure, DeviceModel> checkDeviceStatus(String deviceId) {
    return TaskEither.tryCatch(() async {
      final response = await _client.getDeviceStatus(deviceId);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 获取设备使用统计
  TaskEither<Failure, Map<String, dynamic>> getDeviceStatistics(
    String deviceId,
  ) {
    return TaskEither.tryCatch(() async {
      final response = await _client.getDeviceStatistics(deviceId);
      if (response.success && response.data != null) {
        return response.data! as Map<String, dynamic>;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
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

  Failure _handleError(Object error, StackTrace stackTrace) {
    if (error is DioException) {
      return Failure.network(
        message: error.message ?? 'Unknown network error',
        statusCode: error.response?.statusCode,
      );
    }
    return Failure.server(message: error.toString(), statusCode: 500);
  }
}
