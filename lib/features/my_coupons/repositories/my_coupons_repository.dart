import 'package:lunchbox/core/errors/repository_error_handler_mixin.dart';
import 'package:lunchbox/core/errors/failure.dart';
import 'package:lunchbox/features/my_coupons/datasources/my_coupons_rest_client.dart';
import 'package:lunchbox/features/my_coupons/entities/user_coupon_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_coupons_repository.g.dart';

@Riverpod(keepAlive: true)
MyCouponsRepository myCouponsRepository(Ref ref) {
  return MyCouponsRepository(ref.watch(myCouponsRestClientProvider));
}

class MyCouponsRepository with RepositoryErrorHandlerMixin {
  MyCouponsRepository(this._client);

  final MyCouponsRestClient _client;

  Future<List<UserCouponModel>> getUserCoupons({
    String? category,
    String? type,
    String? usedType,
  }) async {
    try {
      final response = await _client.getUserCoupons(
        category: category,
        type: type,
        usedType: usedType,
      );
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
