import 'package:lunchbox/features/coupons/datasources/coupons_rest_client.dart';
import 'package:lunchbox/features/coupons/entities/coupon_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coupons_repository.g.dart';

@Riverpod(keepAlive: true)
CouponsRepository couponsRepository(Ref ref) {
  return CouponsRepository(ref.watch(couponsRestClientProvider));
}

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

class CouponsRepository {
  CouponsRepository(this._client);

  final CouponsRestClient _client;

  /// 获取优惠券列表
  ///
  /// [category] 优惠券分类 (shop: 商城, goods: 食品)
  /// [type] 优惠券类型 (full_reduction: 满减券, discount: 折扣券, reduction: 减免)
  Future<List<CouponModel>> getCoupons({String? category, String? type}) async {
    final response = await _client.getCoupons(category: category, type: type);
    return response.data ?? [];
  }
}
