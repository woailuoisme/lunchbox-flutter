// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchPackageInfo)
final fetchPackageInfoProvider = FetchPackageInfoProvider._();

final class FetchPackageInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<PackageInfo>,
          PackageInfo,
          FutureOr<PackageInfo>
        >
    with $FutureModifier<PackageInfo>, $FutureProvider<PackageInfo> {
  FetchPackageInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchPackageInfoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchPackageInfoHash();

  @$internal
  @override
  $FutureProviderElement<PackageInfo> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PackageInfo> create(Ref ref) {
    return fetchPackageInfo(ref);
  }
}

String _$fetchPackageInfoHash() => r'eeff8784ca60230d839dd06822c3906d9b9dbfb4';

@ProviderFor(deviceInfoPlugin)
final deviceInfoPluginProvider = DeviceInfoPluginProvider._();

final class DeviceInfoPluginProvider
    extends
        $FunctionalProvider<
          DeviceInfoPlugin,
          DeviceInfoPlugin,
          DeviceInfoPlugin
        >
    with $Provider<DeviceInfoPlugin> {
  DeviceInfoPluginProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceInfoPluginProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceInfoPluginHash();

  @$internal
  @override
  $ProviderElement<DeviceInfoPlugin> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeviceInfoPlugin create(Ref ref) {
    return deviceInfoPlugin(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceInfoPlugin value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceInfoPlugin>(value),
    );
  }
}

String _$deviceInfoPluginHash() => r'f1c9f905a947b140ac25171b8ac0707fc2dd3b2d';

@ProviderFor(fetchDeviceInfo)
final fetchDeviceInfoProvider = FetchDeviceInfoProvider._();

final class FetchDeviceInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<BaseDeviceInfo>,
          BaseDeviceInfo,
          FutureOr<BaseDeviceInfo>
        >
    with $FutureModifier<BaseDeviceInfo>, $FutureProvider<BaseDeviceInfo> {
  FetchDeviceInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchDeviceInfoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchDeviceInfoHash();

  @$internal
  @override
  $FutureProviderElement<BaseDeviceInfo> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<BaseDeviceInfo> create(Ref ref) {
    return fetchDeviceInfo(ref);
  }
}

String _$fetchDeviceInfoHash() => r'b206cca464cb618b1242287b1569341f44bf366c';
