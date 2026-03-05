import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/payment/entities/payment_intent_request.dart';
import 'package:lunchbox/features/payment/entities/payment_intent_response.dart';
import 'package:lunchbox/features/payment/entities/setup_intent_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_rest_client.g.dart';

@Riverpod(keepAlive: true)
PaymentRestClient paymentRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return PaymentRestClient(dio);
}

@RestApi()
abstract class PaymentRestClient {
  factory PaymentRestClient(Dio dio, {String baseUrl}) = _PaymentRestClient;

  /// 创建支付意向
  @POST('/api/v1/stripe/payment-intent')
  Future<ApiResponse<PaymentIntentResponse>> createStripePaymentIntent({
    @Body() required PaymentIntentRequest request,
  });

  /// 创建设置意向
  @POST('/api/v1/stripe/setup-intent')
  Future<ApiResponse<SetupIntentResponse>> createStripeSetupIntent();
}
