// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_gift_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WelcomeGiftLogModel _$WelcomeGiftLogModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_WelcomeGiftLogModel',
      json,
      ($checkedConvert) {
        final val = _WelcomeGiftLogModel(
          id: $checkedConvert('id', (v) => v as String),
          giftId: $checkedConvert('gift_id', (v) => v as String),
          giftTitle: $checkedConvert('gift_title', (v) => v as String),
          claimedAt: $checkedConvert(
            'claimed_at',
            (v) => DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'giftId': 'gift_id',
        'giftTitle': 'gift_title',
        'claimedAt': 'claimed_at',
      },
    );

Map<String, dynamic> _$WelcomeGiftLogModelToJson(
  _WelcomeGiftLogModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'gift_id': instance.giftId,
  'gift_title': instance.giftTitle,
  'claimed_at': instance.claimedAt.toIso8601String(),
};
