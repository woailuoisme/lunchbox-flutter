import 'dart:convert';
import 'package:lunchbox/features/device/datasources/device_rest_client.dart';
import 'package:lunchbox/core/services/services.dart';
import 'package:lunchbox/core/constants/constants.dart';
import 'package:lunchbox/features/device/entities/city_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'city_repository.g.dart';

@Riverpod(keepAlive: true)
CityRepository cityRepository(Ref ref) {
  final restClient = ref.watch(deviceRestClientProvider);
  final storageService = ref.watch(storageServiceProvider);
  return CityRepository(restClient, storageService);
}

/// 城市仓库类
/// 负责处理城市相关的数据访问和业务逻辑
class CityRepository {
  CityRepository(this._client, this._storageService);

  final DeviceRestClient _client;
  final StorageService _storageService;

  // 内存缓存
  List<CityModel>? _cachedCities;

  /// 获取所有城市列表
  Future<List<CityModel>> getAllCities({bool forceRefresh = false}) async {
    if (!forceRefresh && _cachedCities != null) {
      return _cachedCities!;
    }

    final response = await _client.getEnableCities();
    _cachedCities = response.data ?? [];
    return _cachedCities!;
  }

  /// 获取热门城市列表
  Future<List<CityModel>> getHotCities() async {
    final cities = await getAllCities();
    final sorted = List<CityModel>.from(cities)
      ..sort((a, b) => b.count.compareTo(a.count));
    return sorted.take(6).toList();
  }

  /// 获取已选择的城市
  CityModel? getSelectedCity() {
    final jsonStr = _storageService.read<String>(AppConstants.keySelectedCity);
    if (jsonStr != null) {
      try {
        return CityModel.fromJson(json.decode(jsonStr) as Map<String, dynamic>);
      } catch (_) {}
    }
    return null;
  }

  /// 保存已选择的城市
  Future<void> saveSelectedCity(CityModel city) async {
    await _storageService.write(
      AppConstants.keySelectedCity,
      json.encode(city.toJson()),
    );
  }

  /// 根据城市ID获取城市信息
  Future<CityModel?> getCityById(String cityId) async {
    final cities = await getAllCities();
    for (final city in cities) {
      if (city.code == cityId || city.city == cityId) {
        return city;
      }
    }
    return null;
  }

  /// 获取用户当前位置附近的城市 (Mock)
  Future<CityModel?> getNearbyCity(double latitude, double longitude) async {
    final cities = await getAllCities();
    return cities.isEmpty ? null : cities.first;
  }
}
