// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentIntentResponse _$PaymentIntentResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_PaymentIntentResponse',
  json,
  ($checkedConvert) {
    final val = _PaymentIntentResponse(
      clientSecret: $checkedConvert('client_secret', (v) => v as String),
      paymentIntentId: $checkedConvert('payment_intent_id', (v) => v as String),
      customerId: $checkedConvert('customer_id', (v) => v as String),
      amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
      orderId: $checkedConvert('order_id', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'clientSecret': 'client_secret',
    'paymentIntentId': 'payment_intent_id',
    'customerId': 'customer_id',
    'orderId': 'order_id',
  },
);

Map<String, dynamic> _$PaymentIntentResponseToJson(
  _PaymentIntentResponse instance,
) => <String, dynamic>{
  'client_secret': instance.clientSecret,
  'payment_intent_id': instance.paymentIntentId,
  'customer_id': instance.customerId,
  'amount': instance.amount,
  'order_id': ?instance.orderId,
};
