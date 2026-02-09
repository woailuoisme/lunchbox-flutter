import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lunchbox/core/errors/errors.dart';
import 'package:lunchbox/core/network/network.dart';
import 'package:lunchbox/core/services/services.dart';
import 'package:lunchbox/core/values/values.dart';
import 'package:lunchbox/features/device/entities/city_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'city_repository.g.dart';

@Riverpod(keepAlive: true)
CityRepository cityRepository(Ref ref) {
  final restClient = ref.watch(restClientProvider);
  final storageService = ref.watch(storageServiceProvider);
  return CityRepository(restClient, storageService);
}

/// 城市仓库类
/// 负责处理城市相关的数据访问和业务逻辑
class CityRepository {
  CityRepository(this._client, this._storageService);

  final RestClient _client;
  final StorageService _storageService;

  /// 获取所有城市列表
  TaskEither<Failure, List<CityModel>> getAllCities() {
    return TaskEither.tryCatch(() async {
      final response = await _client.getCities();
      if (response.success && response.data != null) {
        return response.data!.items;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 获取热门城市列表
  TaskEither<Failure, List<CityModel>> getHotCities() {
    return getAllCities().map(
      (cities) => cities.where((city) => city.isHot).toList(),
    );
  }

  /// 根据城市首字母获取城市列表
  TaskEither<Failure, Map<String, List<CityModel>>> getCitiesByInitial() {
    return getAllCities().map((cities) {
      final Map<String, List<CityModel>> result = {};

      for (final city in cities) {
        final initial = city.initial.toUpperCase();
        if (!result.containsKey(initial)) {
          result[initial] = [];
        }
        result[initial]!.add(city);
      }

      // 按首字母排序
      final sortedResult = Map<String, List<CityModel>>.fromEntries(
        result.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
      );

      return sortedResult;
    });
  }

  /// 获取已选择的城市
  CityModel? getSelectedCity() {
    try {
      final jsonStr = _storageService.read<String>(
        AppConstants.keySelectedCity,
      );
      if (jsonStr != null) {
        return CityModel.fromJson(json.decode(jsonStr) as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// 保存已选择的城市
  Future<void> saveSelectedCity(CityModel city) async {
    await _storageService.write(
      AppConstants.keySelectedCity,
      json.encode(city.toJson()),
    );
  }

  /// 根据城市ID获取城市信息
  TaskEither<Failure, CityModel> getCityById(String cityId) {
    return TaskEither.tryCatch(() async {
      final response = await _client.getCityById(cityId);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 搜索城市
  TaskEither<Failure, List<CityModel>> searchCities(String keyword) {
    if (keyword.isEmpty) {
      return TaskEither.right([]);
    }

    return getAllCities().map((cities) {
      final lowercaseKeyword = keyword.toLowerCase();

      return cities
          .where(
            (city) =>
                city.name.contains(keyword) ||
                city.pinyin.toLowerCase().contains(lowercaseKeyword),
          )
          .toList();
    });
  }

  /// 获取用户当前位置附近的城市
  TaskEither<Failure, CityModel?> getNearbyCity(
    double latitude,
    double longitude,
  ) {
    return getAllCities().map((cities) {
      // 简单的距离计算，实际项目中可能需要更复杂的地理计算
      CityModel? nearestCity;
      double minDistance = double.infinity;

      for (final city in cities) {
        final distance = _calculateDistance(
          latitude,
          longitude,
          city.latitude,
          city.longitude,
        );

        if (distance < minDistance) {
          minDistance = distance;
          nearestCity = city;
        }
      }

      return nearestCity;
    });
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
