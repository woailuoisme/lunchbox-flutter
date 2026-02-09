import 'package:lunchbox/features/profile/models/coupon_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coupon_repository.g.dart';

@riverpod
class CouponRepository extends _$CouponRepository {
  @override
  FutureOr<List<CouponModel>> build() async {
    return _getMockCoupons();
  }

  Future<List<CouponModel>> _getMockCoupons() async {
    // 模拟网络延迟
    await Future<void>.delayed(const Duration(milliseconds: 500));

    return [
      CouponModel(
        id: 1,
        amount: 10,
        title: '新用户立减券',
        condition: '满 50 元可用',
        expiryDate: '2025-12-31',
        status: 0,
      ),
      CouponModel(
        id: 2,
        amount: 5,
        title: '全场通用券',
        condition: '无门槛',
        expiryDate: '2025-11-30',
        status: 0,
      ),
      CouponModel(
        id: 3,
        amount: 20,
        title: '大额满减券',
        condition: '满 100 元可用',
        expiryDate: '2025-10-15',
        status: 1,
      ),
      CouponModel(
        id: 4,
        amount: 15,
        title: '限时优惠券',
        condition: '满 80 元可用',
        expiryDate: '2024-12-31',
        status: 2,
      ),
    ];
  }

  Future<List<CouponModel>> getCouponsByStatus(int status) async {
    final coupons = state.value ?? await _getMockCoupons();
    // status: -1 表示全部 (逻辑根据UI需求定，这里假设0:可用, 1:已用, 2:过期)
    // 如果UI需要筛选，可以在这里筛选
    if (status == -1) {
      return coupons;
    }
    return coupons.where((c) => c.status == status).toList();
  }
}

@riverpod
Future<List<CouponModel>> couponsByStatus(Ref ref, int status) {
  return ref
      .watch(couponRepositoryProvider.notifier)
      .getCouponsByStatus(status);
}
