import 'package:lunchbox/features/payment/datasources/payment_rest_client.dart';
import 'package:lunchbox/features/payment/entities/payment_intent_request.dart';
import 'package:lunchbox/features/payment/entities/payment_intent_response.dart';
import 'package:lunchbox/features/payment/entities/setup_intent_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_repository.g.dart';

@Riverpod(keepAlive: true)
PaymentRepository paymentRepository(Ref ref) {
  final restClient = ref.watch(paymentRestClientProvider);
  return PaymentRepository(restClient);
}

/// 支付仓库类
/// 负责处理支付相关的数据访问和业务逻辑
class PaymentRepository {
  PaymentRepository(this._client);

  final PaymentRestClient _client;

  /// 创建支付意向 (Payment Intent)
  Future<PaymentIntentResponse?> createPaymentIntent({
    int? orderId,
    double? amount,
    required String currency,
  }) async {
    final request = PaymentIntentRequest(
      orderId: orderId,
      amount: amount,
      currency: currency,
    );

    final response = await _client.createStripePaymentIntent(request: request);
    return response.data;
  }

  /// 创建设置意向 (Setup Intent)
  Future<SetupIntentResponse?> createSetupIntent() async {
    final response = await _client.createStripeSetupIntent();
    return response.data;
  }
}
