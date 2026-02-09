// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CouponRepository)
final couponRepositoryProvider = CouponRepositoryProvider._();

final class CouponRepositoryProvider
    extends $AsyncNotifierProvider<CouponRepository, List<CouponModel>> {
  CouponRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'couponRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$couponRepositoryHash();

  @$internal
  @override
  CouponRepository create() => CouponRepository();
}

String _$couponRepositoryHash() => r'42ee47e4a66c0a80743e9f1a888c9bcca8e2a874';

abstract class _$CouponRepository extends $AsyncNotifier<List<CouponModel>> {
  FutureOr<List<CouponModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<CouponModel>>, List<CouponModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<CouponModel>>, List<CouponModel>>,
              AsyncValue<List<CouponModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(couponsByStatus)
final couponsByStatusProvider = CouponsByStatusFamily._();

final class CouponsByStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CouponModel>>,
          List<CouponModel>,
          FutureOr<List<CouponModel>>
        >
    with
        $FutureModifier<List<CouponModel>>,
        $FutureProvider<List<CouponModel>> {
  CouponsByStatusProvider._({
    required CouponsByStatusFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'couponsByStatusProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$couponsByStatusHash();

  @override
  String toString() {
    return r'couponsByStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<CouponModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CouponModel>> create(Ref ref) {
    final argument = this.argument as int;
    return couponsByStatus(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CouponsByStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$couponsByStatusHash() => r'35faa5393f75cb4075d1d69c659fb8fd18f601a9';

final class CouponsByStatusFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<CouponModel>>, int> {
  CouponsByStatusFamily._()
    : super(
        retry: null,
        name: r'couponsByStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CouponsByStatusProvider call(int status) =>
      CouponsByStatusProvider._(argument: status, from: this);

  @override
  String toString() => r'couponsByStatusProvider';
}
