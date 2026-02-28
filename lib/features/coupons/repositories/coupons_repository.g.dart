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

@ProviderFor(coupons)
final couponsProvider = CouponsFamily._();

final class CouponsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CouponModel>>,
          List<CouponModel>,
          FutureOr<List<CouponModel>>
        >
    with
        $FutureModifier<List<CouponModel>>,
        $FutureProvider<List<CouponModel>> {
  CouponsProvider._({
    required CouponsFamily super.from,
    required ({String? category, String? type}) super.argument,
  }) : super(
         retry: null,
         name: r'couponsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$couponsHash();

  @override
  String toString() {
    return r'couponsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<CouponModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CouponModel>> create(Ref ref) {
    final argument = this.argument as ({String? category, String? type});
    return coupons(ref, category: argument.category, type: argument.type);
  }

  @override
  bool operator ==(Object other) {
    return other is CouponsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$couponsHash() => r'acc2747920ff416efb5240fe272bf31667dc7310';

final class CouponsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<CouponModel>>,
          ({String? category, String? type})
        > {
  CouponsFamily._()
    : super(
        retry: null,
        name: r'couponsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CouponsProvider call({String? category, String? type}) =>
      CouponsProvider._(argument: (category: category, type: type), from: this);

  @override
  String toString() => r'couponsProvider';
}
