// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulated_device_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(simulatedDeviceRepository)
final simulatedDeviceRepositoryProvider = SimulatedDeviceRepositoryProvider._();

final class SimulatedDeviceRepositoryProvider
    extends
        $FunctionalProvider<
          SimulatedDeviceRepository,
          SimulatedDeviceRepository,
          SimulatedDeviceRepository
        >
    with $Provider<SimulatedDeviceRepository> {
  SimulatedDeviceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'simulatedDeviceRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$simulatedDeviceRepositoryHash();

  @$internal
  @override
  $ProviderElement<SimulatedDeviceRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SimulatedDeviceRepository create(Ref ref) {
    return simulatedDeviceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SimulatedDeviceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SimulatedDeviceRepository>(value),
    );
  }
}

String _$simulatedDeviceRepositoryHash() =>
    r'ca91924d7ae271caaa6f3062262ce92f13d6beea';
