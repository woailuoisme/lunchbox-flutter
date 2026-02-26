// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_gift_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WelcomeGiftItemModel _$WelcomeGiftItemModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_WelcomeGiftItemModel',
  json,
  ($checkedConvert) {
    final val = _WelcomeGiftItemModel(
      id: $checkedConvert('id', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String),
      isClaimed: $checkedConvert('is_claimed', (v) => v as bool? ?? false),
      imageUrl: $checkedConvert('image_url', (v) => v as String?),
      value: $checkedConvert('value', (v) => (v as num?)?.toDouble() ?? 0),
      type: $checkedConvert('type', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'isClaimed': 'is_claimed', 'imageUrl': 'image_url'},
);

Map<String, dynamic> _$WelcomeGiftItemModelToJson(
  _WelcomeGiftItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'is_claimed': instance.isClaimed,
  'image_url': ?instance.imageUrl,
  'value': instance.value,
  'type': ?instance.type,
};
