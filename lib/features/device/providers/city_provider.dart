import 'package:lpinyin/lpinyin.dart';
import 'package:lunchbox/features/device/entities/city_model.dart';
import 'package:lunchbox/features/device/repositories/city_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'city_provider.g.dart';

/// 所有城市列表
@riverpod
class AllCities extends _$AllCities {
  @override
  Future<List<CityModel>> build() async {
    ref.keepAlive();
    final repository = ref.watch(cityRepositoryProvider);
    return await repository.getAllCities();
  }
}

/// 热门城市列表
@riverpod
class HotCities extends _$HotCities {
  @override
  Future<List<CityModel>> build() async {
    ref.keepAlive();
    final repository = ref.watch(cityRepositoryProvider);
    return await repository.getHotCities();
  }
}

/// 搜索关键词
@riverpod
class CitySearchQuery extends _$CitySearchQuery {
  @override
  String build() => '';

  String get query => state;

  set query(String value) {
    state = value;
  }
}

/// 过滤后的城市列表
@riverpod
class FilteredCities extends _$FilteredCities {
  @override
  List<CityModel> build() {
    final cities = ref.watch(allCitiesProvider).asData?.value ?? [];
    final query = ref.watch(citySearchQueryProvider);

    if (query.isEmpty) {
      return cities;
    }

    final lowercaseQuery = query.toLowerCase();
    return cities.where((city) {
      return city.name.toLowerCase().contains(lowercaseQuery) ||
          city.code.toLowerCase().contains(lowercaseQuery) ||
          city.province.toLowerCase().contains(lowercaseQuery) ||
          city.city.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }
}

/// 分组城市列表（按首字母）
@riverpod
class GroupedCities extends _$GroupedCities {
  @override
  Map<String, List<CityModel>> build() {
    final cities = ref.watch(allCitiesProvider).asData?.value ?? [];

    final Map<String, List<CityModel>> result = {};

    for (final city in cities) {
      // 使用 lpinyin 获取城市名称的首字母
      String initial = '#';
      if (city.name.isNotEmpty) {
        final pinyin = PinyinHelper.getPinyin(city.name);
        if (pinyin.isNotEmpty) {
          initial = pinyin[0].toUpperCase();
        }
      }

      // 确保 initial 是 A-Z，否则归类到 #
      if (!RegExp(r'[A-Z]').hasMatch(initial)) {
        initial = '#';
      }

      if (!result.containsKey(initial)) {
        result[initial] = [];
      }
      result[initial]!.add(city);
    }

    // 排序逻辑：A-Z 在前，# 在最后
    final sortedKeys = result.keys.toList()
      ..sort((a, b) {
        if (a == '#') return 1;
        if (b == '#') return -1;
        return a.compareTo(b);
      });

    final Map<String, List<CityModel>> sortedResult = {};
    for (final key in sortedKeys) {
      // 组内城市按名称排序
      final list = result[key]!;
      list.sort((a, b) => a.name.compareTo(b.name));
      sortedResult[key] = list;
    }

    return sortedResult;
  }
}

/// 当前选中的城市
@riverpod
class SelectedCity extends _$SelectedCity {
  @override
  Future<CityModel?> build() async {
    return ref.read(cityRepositoryProvider).getSelectedCity();
  }

  Future<void> set(CityModel city) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(cityRepositoryProvider).saveSelectedCity(city);
      return city;
    });
  }
}
