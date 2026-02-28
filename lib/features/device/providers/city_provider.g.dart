// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_provider.dart';

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

String _$allCitiesHash() => r'949ff3106431f287626364c64f904a51e2e99fbe';

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

String _$hotCitiesHash() => r'8ac87159e16df7891c8b7f22660cd3818d771c29';

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

String _$citySearchQueryHash() => r'4e7bfd02c6e921ff6237bf460022e6b1f9493683';

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

String _$filteredCitiesHash() => r'45cd8d944f909fb76d7d8ee89ea7039f9b200a15';

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

String _$groupedCitiesHash() => r'099be85fc53d6d4e0b75d3f0ea01d23f765d4968';

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
