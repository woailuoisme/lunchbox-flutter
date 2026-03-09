// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupons_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(couponsRepository)
final couponsRepositoryProvider = CouponsRepositoryProvider._();

final class CouponsRepositoryProvider
    extends
        $FunctionalProvider<
          CouponsRepository,
          CouponsRepository,
          CouponsRepository
        >
    with $Provider<CouponsRepository> {
  CouponsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'couponsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$couponsRepositoryHash();

  @$internal
  @override
  $ProviderElement<CouponsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CouponsRepository create(Ref ref) {
    return couponsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CouponsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CouponsRepository>(value),
    );
  }
}

String _$couponsRepositoryHash() => r'297d64b1c031736b971bc2e13cc6afc26d6d8bb7';
