// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvitationCodeModel _$InvitationCodeModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_InvitationCodeModel',
      json,
      ($checkedConvert) {
        final val = _InvitationCodeModel(
          code: $checkedConvert('code', (v) => v as String),
          shareUrl: $checkedConvert('share_url', (v) => v as String?),
          expireAt: $checkedConvert(
            'expire_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'shareUrl': 'share_url', 'expireAt': 'expire_at'},
    );

Map<String, dynamic> _$InvitationCodeModelToJson(
  _InvitationCodeModel instance,
) => <String, dynamic>{
  'code': instance.code,
  'share_url': ?instance.shareUrl,
  'expire_at': ?instance.expireAt?.toIso8601String(),
};
