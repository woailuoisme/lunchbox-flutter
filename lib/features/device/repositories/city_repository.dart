import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lunchbox/core/errors/errors.dart';
import 'package:lunchbox/core/network/network.dart';
import 'package:lunchbox/core/services/services.dart';
import 'package:lunchbox/core/constants/constants.dart';
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
    return TaskEither.right(_mockCities);
    // 暂不使用服务端接口，使用本地模拟数据
    /*
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
    */
  }

  /// 模拟城市数据
  static const List<CityModel> _mockCities = [
    CityModel(
      id: '1',
      name: '北京',
      code: 'BJ',
      pinyin: 'beijing',
      initial: 'B',
      latitude: 39.9042,
      longitude: 116.4074,
      isHot: true,
      deviceCount: 150,
    ),
    CityModel(
      id: '2',
      name: '上海',
      code: 'SH',
      pinyin: 'shanghai',
      initial: 'S',
      latitude: 31.2304,
      longitude: 121.4737,
      isHot: true,
      deviceCount: 200,
    ),
    CityModel(
      id: '3',
      name: '广州',
      code: 'GZ',
      pinyin: 'guangzhou',
      initial: 'G',
      latitude: 23.1291,
      longitude: 113.2644,
      isHot: true,
      deviceCount: 120,
    ),
    CityModel(
      id: '4',
      name: '深圳',
      code: 'SZ',
      pinyin: 'shenzhen',
      initial: 'S',
      latitude: 22.5431,
      longitude: 114.0579,
      isHot: true,
      deviceCount: 180,
    ),
    CityModel(
      id: '5',
      name: '杭州',
      code: 'HZ',
      pinyin: 'hangzhou',
      initial: 'H',
      latitude: 30.2741,
      longitude: 120.1551,
      isHot: true,
      deviceCount: 80,
    ),
    CityModel(
      id: '6',
      name: '成都',
      code: 'CD',
      pinyin: 'chengdu',
      initial: 'C',
      latitude: 30.5728,
      longitude: 104.0668,
      isHot: true,
      deviceCount: 90,
    ),
    CityModel(
      id: '7',
      name: '武汉',
      code: 'WH',
      pinyin: 'wuhan',
      initial: 'W',
      latitude: 30.5928,
      longitude: 114.3055,
      isHot: false,
      deviceCount: 60,
    ),
    CityModel(
      id: '8',
      name: '西安',
      code: 'XA',
      pinyin: 'xian',
      initial: 'X',
      latitude: 34.3416,
      longitude: 108.9398,
      isHot: false,
      deviceCount: 50,
    ),
    CityModel(
      id: '9',
      name: '重庆',
      code: 'CQ',
      pinyin: 'chongqing',
      initial: 'C',
      latitude: 29.5630,
      longitude: 106.5516,
      isHot: true,
      deviceCount: 100,
    ),
    CityModel(
      id: '10',
      name: '南京',
      code: 'NJ',
      pinyin: 'nanjing',
      initial: 'N',
      latitude: 32.0603,
      longitude: 118.7969,
      isHot: false,
      deviceCount: 70,
    ),
    CityModel(
      id: '11',
      name: '天津',
      code: 'TJ',
      pinyin: 'tianjin',
      initial: 'T',
      latitude: 39.0842,
      longitude: 117.2009,
      isHot: false,
      deviceCount: 40,
    ),
    CityModel(
      id: '12',
      name: '苏州',
      code: 'SZ',
      pinyin: 'suzhou',
      initial: 'S',
      latitude: 31.2989,
      longitude: 120.5853,
      isHot: false,
      deviceCount: 65,
    ),
    CityModel(
      id: '13',
      name: '长沙',
      code: 'CS',
      pinyin: 'changsha',
      initial: 'C',
      latitude: 28.2282,
      longitude: 112.9388,
      isHot: false,
      deviceCount: 55,
    ),
    CityModel(
      id: '14',
      name: '郑州',
      code: 'ZZ',
      pinyin: 'zhengzhou',
      initial: 'Z',
      latitude: 34.7466,
      longitude: 113.6253,
      isHot: false,
      deviceCount: 45,
    ),
    CityModel(
      id: '15',
      name: '东莞',
      code: 'DG',
      pinyin: 'dongguan',
      initial: 'D',
      latitude: 23.0207,
      longitude: 113.7518,
      isHot: false,
      deviceCount: 110,
    ),
    CityModel(
      id: '16',
      name: '佛山',
      code: 'FS',
      pinyin: 'foshan',
      initial: 'F',
      latitude: 23.0215,
      longitude: 113.1214,
      isHot: false,
      deviceCount: 30,
    ),
    CityModel(
      id: '17',
      name: '宁波',
      code: 'NB',
      pinyin: 'ningbo',
      initial: 'N',
      latitude: 29.8683,
      longitude: 121.5440,
      isHot: false,
      deviceCount: 35,
    ),
    CityModel(
      id: '18',
      name: '青岛',
      code: 'QD',
      pinyin: 'qingdao',
      initial: 'Q',
      latitude: 36.0671,
      longitude: 120.3826,
      isHot: false,
      deviceCount: 42,
    ),
    CityModel(
      id: '19',
      name: '无锡',
      code: 'WX',
      pinyin: 'wuxi',
      initial: 'W',
      latitude: 31.4912,
      longitude: 120.3119,
      isHot: false,
      deviceCount: 28,
    ),
    CityModel(
      id: '20',
      name: '合肥',
      code: 'HF',
      pinyin: 'hefei',
      initial: 'H',
      latitude: 31.8206,
      longitude: 117.2272,
      isHot: false,
      deviceCount: 38,
    ),
  ];

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
