// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_OrderModel',
  json,
  ($checkedConvert) {
    final val = _OrderModel(
      id: $checkedConvert('id', (v) => v as String),
      userId: $checkedConvert('user_id', (v) => v as String),
      deviceId: $checkedConvert('device_id', (v) => v as String),
      items: $checkedConvert(
        'items',
        (v) => (v as List<dynamic>)
            .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      totalAmount: $checkedConvert(
        'total_amount',
        (v) => (v as num).toDouble(),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      device: $checkedConvert(
        'device',
        (v) =>
            v == null ? null : DeviceModel.fromJson(v as Map<String, dynamic>),
      ),
      paidAmount: $checkedConvert(
        'paid_amount',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
      status: $checkedConvert(
        'status',
        (v) =>
            $enumDecodeNullable(_$OrderStatusEnumMap, v) ?? OrderStatus.pending,
      ),
      paymentMethod: $checkedConvert(
        'payment_method',
        (v) => $enumDecodeNullable(_$PaymentMethodEnumMap, v),
      ),
      paidAt: $checkedConvert(
        'paid_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      completedAt: $checkedConvert(
        'completed_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      cancelledAt: $checkedConvert(
        'cancelled_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      pickupCode: $checkedConvert('pickup_code', (v) => v as String?),
      remark: $checkedConvert('remark', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'deviceId': 'device_id',
    'totalAmount': 'total_amount',
    'createdAt': 'created_at',
    'paidAmount': 'paid_amount',
    'paymentMethod': 'payment_method',
    'paidAt': 'paid_at',
    'completedAt': 'completed_at',
    'cancelledAt': 'cancelled_at',
    'pickupCode': 'pickup_code',
  },
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'device_id': instance.deviceId,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'total_amount': instance.totalAmount,
      'created_at': instance.createdAt.toIso8601String(),
      'device': ?instance.device?.toJson(),
      'paid_amount': instance.paidAmount,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'payment_method': ?_$PaymentMethodEnumMap[instance.paymentMethod],
      'paid_at': ?instance.paidAt?.toIso8601String(),
      'completed_at': ?instance.completedAt?.toIso8601String(),
      'cancelled_at': ?instance.cancelledAt?.toIso8601String(),
      'pickup_code': ?instance.pickupCode,
      'remark': ?instance.remark,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.paid: 'paid',
  OrderStatus.completed: 'completed',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.refunded: 'refunded',
  OrderStatus.failed: 'failed',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.wechatPay: 'wechatPay',
  PaymentMethod.alipay: 'alipay',
  PaymentMethod.cash: 'cash',
};
