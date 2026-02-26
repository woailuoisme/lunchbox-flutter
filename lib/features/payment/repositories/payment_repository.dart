import 'package:lunchbox/core/errors/errors.dart';
import 'package:lunchbox/core/errors/repository_error_handler_mixin.dart';
import 'package:lunchbox/features/payment/datasources/payment_rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_repository.g.dart';

@Riverpod(keepAlive: true)
PaymentRepository paymentRepository(Ref ref) {
  final restClient = ref.watch(paymentRestClientProvider);
  return PaymentRepository(restClient);
}

/// 支付仓库类
/// 负责处理支付相关的数据访问和业务逻辑
class PaymentRepository with RepositoryErrorHandlerMixin {
  PaymentRepository(this._client);

  final PaymentRestClient _client;

  /// 创建支付意向 (Payment Intent)
  Future<Map<String, dynamic>> createPaymentIntent(
    String orderId,
    double amount,
    String currency,
  ) async {
    try {
      final paymentData = {
        'orderId': orderId,
        'amount': (amount * 100).toInt(), // Stripe uses cents
        'currency': currency,
      };

      final response = await _client.createPaymentIntent(orderId, paymentData);
      if (response.success && response.data != null) {
        return response.data! as Map<String, dynamic>;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }

  /// 查询支付状态
  Future<String> checkPaymentStatus(String orderId, String paymentId) async {
    try {
      final response = await _client.checkPaymentStatus(orderId, paymentId);
      if (response.success && response.data != null) {
        final data = response.data! as Map<String, dynamic>;
        return data['status'] as String;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }

  /// 取消支付
  Future<bool> cancelPayment(String orderId) async {
    try {
      final response = await _client.cancelPayment(orderId);
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
