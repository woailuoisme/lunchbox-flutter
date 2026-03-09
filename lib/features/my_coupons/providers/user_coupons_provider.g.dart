// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_coupons_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 获取用户的优惠券列表
///
/// [category] 优惠券分类筛选 (shop: 商城, goods: 食品)
/// [type] 优惠券类型筛选 (full_reduction: 满减券, discount: 折扣券, exchange: N元购券, gift: 赠品券)
/// [usedType] 使用状态筛选 (active: 可用, inactive: 已使用, expired: 已过期)

@ProviderFor(userCoupons)
final userCouponsProvider = UserCouponsFamily._();

/// 获取用户的优惠券列表
///
/// [category] 优惠券分类筛选 (shop: 商城, goods: 食品)
/// [type] 优惠券类型筛选 (full_reduction: 满减券, discount: 折扣券, exchange: N元购券, gift: 赠品券)
/// [usedType] 使用状态筛选 (active: 可用, inactive: 已使用, expired: 已过期)

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
  /// 获取用户的优惠券列表
  ///
  /// [category] 优惠券分类筛选 (shop: 商城, goods: 食品)
  /// [type] 优惠券类型筛选 (full_reduction: 满减券, discount: 折扣券, exchange: N元购券, gift: 赠品券)
  /// [usedType] 使用状态筛选 (active: 可用, inactive: 已使用, expired: 已过期)
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

/// 获取用户的优惠券列表
///
/// [category] 优惠券分类筛选 (shop: 商城, goods: 食品)
/// [type] 优惠券类型筛选 (full_reduction: 满减券, discount: 折扣券, exchange: N元购券, gift: 赠品券)
/// [usedType] 使用状态筛选 (active: 可用, inactive: 已使用, expired: 已过期)

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

  /// 获取用户的优惠券列表
  ///
  /// [category] 优惠券分类筛选 (shop: 商城, goods: 食品)
  /// [type] 优惠券类型筛选 (full_reduction: 满减券, discount: 折扣券, exchange: N元购券, gift: 赠品券)
  /// [usedType] 使用状态筛选 (active: 可用, inactive: 已使用, expired: 已过期)

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
