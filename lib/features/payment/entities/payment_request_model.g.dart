// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentRequestModel _$PaymentRequestModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_PaymentRequestModel',
      json,
      ($checkedConvert) {
        final val = _PaymentRequestModel(
          amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
          paymentMethod: $checkedConvert('payment_method', (v) => v as String),
          items: $checkedConvert(
            'items',
            (v) => (v as List<dynamic>)
                .map((e) => e as Map<String, dynamic>)
                .toList(),
          ),
          deviceId: $checkedConvert('device_id', (v) => v as String?),
          couponId: $checkedConvert('coupon_id', (v) => v as String?),
          remark: $checkedConvert('remark', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'paymentMethod': 'payment_method',
        'deviceId': 'device_id',
        'couponId': 'coupon_id',
      },
    );

Map<String, dynamic> _$PaymentRequestModelToJson(
  _PaymentRequestModel instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'payment_method': instance.paymentMethod,
  'items': instance.items,
  'device_id': ?instance.deviceId,
  'coupon_id': ?instance.couponId,
  'remark': ?instance.remark,
};
