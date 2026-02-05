import 'dart:convert';
import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/storage_service.dart';
import '../../../core/values/app_constants.dart';
import '../../../shared/models/api_response_model.dart';
import '../../../shared/services/api_provider.dart';
import '../../../shared/services/base_repository.dart';
import '../../../shared/services/mock_provider.dart';
import '../entities/city_model.dart';

part 'city_repository.g.dart';

@Riverpod(keepAlive: true)
CityRepository cityRepository(Ref ref) {
  final apiProvider = ref.watch(apiProviderProvider);
  final mockProvider = ref.watch(mockProviderProvider);
  final storageService = ref.watch(storageServiceProvider);
  return CityRepository(apiProvider, mockProvider, storageService);
}

/// 城市仓库类
/// 负责处理城市相关的数据访问和业务逻辑
class CityRepository extends BaseRepository {

  CityRepository(
    super.apiService,
    super.mockService,
    this._storageService,
  );
  final StorageService _storageService;

  /// 获取所有城市列表
  Future<List<CityModel>> getAllCities() async {
    return handleListResponse(() async {
      if (useMockData) {
        return mockService.getCities();
      } else {
        return apiService.get(
          '/api/cities',
          (json) => List<CityModel>.from(
            json['data'].map((item) => CityModel.fromJson(item)),
          ),
        );
      }
    }, '获取所有城市');
  }

  /// 获取热门城市列表
  Future<List<CityModel>> getHotCities() async {
    final allCities = await getAllCities();
    return allCities.where((city) => city.isHot).toList();
  }

  /// 根据城市首字母获取城市列表
  Future<Map<String, List<CityModel>>> getCitiesByInitial() async {
    final allCities = await getAllCities();
    final Map<String, List<CityModel>> result = {};

    for (final city in allCities) {
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
  }

  /// 获取已选择的城市
  Future<CityModel?> getSelectedCity() async {
    try {
      final jsonStr = _storageService.read<String>(
        AppConstants.keySelectedCity,
      );
      if (jsonStr != null) {
        return CityModel.fromJson(json.decode(jsonStr));
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
  Future<CityModel> getCityById(String cityId) async {
    return handleResponse(() async {
      if (useMockData) {
        // Mock data usually returns all cities, we filter locally
        final citiesResponse = await mockService.getCities();
        return ApiResponseModel.success(
          citiesResponse.data!.firstWhere((city) => city.id == cityId),
        );
      } else {
        return apiService.get(
          '/api/cities/$cityId',
          (json) => CityModel.fromJson(json['data']),
        );
      }
    }, '获取城市详情');
  }

  /// 搜索城市
  Future<List<CityModel>> searchCities(String keyword) async {
    if (keyword.isEmpty) {
      return [];
    }

    final allCities = await getAllCities();
    final lowercaseKeyword = keyword.toLowerCase();

    return allCities
        .where(
          (city) =>
              city.name.contains(keyword) ||
              city.pinyin.toLowerCase().contains(lowercaseKeyword),
        )
        .toList();
  }

  /// 获取用户当前位置附近的城市
  Future<CityModel?> getNearbyCity(double latitude, double longitude) async {
    final allCities = await getAllCities();

    // 简单的距离计算，实际项目中可能需要更复杂的地理计算
    CityModel? nearestCity;
    double minDistance = double.infinity;

    for (final city in allCities) {
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
