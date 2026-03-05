// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

/// 用户ID
 int get id;/// 微信 OpenID
 String? get openid;/// 昵称
 String get nickname;/// 头像
 String? get avatar;/// 优惠券数量
@JsonKey(name: 'user_coupon_count') int get userCouponCount;/// 余额
 String get balance;/// 积分
 String get integral;/// 抽奖次数
@JsonKey(name: 'lottery_count') int get lotteryCount;/// 邮箱
 String? get email;/// 真实姓名
@JsonKey(name: 'real_name') String? get realName;/// 手机号
 String? get telephone;/// 生日
 String? get birthday;/// 性别
 String get gender;/// 语言
 String get language;/// 国家
 String? get country;/// 省份
 String? get province;/// 城市
 String? get city;/// 角色
 String get role;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.openid, openid) || other.openid == openid)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.userCouponCount, userCouponCount) || other.userCouponCount == userCouponCount)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.integral, integral) || other.integral == integral)&&(identical(other.lotteryCount, lotteryCount) || other.lotteryCount == lotteryCount)&&(identical(other.email, email) || other.email == email)&&(identical(other.realName, realName) || other.realName == realName)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.language, language) || other.language == language)&&(identical(other.country, country) || other.country == country)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,openid,nickname,avatar,userCouponCount,balance,integral,lotteryCount,email,realName,telephone,birthday,gender,language,country,province,city,role);

@override
String toString() {
  return 'UserProfile(id: $id, openid: $openid, nickname: $nickname, avatar: $avatar, userCouponCount: $userCouponCount, balance: $balance, integral: $integral, lotteryCount: $lotteryCount, email: $email, realName: $realName, telephone: $telephone, birthday: $birthday, gender: $gender, language: $language, country: $country, province: $province, city: $city, role: $role)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 int id, String? openid, String nickname, String? avatar,@JsonKey(name: 'user_coupon_count') int userCouponCount, String balance, String integral,@JsonKey(name: 'lottery_count') int lotteryCount, String? email,@JsonKey(name: 'real_name') String? realName, String? telephone, String? birthday, String gender, String language, String? country, String? province, String? city, String role
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? openid = freezed,Object? nickname = null,Object? avatar = freezed,Object? userCouponCount = null,Object? balance = null,Object? integral = null,Object? lotteryCount = null,Object? email = freezed,Object? realName = freezed,Object? telephone = freezed,Object? birthday = freezed,Object? gender = null,Object? language = null,Object? country = freezed,Object? province = freezed,Object? city = freezed,Object? role = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,openid: freezed == openid ? _self.openid : openid // ignore: cast_nullable_to_non_nullable
as String?,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,userCouponCount: null == userCouponCount ? _self.userCouponCount : userCouponCount // ignore: cast_nullable_to_non_nullable
as int,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,integral: null == integral ? _self.integral : integral // ignore: cast_nullable_to_non_nullable
as String,lotteryCount: null == lotteryCount ? _self.lotteryCount : lotteryCount // ignore: cast_nullable_to_non_nullable
as int,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,realName: freezed == realName ? _self.realName : realName // ignore: cast_nullable_to_non_nullable
as String?,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? openid,  String nickname,  String? avatar, @JsonKey(name: 'user_coupon_count')  int userCouponCount,  String balance,  String integral, @JsonKey(name: 'lottery_count')  int lotteryCount,  String? email, @JsonKey(name: 'real_name')  String? realName,  String? telephone,  String? birthday,  String gender,  String language,  String? country,  String? province,  String? city,  String role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.openid,_that.nickname,_that.avatar,_that.userCouponCount,_that.balance,_that.integral,_that.lotteryCount,_that.email,_that.realName,_that.telephone,_that.birthday,_that.gender,_that.language,_that.country,_that.province,_that.city,_that.role);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? openid,  String nickname,  String? avatar, @JsonKey(name: 'user_coupon_count')  int userCouponCount,  String balance,  String integral, @JsonKey(name: 'lottery_count')  int lotteryCount,  String? email, @JsonKey(name: 'real_name')  String? realName,  String? telephone,  String? birthday,  String gender,  String language,  String? country,  String? province,  String? city,  String role)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.id,_that.openid,_that.nickname,_that.avatar,_that.userCouponCount,_that.balance,_that.integral,_that.lotteryCount,_that.email,_that.realName,_that.telephone,_that.birthday,_that.gender,_that.language,_that.country,_that.province,_that.city,_that.role);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? openid,  String nickname,  String? avatar, @JsonKey(name: 'user_coupon_count')  int userCouponCount,  String balance,  String integral, @JsonKey(name: 'lottery_count')  int lotteryCount,  String? email, @JsonKey(name: 'real_name')  String? realName,  String? telephone,  String? birthday,  String gender,  String language,  String? country,  String? province,  String? city,  String role)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.openid,_that.nickname,_that.avatar,_that.userCouponCount,_that.balance,_that.integral,_that.lotteryCount,_that.email,_that.realName,_that.telephone,_that.birthday,_that.gender,_that.language,_that.country,_that.province,_that.city,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({required this.id, this.openid, required this.nickname, this.avatar, @JsonKey(name: 'user_coupon_count') required this.userCouponCount, required this.balance, required this.integral, @JsonKey(name: 'lottery_count') required this.lotteryCount, this.email, @JsonKey(name: 'real_name') this.realName, this.telephone, this.birthday, required this.gender, required this.language, this.country, this.province, this.city, required this.role});
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

