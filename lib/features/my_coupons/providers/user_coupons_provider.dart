import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:lunchbox/features/my_coupons/entities/user_coupon_model.dart';
import 'package:lunchbox/features/my_coupons/repositories/my_coupons_repository.dart';

part 'user_coupons_provider.g.dart';

/// 获取用户的优惠券列表
///
/// [category] 优惠券分类筛选 (shop: 商城, goods: 食品)
/// [type] 优惠券类型筛选 (full_reduction: 满减券, discount: 折扣券, exchange: N元购券, gift: 赠品券)
/// [usedType] 使用状态筛选 (active: 可用, inactive: 已使用, expired: 已过期)
@riverpod
Future<List<UserCouponModel>> userCoupons(
  Ref ref, {
  String? category,
  String? type,
  String? usedType,
}) {
  return ref
      .watch(myCouponsRepositoryProvider)
      .getUserCoupons(category: category, type: type, usedType: usedType);
}
