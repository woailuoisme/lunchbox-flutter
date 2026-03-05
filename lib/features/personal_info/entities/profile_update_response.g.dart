// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_update_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileUpdateData _$ProfileUpdateDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ProfileUpdateData', json, ($checkedConvert) {
      final val = _ProfileUpdateData(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        avatar: $checkedConvert('avatar', (v) => v as String?),
        gender: $checkedConvert('gender', (v) => v as String),
        nickname: $checkedConvert('nickname', (v) => v as String),
        telephone: $checkedConvert('telephone', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ProfileUpdateDataToJson(_ProfileUpdateData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': ?instance.avatar,
      'gender': instance.gender,
      'nickname': instance.nickname,
      'telephone': instance.telephone,
    };
