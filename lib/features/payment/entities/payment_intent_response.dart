import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_intent_response.freezed.dart';
part 'payment_intent_response.g.dart';

@freezed
sealed class PaymentIntentResponse with _$PaymentIntentResponse {
  const factory PaymentIntentResponse({
    /// Stripe 支付意向客户端密钥
    @JsonKey(name: 'client_secret') required String clientSecret,

    /// Stripe 支付意向ID
    @JsonKey(name: 'payment_intent_id') required String paymentIntentId,

    /// Stripe 客户ID
    @JsonKey(name: 'customer_id') required String customerId,

    /// 支付金额
    required double amount,

    /// 订单ID
    @JsonKey(name: 'order_id') int? orderId,
  }) = _PaymentIntentResponse;

  factory PaymentIntentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentIntentResponseFromJson(json);
}
