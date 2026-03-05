// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponseData _$LoginResponseDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_LoginResponseData',
      json,
      ($checkedConvert) {
        final val = _LoginResponseData(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          telephone: $checkedConvert('telephone', (v) => v as String?),
          token: $checkedConvert('token', (v) => v as String),
          expiresIn: $checkedConvert('expires_in', (v) => v as String?),
          createdAt: $checkedConvert('created_at', (v) => v as String?),
          expiresAt: $checkedConvert('expires_at', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'expiresIn': 'expires_in',
        'createdAt': 'created_at',
        'expiresAt': 'expires_at',
      },
    );

Map<String, dynamic> _$LoginResponseDataToJson(_LoginResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'telephone': ?instance.telephone,
      'token': instance.token,
      'expires_in': ?instance.expiresIn,
      'created_at': ?instance.createdAt,
      'expires_at': ?instance.expiresAt,
    };
