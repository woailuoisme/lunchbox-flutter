import 'package:lunchbox/features/coupons/datasources/coupons_rest_client.dart';
import 'package:lunchbox/features/coupons/entities/coupon_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coupons_repository.g.dart';

@Riverpod(keepAlive: true)
CouponsRepository couponsRepository(Ref ref) {
  return CouponsRepository(ref.watch(couponsRestClientProvider));
}

class CouponsRepository {
  CouponsRepository(this._client);

  final CouponsRestClient _client;

  Future<List<CouponModel>> getCoupons({String? type}) async {
    final response = await _client.getCoupons(type: type);
    return response.data ?? [];
  }
}
