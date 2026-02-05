import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lunchbox/core/errors/errors.dart';
import 'package:lunchbox/core/network/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_repository.g.dart';

@Riverpod(keepAlive: true)
PaymentRepository paymentRepository(Ref ref) {
  final restClient = ref.watch(restClientProvider);
  return PaymentRepository(restClient);
}

/// 支付仓库类
/// 负责处理支付相关的数据访问和业务逻辑
class PaymentRepository {
  PaymentRepository(this._client);

  final RestClient _client;

  /// 创建支付意向 (Payment Intent)
  TaskEither<Failure, Map<String, dynamic>> createPaymentIntent(
    String orderId,
    double amount,
    String currency,
  ) {
    return TaskEither.tryCatch(() async {
      final paymentData = {
        'orderId': orderId,
        'amount': (amount * 100).toInt(), // Stripe uses cents
        'currency': currency,
      };

      final response = await _client.createPaymentIntent(orderId, paymentData);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 查询支付状态
  TaskEither<Failure, String> checkPaymentStatus(
    String orderId,
    String paymentId,
  ) {
    return TaskEither.tryCatch(() async {
      final response = await _client.checkPaymentStatus(orderId, paymentId);
      if (response.success && response.data != null) {
        return response.data!['status'] as String;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 取消支付
  TaskEither<Failure, bool> cancelPayment(String orderId) {
    return TaskEither.tryCatch(() async {
      final response = await _client.cancelPayment(orderId);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  Failure _handleError(Object error, StackTrace stackTrace) {
    if (error is DioException) {
      return Failure.network(
        message: error.message ?? 'Unknown network error',
        statusCode: error.response?.statusCode,
      );
    }
    return Failure.server(message: error.toString(), statusCode: 500);
  }
}
