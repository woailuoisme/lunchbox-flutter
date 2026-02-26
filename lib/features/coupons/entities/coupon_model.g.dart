// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CouponModel _$CouponModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_CouponModel',
  json,
  ($checkedConvert) {
    final val = _CouponModel(
      id: $checkedConvert('id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String),
      amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
      minSpend: $checkedConvert(
        'min_spend',
        (v) => (v as num?)?.toDouble() ?? 0,
      ),
      type: $checkedConvert('type', (v) => v as String? ?? 'cash'),
      startTime: $checkedConvert(
        'start_time',
        (v) => DateTime.parse(v as String),
      ),
      endTime: $checkedConvert('end_time', (v) => DateTime.parse(v as String)),
      isReceived: $checkedConvert('is_received', (v) => v as bool? ?? false),
      isUsed: $checkedConvert('is_used', (v) => v as bool? ?? false),
    );
    return val;
  },
  fieldKeyMap: const {
    'minSpend': 'min_spend',
    'startTime': 'start_time',
    'endTime': 'end_time',
    'isReceived': 'is_received',
    'isUsed': 'is_used',
  },
);

Map<String, dynamic> _$CouponModelToJson(_CouponModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'amount': instance.amount,
      'min_spend': instance.minSpend,
      'type': instance.type,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'is_received': instance.isReceived,
      'is_used': instance.isUsed,
    };
