// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentIntentRequest _$PaymentIntentRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_PaymentIntentRequest', json, ($checkedConvert) {
  final val = _PaymentIntentRequest(
    orderId: $checkedConvert('order_id', (v) => (v as num?)?.toInt()),
    amount: $checkedConvert('amount', (v) => (v as num?)?.toDouble()),
    currency: $checkedConvert('currency', (v) => v as String),
  );
  return val;
}, fieldKeyMap: const {'orderId': 'order_id'});

Map<String, dynamic> _$PaymentIntentRequestToJson(
  _PaymentIntentRequest instance,
) => <String, dynamic>{
  'order_id': ?instance.orderId,
  'amount': ?instance.amount,
  'currency': instance.currency,
};
