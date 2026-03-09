import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:lunchbox/features/coupons/entities/coupon_model.dart';
import 'package:lunchbox/features/coupons/repositories/coupons_repository.dart';

part 'coupon_provider.g.dart';

@riverpod
Future<List<CouponModel>> coupons(
  Ref ref, {
  String? category,
  String? type,
}) async {
  return ref
      .watch(couponsRepositoryProvider)
      .getCoupons(category: category, type: type);
}

@riverpod
class CatchCoupon extends _$CatchCoupon {
  @override
  FutureOr<void> build(int id) {}

  /// 领取优惠券
  Future<void> submit() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(couponsRepositoryProvider);
      await repository.catchCoupon(couponId: id);

      // 领取成功后刷新列表
      ref.invalidate(couponsProvider);
    });
  }
}
