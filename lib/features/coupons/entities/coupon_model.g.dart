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
      name: $checkedConvert('name', (v) => v as String? ?? ''),
      description: $checkedConvert('description', (v) => v as String? ?? null),
      type: $checkedConvert('type', (v) => v as String? ?? 'reduction'),
      rule: $checkedConvert(
        'rule',
        (v) => v == null
            ? const CouponRuleModel()
            : CouponRuleModel.fromJson(v as Map<String, dynamic>),
      ),
      totalQuantity: $checkedConvert(
        'total_quantity',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      usedQuantity: $checkedConvert(
        'used_quantity',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      remainingQuantity: $checkedConvert(
        'remaining_quantity',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      perUserLimit: $checkedConvert(
        'per_user_limit',
        (v) => (v as num?)?.toInt() ?? null,
      ),
      isActivated: $checkedConvert('is_activated', (v) => v as bool? ?? true),
      startAt: $checkedConvert('start_at', (v) => v as String? ?? null),
      endAt: $checkedConvert('end_at', (v) => v as String? ?? null),
      createdAt: $checkedConvert('created_at', (v) => v as String? ?? ''),
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
            (v) => (v as num?)?.toDouble() ?? null,
          ),
          discountRate: $checkedConvert(
            'discount_rate',
            (v) => (v as num?)?.toDouble() ?? null,
          ),
          maxDiscount: $checkedConvert(
            'max_discount',
            (v) => (v as num?)?.toDouble() ?? null,
          ),
          minAmount: $checkedConvert(
            'min_amount',
            (v) => (v as num?)?.toDouble() ?? null,
          ),
          minSpendAmount: $checkedConvert(
            'min_spend_amount',
            (v) => (v as num?)?.toDouble() ?? null,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'reduceAmount': 'reduce_amount',
        'discountRate': 'discount_rate',
        'maxDiscount': 'max_discount',
        'minAmount': 'min_amount',
        'minSpendAmount': 'min_spend_amount',
      },
    );

Map<String, dynamic> _$CouponRuleModelToJson(_CouponRuleModel instance) =>
    <String, dynamic>{
      'reduce_amount': ?instance.reduceAmount,
      'discount_rate': ?instance.discountRate,
      'max_discount': ?instance.maxDiscount,
      'min_amount': ?instance.minAmount,
      'min_spend_amount': ?instance.minSpendAmount,
    };
