// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserCouponModel _$UserCouponModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_UserCouponModel',
      json,
      ($checkedConvert) {
        final val = _UserCouponModel(
          userCouponId: $checkedConvert(
            'user_coupon_id',
            (v) => (v as num).toInt(),
          ),
          couponId: $checkedConvert('coupon_id', (v) => (v as num).toInt()),
          usedAt: $checkedConvert('used_at', (v) => v as String? ?? null),
          isUsed: $checkedConvert('is_used', (v) => v as bool? ?? false),
          name: $checkedConvert('name', (v) => v as String? ?? ''),
          description: $checkedConvert(
            'description',
            (v) => v as String? ?? null,
          ),
          category: $checkedConvert('category', (v) => v as String? ?? 'shop'),
          type: $checkedConvert('type', (v) => v as String? ?? 'reduction'),
          rule: $checkedConvert(
            'rule',
            (v) => v == null
                ? const CouponRuleModel()
                : CouponRuleModel.fromJson(v as Map<String, dynamic>),
          ),
          startAt: $checkedConvert('start_at', (v) => v as String? ?? null),
          endAt: $checkedConvert('end_at', (v) => v as String? ?? null),
        );
        return val;
      },
      fieldKeyMap: const {
        'userCouponId': 'user_coupon_id',
        'couponId': 'coupon_id',
        'usedAt': 'used_at',
        'isUsed': 'is_used',
        'startAt': 'start_at',
        'endAt': 'end_at',
      },
    );

Map<String, dynamic> _$UserCouponModelToJson(_UserCouponModel instance) =>
    <String, dynamic>{
      'user_coupon_id': instance.userCouponId,
      'coupon_id': instance.couponId,
      'used_at': ?instance.usedAt,
      'is_used': instance.isUsed,
      'name': instance.name,
      'description': ?instance.description,
      'category': instance.category,
      'type': instance.type,
      'rule': instance.rule.toJson(),
      'start_at': ?instance.startAt,
      'end_at': ?instance.endAt,
    };
