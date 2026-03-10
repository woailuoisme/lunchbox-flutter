// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_gift_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WelcomeGiftRules _$WelcomeGiftRulesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_WelcomeGiftRules', json, ($checkedConvert) {
      final val = _WelcomeGiftRules(
        couponId: $checkedConvert('coupon_id', (v) => (v as num?)?.toInt()),
      );
      return val;
    }, fieldKeyMap: const {'couponId': 'coupon_id'});

Map<String, dynamic> _$WelcomeGiftRulesToJson(_WelcomeGiftRules instance) =>
    <String, dynamic>{'coupon_id': ?instance.couponId};

_WelcomeGiftItemResponse _$WelcomeGiftItemResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_WelcomeGiftItemResponse',
  json,
  ($checkedConvert) {
    final val = _WelcomeGiftItemResponse(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      type: $checkedConvert('type', (v) => v as String),
      typeLabel: $checkedConvert('type_label', (v) => v as String),
      rules: $checkedConvert(
        'rules',
        (v) => WelcomeGiftRules.fromJson(v as Map<String, dynamic>),
      ),
      description: $checkedConvert('description', (v) => v as String),
      order: $checkedConvert('order', (v) => (v as num).toInt()),
      createdAt: $checkedConvert('created_at', (v) => v as String),
      isClaimed: $checkedConvert('is_claimed', (v) => v as bool? ?? false),
    );
    return val;
  },
  fieldKeyMap: const {
    'typeLabel': 'type_label',
    'createdAt': 'created_at',
    'isClaimed': 'is_claimed',
  },
);

Map<String, dynamic> _$WelcomeGiftItemResponseToJson(
  _WelcomeGiftItemResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'type_label': instance.typeLabel,
  'rules': instance.rules.toJson(),
  'description': instance.description,
  'order': instance.order,
  'created_at': instance.createdAt,
  'is_claimed': instance.isClaimed,
};
