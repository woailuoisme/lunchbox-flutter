// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderUserModel _$OrderUserModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_OrderUserModel', json, ($checkedConvert) {
      final val = _OrderUserModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        nickname: $checkedConvert('nickname', (v) => v as String),
        telephone: $checkedConvert('telephone', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$OrderUserModelToJson(_OrderUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'telephone': instance.telephone,
    };

_OrderDeviceModel _$OrderDeviceModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_OrderDeviceModel', json, ($checkedConvert) {
      final val = _OrderDeviceModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        sn: $checkedConvert('sn', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$OrderDeviceModelToJson(_OrderDeviceModel instance) =>
    <String, dynamic>{'id': instance.id, 'sn': instance.sn};

_OrderProductModel _$OrderProductModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_OrderProductModel', json, ($checkedConvert) {
      final val = _OrderProductModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        category: $checkedConvert('category', (v) => v as String),
        thumb: $checkedConvert('thumb', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
        salePrice: $checkedConvert('sale_price', (v) => v as String),
        quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
      );
      return val;
    }, fieldKeyMap: const {'salePrice': 'sale_price'});

Map<String, dynamic> _$OrderProductModelToJson(_OrderProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'thumb': instance.thumb,
      'description': instance.description,
      'sale_price': instance.salePrice,
      'quantity': instance.quantity,
    };

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_OrderModel',
  json,
  ($checkedConvert) {
    final val = _OrderModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      user: $checkedConvert(
        'user',
        (v) => OrderUserModel.fromJson(v as Map<String, dynamic>),
      ),
      sn: $checkedConvert('sn', (v) => v as String),
      device: $checkedConvert(
        'device',
        (v) => v == null
            ? null
            : OrderDeviceModel.fromJson(v as Map<String, dynamic>),
      ),
      orderStatusAmount: $checkedConvert('order_status', (v) => v as String),
      nominalAmount: $checkedConvert('nominal_amount', (v) => v as String),
      payAmount: $checkedConvert('pay_amount', (v) => v as String),
      couponAmount: $checkedConvert('coupon_amount', (v) => v as String),
      paySn: $checkedConvert('pay_sn', (v) => v as String?),
      payExternalSn: $checkedConvert('pay_external_sn', (v) => v as String?),
      payType: $checkedConvert(
        'pay_type',
        (v) => $enumDecodeNullable(_$PaymentMethodEnumMap, v),
      ),
      payStatus: $checkedConvert(
        'pay_status',
        (v) => $enumDecodeNullable(_$PayStatusEnumMap, v),
      ),
      userCommentsCount: $checkedConvert(
        'user_comments_count',
        (v) => (v as num).toInt(),
      ),
      userHasComments: $checkedConvert('user_has_comments', (v) => v as bool),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$OrderStatusEnumMap, v),
      ),
      qrCodeImage: $checkedConvert('qr_code_image', (v) => v as String?),
      createdAt: $checkedConvert('created_at', (v) => v as String),
      products: $checkedConvert(
        'products',
        (v) => (v as List<dynamic>)
            .map((e) => OrderProductModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'orderStatusAmount': 'order_status',
    'nominalAmount': 'nominal_amount',
    'payAmount': 'pay_amount',
    'couponAmount': 'coupon_amount',
    'paySn': 'pay_sn',
    'payExternalSn': 'pay_external_sn',
    'payType': 'pay_type',
    'payStatus': 'pay_status',
    'userCommentsCount': 'user_comments_count',
    'userHasComments': 'user_has_comments',
    'qrCodeImage': 'qr_code_image',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user.toJson(),
      'sn': instance.sn,
      'device': ?instance.device?.toJson(),
      'order_status': instance.orderStatusAmount,
      'nominal_amount': instance.nominalAmount,
      'pay_amount': instance.payAmount,
      'coupon_amount': instance.couponAmount,
      'pay_sn': ?instance.paySn,
      'pay_external_sn': ?instance.payExternalSn,
      'pay_type': ?_$PaymentMethodEnumMap[instance.payType],
      'pay_status': ?_$PayStatusEnumMap[instance.payStatus],
      'user_comments_count': instance.userCommentsCount,
      'user_has_comments': instance.userHasComments,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'qr_code_image': ?instance.qrCodeImage,
      'created_at': instance.createdAt,
      'products': instance.products.map((e) => e.toJson()).toList(),
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.wechat: 'wechat',
  PaymentMethod.alipay: 'alipay',
  PaymentMethod.balance: 'balance',
  PaymentMethod.cash: 'cash',
  PaymentMethod.stripe: 'stripe',
};

const _$PayStatusEnumMap = {
  PayStatus.unpaid: 'unpaid',
  PayStatus.paid: 'paid',
  PayStatus.refunded: 'refunded',
};

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.paid: 'paid',
  OrderStatus.used: 'used',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.refund: 'refund',
  OrderStatus.completed: 'completed',
  OrderStatus.failed: 'failed',
};