/// 用户ID
@override final  int id;
/// 微信 OpenID
@override final  String? openid;
/// 昵称
@override final  String nickname;
/// 头像
@override final  String? avatar;
/// 优惠券数量
@override@JsonKey(name: 'user_coupon_count') final  int userCouponCount;
/// 余额
@override final  String balance;
/// 积分
@override final  String integral;
/// 抽奖次数
@override@JsonKey(name: 'lottery_count') final  int lotteryCount;
/// 邮箱
@override final  String? email;
/// 真实姓名
@override@JsonKey(name: 'real_name') final  String? realName;
/// 手机号
@override final  String? telephone;
/// 生日
@override final  String? birthday;
/// 性别
@override final  String gender;
/// 语言
@override final  String language;
/// 国家
@override final  String? country;
/// 省份
@override final  String? province;
/// 城市
@override final  String? city;
/// 角色
@override final  String role;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.openid, openid) || other.openid == openid)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.userCouponCount, userCouponCount) || other.userCouponCount == userCouponCount)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.integral, integral) || other.integral == integral)&&(identical(other.lotteryCount, lotteryCount) || other.lotteryCount == lotteryCount)&&(identical(other.email, email) || other.email == email)&&(identical(other.realName, realName) || other.realName == realName)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.language, language) || other.language == language)&&(identical(other.country, country) || other.country == country)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,openid,nickname,avatar,userCouponCount,balance,integral,lotteryCount,email,realName,telephone,birthday,gender,language,country,province,city,role);

@override
String toString() {
  return 'UserProfile(id: $id, openid: $openid, nickname: $nickname, avatar: $avatar, userCouponCount: $userCouponCount, balance: $balance, integral: $integral, lotteryCount: $lotteryCount, email: $email, realName: $realName, telephone: $telephone, birthday: $birthday, gender: $gender, language: $language, country: $country, province: $province, city: $city, role: $role)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 int id, String? openid, String nickname, String? avatar,@JsonKey(name: 'user_coupon_count') int userCouponCount, String balance, String integral,@JsonKey(name: 'lottery_count') int lotteryCount, String? email,@JsonKey(name: 'real_name') String? realName, String? telephone, String? birthday, String gender, String language, String? country, String? province, String? city, String role
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? openid = freezed,Object? nickname = null,Object? avatar = freezed,Object? userCouponCount = null,Object? balance = null,Object? integral = null,Object? lotteryCount = null,Object? email = freezed,Object? realName = freezed,Object? telephone = freezed,Object? birthday = freezed,Object? gender = null,Object? language = null,Object? country = freezed,Object? province = freezed,Object? city = freezed,Object? role = null,}) {
  return _then(_UserProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,openid: freezed == openid ? _self.openid : openid // ignore: cast_nullable_to_non_nullable
as String?,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,userCouponCount: null == userCouponCount ? _self.userCouponCount : userCouponCount // ignore: cast_nullable_to_non_nullable
as int,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,integral: null == integral ? _self.integral : integral // ignore: cast_nullable_to_non_nullable
as String,lotteryCount: null == lotteryCount ? _self.lotteryCount : lotteryCount // ignore: cast_nullable_to_non_nullable
as int,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,realName: freezed == realName ? _self.realName : realName // ignore: cast_nullable_to_non_nullable
as String?,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
