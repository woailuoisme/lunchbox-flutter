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

@ProviderFor(userCoupons)
final userCouponsProvider = UserCouponsFamily._();

final class UserCouponsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CouponModel>>,
          List<CouponModel>,
          FutureOr<List<CouponModel>>
        >
    with
        $FutureModifier<List<CouponModel>>,
        $FutureProvider<List<CouponModel>> {
  UserCouponsProvider._({
    required UserCouponsFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'userCouponsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userCouponsHash();

  @override
  String toString() {
    return r'userCouponsProvider'
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
    final argument = this.argument as int?;
    return userCoupons(ref, status: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserCouponsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userCouponsHash() => r'e44f2d8d783470e2941ecd234e71fe0193d81629';

final class UserCouponsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<CouponModel>>, int?> {
  UserCouponsFamily._()
    : super(
        retry: null,
        name: r'userCouponsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserCouponsProvider call({int? status}) =>
      UserCouponsProvider._(argument: status, from: this);

  @override
  String toString() => r'userCouponsProvider';
}
