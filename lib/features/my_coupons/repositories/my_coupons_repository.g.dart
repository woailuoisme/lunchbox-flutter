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
          AsyncValue<List<UserCouponModel>>,
          List<UserCouponModel>,
          FutureOr<List<UserCouponModel>>
        >
    with
        $FutureModifier<List<UserCouponModel>>,
        $FutureProvider<List<UserCouponModel>> {
  UserCouponsProvider._({
    required UserCouponsFamily super.from,
    required ({String? category, String? type, String? usedType})
    super.argument,
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
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<UserCouponModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserCouponModel>> create(Ref ref) {
    final argument =
        this.argument as ({String? category, String? type, String? usedType});
    return userCoupons(
      ref,
      category: argument.category,
      type: argument.type,
      usedType: argument.usedType,
    );
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

String _$userCouponsHash() => r'385ece46c06404c056fedd030dbe849c51b03f12';

final class UserCouponsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<UserCouponModel>>,
          ({String? category, String? type, String? usedType})
        > {
  UserCouponsFamily._()
    : super(
        retry: null,
        name: r'userCouponsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserCouponsProvider call({
    String? category,
    String? type,
    String? usedType,
  }) => UserCouponsProvider._(
    argument: (category: category, type: type, usedType: usedType),
    from: this,
  );

  @override
  String toString() => r'userCouponsProvider';
}
