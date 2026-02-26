import 'package:lunchbox/core/errors/repository_error_handler_mixin.dart';
import 'package:lunchbox/core/errors/failure.dart';
import 'package:lunchbox/features/coupons/datasources/coupons_rest_client.dart';
import 'package:lunchbox/features/coupons/entities/coupon_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coupons_repository.g.dart';

@Riverpod(keepAlive: true)
CouponsRepository couponsRepository(Ref ref) {
  return CouponsRepository(ref.watch(couponsRestClientProvider));
}

class CouponsRepository with RepositoryErrorHandlerMixin {
  CouponsRepository(this._client);

  final CouponsRestClient _client;

  Future<List<CouponModel>> getCoupons({String? type}) async {
    try {
      final response = await _client.getCoupons(type: type);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }
}
