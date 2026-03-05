// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_UserProfile',
  json,
  ($checkedConvert) {
    final val = _UserProfile(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      openid: $checkedConvert('openid', (v) => v as String?),
      nickname: $checkedConvert('nickname', (v) => v as String),
      avatar: $checkedConvert('avatar', (v) => v as String?),
      userCouponCount: $checkedConvert(
        'user_coupon_count',
        (v) => (v as num).toInt(),
      ),
      balance: $checkedConvert('balance', (v) => v as String),
      integral: $checkedConvert('integral', (v) => v as String),
      lotteryCount: $checkedConvert('lottery_count', (v) => (v as num).toInt()),
      email: $checkedConvert('email', (v) => v as String?),
      realName: $checkedConvert('real_name', (v) => v as String?),
      telephone: $checkedConvert('telephone', (v) => v as String?),
      birthday: $checkedConvert('birthday', (v) => v as String?),
      gender: $checkedConvert('gender', (v) => v as String),
      language: $checkedConvert('language', (v) => v as String),
      country: $checkedConvert('country', (v) => v as String?),
      province: $checkedConvert('province', (v) => v as String?),
      city: $checkedConvert('city', (v) => v as String?),
      role: $checkedConvert('role', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'userCouponCount': 'user_coupon_count',
    'lotteryCount': 'lottery_count',
    'realName': 'real_name',
  },
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'openid': ?instance.openid,
      'nickname': instance.nickname,
      'avatar': ?instance.avatar,
      'user_coupon_count': instance.userCouponCount,
      'balance': instance.balance,
      'integral': instance.integral,
      'lottery_count': instance.lotteryCount,
      'email': ?instance.email,
      'real_name': ?instance.realName,
      'telephone': ?instance.telephone,
      'birthday': ?instance.birthday,
      'gender': instance.gender,
      'language': instance.language,
      'country': ?instance.country,
      'province': ?instance.province,
      'city': ?instance.city,
      'role': instance.role,
    };
