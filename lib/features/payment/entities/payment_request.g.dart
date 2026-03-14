// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_PaymentRequest',
      json,
      ($checkedConvert) {
        final val = _PaymentRequest(
          amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
          payType: $checkedConvert(
            'pay_type',
            (v) => $enumDecode(_$PaymentPayTypeEnumMap, v),
          ),
          productList: $checkedConvert(
            'product_list',
            (v) => (v as List<dynamic>)
                .map(
                  (e) => PaymentProductItem.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
          userCouponId: $checkedConvert(
            'user_coupon_id',
            (v) => (v as num?)?.toInt(),
          ),
          description: $checkedConvert('description', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'payType': 'pay_type',
        'productList': 'product_list',
        'userCouponId': 'user_coupon_id',
      },
    );

Map<String, dynamic> _$PaymentRequestToJson(_PaymentRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'pay_type': _$PaymentPayTypeEnumMap[instance.payType]!,
      'product_list': instance.productList.map((e) => e.toJson()).toList(),
      'user_coupon_id': ?instance.userCouponId,
      'description': ?instance.description,
    };

const _$PaymentPayTypeEnumMap = {
  PaymentPayType.balance: 'balance',
  PaymentPayType.wechat: 'wechat',
  PaymentPayType.stripe: 'stripe',
  PaymentPayType.alipay: 'alipay',
  PaymentPayType.paypal: 'paypal',
};

_PaymentProductItem _$PaymentProductItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_PaymentProductItem',
      json,
      ($checkedConvert) {
        final val = _PaymentProductItem(
          deviceId: $checkedConvert('device_id', (v) => (v as num).toInt()),
          productId: $checkedConvert('product_id', (v) => (v as num).toInt()),
          quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'deviceId': 'device_id', 'productId': 'product_id'},
    );

Map<String, dynamic> _$PaymentProductItemToJson(_PaymentProductItem instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'product_id': instance.productId,
      'quantity': instance.quantity,
    };
