// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_coupons_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(myCouponsRepository)
final myCouponsRepositoryProvider = MyCouponsRepositoryProvider._();

final class MyCouponsRepositoryProvider
    extends
        $FunctionalProvider<
          MyCouponsRepository,
          MyCouponsRepository,
          MyCouponsRepository
        >
    with $Provider<MyCouponsRepository> {
  MyCouponsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myCouponsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myCouponsRepositoryHash();

  @$internal
  @override
  $ProviderElement<MyCouponsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MyCouponsRepository create(Ref ref) {
    return myCouponsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MyCouponsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MyCouponsRepository>(value),
    );
  }
}

String _$myCouponsRepositoryHash() =>
    r'018a28f0af78e0ff471aba1b72f2eaec58711cae';
