import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/payment/entities/payment_model.dart';
import 'package:lunchbox/features/payment/entities/payment_request_model.dart';
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

  /// 产品购物车支付
  @POST('/api/v1/pay/pay')
  Future<ApiResponse<PaymentModel>> pay({
    @Body() required PaymentRequestModel request,
  });
}
