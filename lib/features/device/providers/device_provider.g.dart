// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 设备排序方式

@ProviderFor(DeviceSort)
final deviceSortProvider = DeviceSortProvider._();

/// 设备排序方式
final class DeviceSortProvider extends $NotifierProvider<DeviceSort, String> {
  /// 设备排序方式
  DeviceSortProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceSortProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceSortHash();

  @$internal
  @override
  DeviceSort create() => DeviceSort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$deviceSortHash() => r'119025816671826e624f30ea52ec94c49e90efb2';

/// 设备排序方式

abstract class _$DeviceSort extends $Notifier<String> {
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

/// 仅显示在线设备过滤

@ProviderFor(DeviceFilterOnline)
final deviceFilterOnlineProvider = DeviceFilterOnlineProvider._();

/// 仅显示在线设备过滤
final class DeviceFilterOnlineProvider
    extends $NotifierProvider<DeviceFilterOnline, bool> {
  /// 仅显示在线设备过滤
  DeviceFilterOnlineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceFilterOnlineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceFilterOnlineHash();

  @$internal
  @override
  DeviceFilterOnline create() => DeviceFilterOnline();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$deviceFilterOnlineHash() =>
    r'3f8894b1bdea4e9e4e5610453d22775d6f5794c8';

/// 仅显示在线设备过滤

abstract class _$DeviceFilterOnline extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 设备搜索关键词

@ProviderFor(DeviceSearchQuery)
final deviceSearchQueryProvider = DeviceSearchQueryProvider._();

/// 设备搜索关键词
final class DeviceSearchQueryProvider
    extends $NotifierProvider<DeviceSearchQuery, String> {
  /// 设备搜索关键词
  DeviceSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceSearchQueryHash();

  @$internal
  @override
  DeviceSearchQuery create() => DeviceSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$deviceSearchQueryHash() => r'34728661a9dad7a36ca6c38255bdb5d6cf03f49a';

/// 设备搜索关键词

abstract class _$DeviceSearchQuery extends $Notifier<String> {
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

/// 附近设备列表（基于选中的城市和当前位置）

@ProviderFor(NearbyDevices)
final nearbyDevicesProvider = NearbyDevicesProvider._();

/// 附近设备列表（基于选中的城市和当前位置）
final class NearbyDevicesProvider
    extends $AsyncNotifierProvider<NearbyDevices, List<DeviceModel>> {
  /// 附近设备列表（基于选中的城市和当前位置）
  NearbyDevicesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nearbyDevicesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nearbyDevicesHash();

  @$internal
  @override
  NearbyDevices create() => NearbyDevices();
}

String _$nearbyDevicesHash() => r'a7b495a3449ae60fa5c8550a19e37baed1f503af';

/// 附近设备列表（基于选中的城市和当前位置）

abstract class _$NearbyDevices extends $AsyncNotifier<List<DeviceModel>> {
  FutureOr<List<DeviceModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<DeviceModel>>, List<DeviceModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<DeviceModel>>, List<DeviceModel>>,
              AsyncValue<List<DeviceModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 常用设备列表

@ProviderFor(FrequentDevices)
final frequentDevicesProvider = FrequentDevicesProvider._();

/// 常用设备列表
final class FrequentDevicesProvider
    extends $AsyncNotifierProvider<FrequentDevices, List<DeviceModel>> {
  /// 常用设备列表
  FrequentDevicesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'frequentDevicesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$frequentDevicesHash();

  @$internal
  @override
  FrequentDevices create() => FrequentDevices();
}

String _$frequentDevicesHash() => r'3f7b3b8e1b985f60f77c5051a55496e1d798ba26';

/// 常用设备列表

abstract class _$FrequentDevices extends $AsyncNotifier<List<DeviceModel>> {
  FutureOr<List<DeviceModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<DeviceModel>>, List<DeviceModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<DeviceModel>>, List<DeviceModel>>,
              AsyncValue<List<DeviceModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 过滤和排序后的附近设备列表

@ProviderFor(filteredNearbyDevices)
final filteredNearbyDevicesProvider = FilteredNearbyDevicesProvider._();

/// 过滤和排序后的附近设备列表

final class FilteredNearbyDevicesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DeviceModel>>,
          List<DeviceModel>,
          FutureOr<List<DeviceModel>>
        >
    with
        $FutureModifier<List<DeviceModel>>,
        $FutureProvider<List<DeviceModel>> {
  /// 过滤和排序后的附近设备列表
  FilteredNearbyDevicesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredNearbyDevicesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredNearbyDevicesHash();

  @$internal
  @override
  $FutureProviderElement<List<DeviceModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<DeviceModel>> create(Ref ref) {
    return filteredNearbyDevices(ref);
  }
}

String _$filteredNearbyDevicesHash() =>
    r'049788784f00ea36b490f2df5cbd8708cb337b84';

/// 过滤和排序后的常用设备列表

@ProviderFor(filteredFrequentDevices)
final filteredFrequentDevicesProvider = FilteredFrequentDevicesProvider._();

/// 过滤和排序后的常用设备列表

final class FilteredFrequentDevicesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DeviceModel>>,
          List<DeviceModel>,
          FutureOr<List<DeviceModel>>
        >
    with
        $FutureModifier<List<DeviceModel>>,
        $FutureProvider<List<DeviceModel>> {
  /// 过滤和排序后的常用设备列表
  FilteredFrequentDevicesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredFrequentDevicesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredFrequentDevicesHash();

  @$internal
  @override
  $FutureProviderElement<List<DeviceModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<DeviceModel>> create(Ref ref) {
    return filteredFrequentDevices(ref);
  }
}

String _$filteredFrequentDevicesHash() =>
    r'3bead86e00da2f0f9506fab1b2388cd8693ffc42';

/// 当前选中的设备

@ProviderFor(SelectedDevice)
final selectedDeviceProvider = SelectedDeviceProvider._();

/// 当前选中的设备
final class SelectedDeviceProvider
    extends $NotifierProvider<SelectedDevice, DeviceModel?> {
  /// 当前选中的设备
  SelectedDeviceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedDeviceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedDeviceHash();

  @$internal
  @override
  SelectedDevice create() => SelectedDevice();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceModel?>(value),
    );
  }
}

String _$selectedDeviceHash() => r'6807abcadd32be6f66d3c5ea83d3bf6dee50b184';

/// 当前选中的设备

abstract class _$SelectedDevice extends $Notifier<DeviceModel?> {
  DeviceModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DeviceModel?, DeviceModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DeviceModel?, DeviceModel?>,
              DeviceModel?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 根据ID获取设备详情

@ProviderFor(deviceDetail)
final deviceDetailProvider = DeviceDetailFamily._();

/// 根据ID获取设备详情

final class DeviceDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<DeviceModel>,
          DeviceModel,
          FutureOr<DeviceModel>
        >
    with $FutureModifier<DeviceModel>, $FutureProvider<DeviceModel> {
  /// 根据ID获取设备详情
  DeviceDetailProvider._({
    required DeviceDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'deviceDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deviceDetailHash();

  @override
  String toString() {
    return r'deviceDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<DeviceModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DeviceModel> create(Ref ref) {
    final argument = this.argument as String;
    return deviceDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DeviceDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deviceDetailHash() => r'79272875ce3bf417c5b4289533149d8f5f13f372';

/// 根据ID获取设备详情

final class DeviceDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<DeviceModel>, String> {
  DeviceDetailFamily._()
    : super(
        retry: null,
        name: r'deviceDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 根据ID获取设备详情

  DeviceDetailProvider call(String deviceId) =>
      DeviceDetailProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'deviceDetailProvider';
}

/// 获取指定设备的产品列表

@ProviderFor(deviceProducts)
final deviceProductsProvider = DeviceProductsFamily._();

/// 获取指定设备的产品列表

final class DeviceProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProductModel>>,
          List<ProductModel>,
          FutureOr<List<ProductModel>>
        >
    with
        $FutureModifier<List<ProductModel>>,
        $FutureProvider<List<ProductModel>> {
  /// 获取指定设备的产品列表
  DeviceProductsProvider._({
    required DeviceProductsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'deviceProductsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deviceProductsHash();

  @override
  String toString() {
    return r'deviceProductsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ProductModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProductModel>> create(Ref ref) {
    final argument = this.argument as String;
    return deviceProducts(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DeviceProductsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deviceProductsHash() => r'82e48fdde8d555c9b5b84c301a0ebd7e15b8026c';

/// 获取指定设备的产品列表

final class DeviceProductsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ProductModel>>, String> {
  DeviceProductsFamily._()
    : super(
        retry: null,
        name: r'deviceProductsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 获取指定设备的产品列表

  DeviceProductsProvider call(String deviceId) =>
      DeviceProductsProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'deviceProductsProvider';
}
