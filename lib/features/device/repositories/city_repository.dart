import 'dart:convert';
import 'package:lunchbox/core/errors/repository_error_handler_mixin.dart';
import 'package:lunchbox/core/errors/errors.dart';
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
class CityRepository with RepositoryErrorHandlerMixin {
  CityRepository(this._client, this._storageService);

  final DeviceRestClient _client;
  final StorageService _storageService;

  /// 获取所有城市列表
  Future<List<CityModel>> getAllCities() async {
    try {
      final response = await _client.getEnableCities();
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }

  /// 获取热门城市列表
  Future<List<CityModel>> getHotCities() async {
    final cities = await getAllCities();
    final sorted = List<CityModel>.from(cities)
      ..sort((a, b) => b.count.compareTo(a.count));
    return sorted.take(6).toList();
  }

  /// 根据城市首字母获取城市列表
  Future<Map<String, List<CityModel>>> getCitiesByInitial() async {
    final cities = await getAllCities();
    final Map<String, List<CityModel>> result = {};
    for (final city in cities) {
      final initial = city.name.isNotEmpty ? city.name[0].toUpperCase() : '#';
      result.putIfAbsent(initial, () => []).add(city);
    }

    final sortedKeys = result.keys.toList()..sort();
    final Map<String, List<CityModel>> sortedResult = {};
    for (final key in sortedKeys) {
      sortedResult[key] = result[key]!;
    }

    return sortedResult;
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
  Future<CityModel> getCityById(String cityId) async {
    final cities = await getAllCities();
    return cities.firstWhere(
      (city) => city.code == cityId || city.city == cityId,
      orElse: () => throw const Failure.server(
        message: 'City not found',
        statusCode: 404,
      ),
    );
  }

  /// 搜索城市
  Future<List<CityModel>> searchCities(String keyword) async {
    if (keyword.isEmpty) {
      return [];
    }

    final cities = await getAllCities();
    final lowercaseKeyword = keyword.toLowerCase();

    return cities
        .where(
          (city) =>
              city.name.toLowerCase().contains(lowercaseKeyword) ||
              city.code.toLowerCase().contains(lowercaseKeyword) ||
              city.province.toLowerCase().contains(lowercaseKeyword) ||
              city.city.toLowerCase().contains(lowercaseKeyword),
        )
        .toList();
  }

  /// 获取用户当前位置附近的城市
  Future<CityModel?> getNearbyCity(double latitude, double longitude) async {
    final cities = await getAllCities();
    if (cities.isEmpty) {
      return null;
    }
    return cities.first;
  }
}
