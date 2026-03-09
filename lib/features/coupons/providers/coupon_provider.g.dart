// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

@ProviderFor(CatchCoupon)
final catchCouponProvider = CatchCouponFamily._();

final class CatchCouponProvider
    extends $AsyncNotifierProvider<CatchCoupon, void> {
  CatchCouponProvider._({
    required CatchCouponFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'catchCouponProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$catchCouponHash();

  @override
  String toString() {
    return r'catchCouponProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CatchCoupon create() => CatchCoupon();

  @override
  bool operator ==(Object other) {
    return other is CatchCouponProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$catchCouponHash() => r'91710c2c869fb7520d6a54e0aa8889f05465f94c';

final class CatchCouponFamily extends $Family
    with
        $ClassFamilyOverride<
          CatchCoupon,
          AsyncValue<void>,
          void,
          FutureOr<void>,
          int
        > {
  CatchCouponFamily._()
    : super(
        retry: null,
        name: r'catchCouponProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CatchCouponProvider call(int id) =>
      CatchCouponProvider._(argument: id, from: this);

  @override
  String toString() => r'catchCouponProvider';
}

abstract class _$CatchCoupon extends $AsyncNotifier<void> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  FutureOr<void> build(int id);
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
    element.handleCreate(ref, () => build(_$args));
  }
}
