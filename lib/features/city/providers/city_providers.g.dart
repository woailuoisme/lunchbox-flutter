// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 所有城市列表

@ProviderFor(AllCities)
final allCitiesProvider = AllCitiesProvider._();

/// 所有城市列表
final class AllCitiesProvider
    extends $AsyncNotifierProvider<AllCities, List<CityModel>> {
  /// 所有城市列表
  AllCitiesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allCitiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allCitiesHash();

  @$internal
  @override
  AllCities create() => AllCities();
}

String _$allCitiesHash() => r'cab32fc00f50f5554282b0fbbc0df9020d23db95';

/// 所有城市列表

abstract class _$AllCities extends $AsyncNotifier<List<CityModel>> {
  FutureOr<List<CityModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<CityModel>>, List<CityModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<CityModel>>, List<CityModel>>,
              AsyncValue<List<CityModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 热门城市列表

@ProviderFor(HotCities)
final hotCitiesProvider = HotCitiesProvider._();

/// 热门城市列表
final class HotCitiesProvider
    extends $AsyncNotifierProvider<HotCities, List<CityModel>> {
  /// 热门城市列表
  HotCitiesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hotCitiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hotCitiesHash();

  @$internal
  @override
  HotCities create() => HotCities();
}

String _$hotCitiesHash() => r'f1b5dbd368a6ad010741698b4698666de3a95995';

/// 热门城市列表

abstract class _$HotCities extends $AsyncNotifier<List<CityModel>> {
  FutureOr<List<CityModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<CityModel>>, List<CityModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<CityModel>>, List<CityModel>>,
              AsyncValue<List<CityModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 搜索关键词

@ProviderFor(CitySearchQuery)
final citySearchQueryProvider = CitySearchQueryProvider._();

/// 搜索关键词
final class CitySearchQueryProvider
    extends $NotifierProvider<CitySearchQuery, String> {
  /// 搜索关键词
  CitySearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'citySearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$citySearchQueryHash();

  @$internal
  @override
  CitySearchQuery create() => CitySearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$citySearchQueryHash() => r'54e7979c333758e99cb94f8cd8c447908adbd313';

/// 搜索关键词

abstract class _$CitySearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 过滤后的城市列表

@ProviderFor(FilteredCities)
final filteredCitiesProvider = FilteredCitiesProvider._();

/// 过滤后的城市列表
final class FilteredCitiesProvider
    extends $NotifierProvider<FilteredCities, List<CityModel>> {
  /// 过滤后的城市列表
  FilteredCitiesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredCitiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredCitiesHash();

  @$internal
  @override
  FilteredCities create() => FilteredCities();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CityModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CityModel>>(value),
    );
  }
}

String _$filteredCitiesHash() => r'b68871d96a49d326f9943c6d66dbae9bdeed090e';

/// 过滤后的城市列表

abstract class _$FilteredCities extends $Notifier<List<CityModel>> {
  List<CityModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<CityModel>, List<CityModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<CityModel>, List<CityModel>>,
              List<CityModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 分组城市列表（按首字母）

@ProviderFor(GroupedCities)
final groupedCitiesProvider = GroupedCitiesProvider._();

/// 分组城市列表（按首字母）
final class GroupedCitiesProvider
    extends $NotifierProvider<GroupedCities, Map<String, List<CityModel>>> {
  /// 分组城市列表（按首字母）
  GroupedCitiesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groupedCitiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groupedCitiesHash();

  @$internal
  @override
  GroupedCities create() => GroupedCities();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, List<CityModel>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, List<CityModel>>>(value),
    );
  }
}

String _$groupedCitiesHash() => r'94aa795f0b8390d1ae46303b61548f2d85d88e9a';

/// 分组城市列表（按首字母）

abstract class _$GroupedCities extends $Notifier<Map<String, List<CityModel>>> {
  Map<String, List<CityModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<Map<String, List<CityModel>>, Map<String, List<CityModel>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Map<String, List<CityModel>>,
                Map<String, List<CityModel>>
              >,
              Map<String, List<CityModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 当前选中的城市

@ProviderFor(SelectedCity)
final selectedCityProvider = SelectedCityProvider._();

/// 当前选中的城市
final class SelectedCityProvider
    extends $AsyncNotifierProvider<SelectedCity, CityModel?> {
  /// 当前选中的城市
  SelectedCityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCityHash();

  @$internal
  @override
  SelectedCity create() => SelectedCity();
}

String _$selectedCityHash() => r'9d169dec0e83e7d1234e05d279a4e06c2a3ff0a1';

/// 当前选中的城市

abstract class _$SelectedCity extends $AsyncNotifier<CityModel?> {
  FutureOr<CityModel?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CityModel?>, CityModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CityModel?>, CityModel?>,
              AsyncValue<CityModel?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
