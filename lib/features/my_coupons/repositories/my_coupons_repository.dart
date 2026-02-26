import 'package:lunchbox/features/coupons/entities/coupon_model.dart';
import 'package:lunchbox/features/my_coupons/datasources/my_coupons_rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_coupons_repository.g.dart';

@Riverpod(keepAlive: true)
MyCouponsRepository myCouponsRepository(Ref ref) {
  return MyCouponsRepository(ref.watch(myCouponsRestClientProvider));
}

class MyCouponsRepository {
  MyCouponsRepository(this._client);

  final MyCouponsRestClient _client;

  Future<List<CouponModel>> getUserCoupons({int? status}) async {
    final response = await _client.getUserCoupons(status: status);
    return response.data ?? [];
  }
}

@riverpod
Future<List<CouponModel>> userCoupons(Ref ref, {int? status}) {
  return ref.watch(myCouponsRepositoryProvider).getUserCoupons(status: status);
}
