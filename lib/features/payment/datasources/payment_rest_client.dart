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

  /// 支付订单
  @POST('/api/orders/{id}/pay')
  Future<ApiResponse<dynamic>> payOrder(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// 查询订单支付状态
  @GET('/api/orders/{id}/payment/status')
  Future<ApiResponse<dynamic>> checkPaymentStatus(
    @Path('id') String id,
    @Query('paymentId') String? paymentId,
  );

  /// 创建支付意向
  @POST('/api/orders/{id}/payment/intent')
  Future<ApiResponse<dynamic>> createPaymentIntent(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// 取消支付
  @POST('/api/orders/{id}/payment/cancel')
  Future<ApiResponse<bool>> cancelPayment(@Path('id') String id);
}
