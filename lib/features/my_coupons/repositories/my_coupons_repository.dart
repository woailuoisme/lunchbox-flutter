import 'package:lunchbox/features/my_coupons/datasources/my_coupons_rest_client.dart';
import 'package:lunchbox/features/my_coupons/entities/user_coupon_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_coupons_repository.g.dart';

@Riverpod(keepAlive: true)
MyCouponsRepository myCouponsRepository(Ref ref) {
  return MyCouponsRepository(ref.watch(myCouponsRestClientProvider));
}

class MyCouponsRepository {
  MyCouponsRepository(this._client);

  final MyCouponsRestClient _client;

  /// 根据筛选条件获取用户的优惠券列表
  Future<List<UserCouponModel>> getUserCoupons({
    String? category,
    String? type,
    String? usedType,
  }) async {
    final response = await _client.getUserCoupons(
      category: category,
      type: type,
      usedType: usedType,
    );
    return response.data ?? [];
  }
}
