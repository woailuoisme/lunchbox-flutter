// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_verify_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvitationVerifyModel _$InvitationVerifyModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_InvitationVerifyModel',
  json,
  ($checkedConvert) {
    final val = _InvitationVerifyModel(
      isValid: $checkedConvert('is_valid', (v) => v as bool? ?? false),
      inviterName: $checkedConvert('inviter_name', (v) => v as String?),
      inviterAvatar: $checkedConvert('inviter_avatar', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'isValid': 'is_valid',
    'inviterName': 'inviter_name',
    'inviterAvatar': 'inviter_avatar',
  },
);

Map<String, dynamic> _$InvitationVerifyModelToJson(
  _InvitationVerifyModel instance,
) => <String, dynamic>{
  'is_valid': instance.isValid,
  'inviter_name': ?instance.inviterName,
  'inviter_avatar': ?instance.inviterAvatar,
};
