import 'package:lunchbox/core/errors/failure_extensions.dart';
import 'package:lunchbox/features/device/entities/city_model.dart';
import 'package:lunchbox/features/device/repositories/city_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'city_providers.g.dart';

/// 所有城市列表
@riverpod
class AllCities extends _$AllCities {
  @override
  Future<List<CityModel>> build() async {
    final repository = ref.watch(cityRepositoryProvider);
    final result = await repository.getAllCities().run();
    return result.getOrThrow();
  }
}

/// 热门城市列表
@riverpod
class HotCities extends _$HotCities {
  @override
  Future<List<CityModel>> build() async {
    final repository = ref.watch(cityRepositoryProvider);
    final result = await repository.getHotCities().run();
    return result.getOrThrow();
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
      return city.name.contains(query) ||
          city.pinyin.toLowerCase().contains(lowercaseQuery);
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
      final initial = city.initial.toUpperCase();
      if (!result.containsKey(initial)) {
        result[initial] = [];
      }
      result[initial]!.add(city);
    }

    final sortedKeys = result.keys.toList()..sort();
    final Map<String, List<CityModel>> sortedResult = {};
    for (final key in sortedKeys) {
      sortedResult[key] = result[key]!;
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
