// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_gift_log_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WelcomeGiftLogResponse _$WelcomeGiftLogResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_WelcomeGiftLogResponse',
  json,
  ($checkedConvert) {
    final val = _WelcomeGiftLogResponse(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
      welcomeGiftId: $checkedConvert(
        'welcome_gift_id',
        (v) => (v as num).toInt(),
      ),
      claimedAt: $checkedConvert('claimed_at', (v) => v as String),
      welcomeGift: $checkedConvert(
        'welcomeGift',
        (v) => WelcomeGiftItemResponse.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'welcomeGiftId': 'welcome_gift_id',
    'claimedAt': 'claimed_at',
  },
);

Map<String, dynamic> _$WelcomeGiftLogResponseToJson(
  _WelcomeGiftLogResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'welcome_gift_id': instance.welcomeGiftId,
  'claimed_at': instance.claimedAt,
  'welcomeGift': instance.welcomeGift.toJson(),
};
