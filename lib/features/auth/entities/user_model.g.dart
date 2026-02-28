// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_UserModel',
  json,
  ($checkedConvert) {
    final val = _UserModel(
      id: $checkedConvert('id', (v) => v as String),
      username: $checkedConvert('username', (v) => v as String? ?? ''),
      registeredAt: $checkedConvert('registered_at', (v) => v as String? ?? ''),
      phone: $checkedConvert('phone', (v) => v as String? ?? ''),
      email: $checkedConvert('email', (v) => v as String? ?? ''),
      nickname: $checkedConvert('nickname', (v) => v as String? ?? ''),
      avatar: $checkedConvert('avatar', (v) => v as String? ?? ''),
      gender: $checkedConvert('gender', (v) => v as String? ?? 'unknown'),
      birthday: $checkedConvert('birthday', (v) => v as String? ?? ''),
      lastLoginAt: $checkedConvert('last_login_at', (v) => v as String? ?? ''),
      points: $checkedConvert('points', (v) => (v as num?)?.toInt() ?? 0),
      memberLevel: $checkedConvert(
        'member_level',
        (v) => v as String? ?? 'normal',
      ),
      isVerified: $checkedConvert('is_verified', (v) => v as bool? ?? false),
      favoriteDevices: $checkedConvert(
        'favorite_devices',
        (v) =>
            (v as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'registeredAt': 'registered_at',
    'lastLoginAt': 'last_login_at',
    'memberLevel': 'member_level',
    'isVerified': 'is_verified',
    'favoriteDevices': 'favorite_devices',
  },
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'registered_at': instance.registeredAt,
      'phone': ?instance.phone,
      'email': ?instance.email,
      'nickname': instance.nickname,
      'avatar': ?instance.avatar,
      'gender': instance.gender,
      'birthday': ?instance.birthday,
      'last_login_at': ?instance.lastLoginAt,
      'points': instance.points,
      'member_level': instance.memberLevel,
      'is_verified': instance.isVerified,
      'favorite_devices': instance.favoriteDevices,
    };
