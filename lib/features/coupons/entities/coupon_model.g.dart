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
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String?),
      type: $checkedConvert('type', (v) => v as String),
      rule: $checkedConvert(
        'rule',
        (v) => CouponRuleModel.fromJson(v as Map<String, dynamic>),
      ),
      totalQuantity: $checkedConvert(
        'total_quantity',
        (v) => (v as num).toInt(),
      ),
      usedQuantity: $checkedConvert('used_quantity', (v) => (v as num).toInt()),
      remainingQuantity: $checkedConvert(
        'remaining_quantity',
        (v) => (v as num).toInt(),
      ),
      perUserLimit: $checkedConvert(
        'per_user_limit',
        (v) => (v as num?)?.toInt(),
      ),
      isActivated: $checkedConvert('is_activated', (v) => v as bool? ?? true),
      startAt: $checkedConvert('start_at', (v) => v as String?),
      endAt: $checkedConvert('end_at', (v) => v as String?),
      createdAt: $checkedConvert('created_at', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'totalQuantity': 'total_quantity',
    'usedQuantity': 'used_quantity',
    'remainingQuantity': 'remaining_quantity',
    'perUserLimit': 'per_user_limit',
    'isActivated': 'is_activated',
    'startAt': 'start_at',
    'endAt': 'end_at',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$CouponModelToJson(_CouponModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': ?instance.description,
      'type': instance.type,
      'rule': instance.rule.toJson(),
      'total_quantity': instance.totalQuantity,
      'used_quantity': instance.usedQuantity,
      'remaining_quantity': instance.remainingQuantity,
      'per_user_limit': ?instance.perUserLimit,
      'is_activated': instance.isActivated,
      'start_at': ?instance.startAt,
      'end_at': ?instance.endAt,
      'created_at': instance.createdAt,
    };

_CouponRuleModel _$CouponRuleModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_CouponRuleModel',
      json,
      ($checkedConvert) {
        final val = _CouponRuleModel(
          reduceAmount: $checkedConvert(
            'reduce_amount',
            (v) => (v as num?)?.toDouble(),
          ),
          discountRate: $checkedConvert(
            'discount_rate',
            (v) => (v as num?)?.toDouble(),
          ),
          minSpendAmount: $checkedConvert(
            'min_spend_amount',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'reduceAmount': 'reduce_amount',
        'discountRate': 'discount_rate',
        'minSpendAmount': 'min_spend_amount',
      },
    );

Map<String, dynamic> _$CouponRuleModelToJson(_CouponRuleModel instance) =>
    <String, dynamic>{
      'reduce_amount': ?instance.reduceAmount,
      'discount_rate': ?instance.discountRate,
      'min_spend_amount': ?instance.minSpendAmount,
    };
