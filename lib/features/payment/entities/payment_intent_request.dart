import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_intent_request.freezed.dart';
part 'payment_intent_request.g.dart';

@freezed
sealed class PaymentIntentRequest with _$PaymentIntentRequest {
  const factory PaymentIntentRequest({
    /// 订单ID
    @JsonKey(name: 'order_id') int? orderId,

    /// 支付金额（如 10.50），当不提供 order_id 时必填
    double? amount,

    /// 货币代码 (ISO 3字母)
    required String currency,
  }) = _PaymentIntentRequest;

  factory PaymentIntentRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentIntentRequestFromJson(json);
}
