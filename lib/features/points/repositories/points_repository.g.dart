// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PointsRepository)
final pointsRepositoryProvider = PointsRepositoryProvider._();

final class PointsRepositoryProvider
    extends $AsyncNotifierProvider<PointsRepository, void> {
  PointsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pointsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pointsRepositoryHash();

  @$internal
  @override
  PointsRepository create() => PointsRepository();
}

String _$pointsRepositoryHash() => r'7ee61572256c86e3608d2c67155046fb7ce6589f';

abstract class _$PointsRepository extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(pointsBalance)
final pointsBalanceProvider = PointsBalanceProvider._();

final class PointsBalanceProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  PointsBalanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pointsBalanceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pointsBalanceHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return pointsBalance(ref);
  }
}

String _$pointsBalanceHash() => r'1d537d990d93522c7393fb0947c7bd89384992ac';

@ProviderFor(pointsRecords)
final pointsRecordsProvider = PointsRecordsProvider._();

final class PointsRecordsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PointsRecordModel>>,
          List<PointsRecordModel>,
          FutureOr<List<PointsRecordModel>>
        >
    with
        $FutureModifier<List<PointsRecordModel>>,
        $FutureProvider<List<PointsRecordModel>> {
  PointsRecordsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pointsRecordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pointsRecordsHash();

  @$internal
  @override
  $FutureProviderElement<List<PointsRecordModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PointsRecordModel>> create(Ref ref) {
    return pointsRecords(ref);
  }
}

String _$pointsRecordsHash() => r'43fcb7c3f0e5223cee8b1a66811b1c726e71a203';

@ProviderFor(mallProducts)
final mallProductsProvider = MallProductsProvider._();

final class MallProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MallProductModel>>,
          List<MallProductModel>,
          FutureOr<List<MallProductModel>>
        >
    with
        $FutureModifier<List<MallProductModel>>,
        $FutureProvider<List<MallProductModel>> {
  MallProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mallProductsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mallProductsHash();

  @$internal
  @override
  $FutureProviderElement<List<MallProductModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MallProductModel>> create(Ref ref) {
    return mallProducts(ref);
  }
}

String _$mallProductsHash() => r'87b225c22d5695f76d44b6c03ba93428c341d6e9';
