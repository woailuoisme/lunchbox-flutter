// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

/// 用户ID
 String get id;/// 用户名（手机号或邮箱）
 String get username;/// 手机号
 String? get phone;/// 邮箱
 String? get email;/// 用户昵称
 String get nickname;/// 用户头像URL
 String? get avatar;/// 用户性别：male、female、unknown
 String get gender;/// 用户生日
 DateTime? get birthday;/// 用户注册时间
 DateTime get registeredAt;/// 用户最后登录时间
 DateTime? get lastLoginAt;/// 用户积分
 int get points;/// 用户会员等级
 String get memberLevel;/// 用户是否已实名认证
 bool get isVerified;/// 保存的设备ID列表（常用设备）
 List<String> get favoriteDevices;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt)&&(identical(other.points, points) || other.points == points)&&(identical(other.memberLevel, memberLevel) || other.memberLevel == memberLevel)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&const DeepCollectionEquality().equals(other.favoriteDevices, favoriteDevices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,phone,email,nickname,avatar,gender,birthday,registeredAt,lastLoginAt,points,memberLevel,isVerified,const DeepCollectionEquality().hash(favoriteDevices));

@override
String toString() {
  return 'UserModel(id: $id, username: $username, phone: $phone, email: $email, nickname: $nickname, avatar: $avatar, gender: $gender, birthday: $birthday, registeredAt: $registeredAt, lastLoginAt: $lastLoginAt, points: $points, memberLevel: $memberLevel, isVerified: $isVerified, favoriteDevices: $favoriteDevices)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id, String username, String? phone, String? email, String nickname, String? avatar, String gender, DateTime? birthday, DateTime registeredAt, DateTime? lastLoginAt, int points, String memberLevel, bool isVerified, List<String> favoriteDevices
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? phone = freezed,Object? email = freezed,Object? nickname = null,Object? avatar = freezed,Object? gender = null,Object? birthday = freezed,Object? registeredAt = null,Object? lastLoginAt = freezed,Object? points = null,Object? memberLevel = null,Object? isVerified = null,Object? favoriteDevices = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime?,registeredAt: null == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,memberLevel: null == memberLevel ? _self.memberLevel : memberLevel // ignore: cast_nullable_to_non_nullable
as String,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,favoriteDevices: null == favoriteDevices ? _self.favoriteDevices : favoriteDevices // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  String? phone,  String? email,  String nickname,  String? avatar,  String gender,  DateTime? birthday,  DateTime registeredAt,  DateTime? lastLoginAt,  int points,  String memberLevel,  bool isVerified,  List<String> favoriteDevices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.username,_that.phone,_that.email,_that.nickname,_that.avatar,_that.gender,_that.birthday,_that.registeredAt,_that.lastLoginAt,_that.points,_that.memberLevel,_that.isVerified,_that.favoriteDevices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  String? phone,  String? email,  String nickname,  String? avatar,  String gender,  DateTime? birthday,  DateTime registeredAt,  DateTime? lastLoginAt,  int points,  String memberLevel,  bool isVerified,  List<String> favoriteDevices)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.username,_that.phone,_that.email,_that.nickname,_that.avatar,_that.gender,_that.birthday,_that.registeredAt,_that.lastLoginAt,_that.points,_that.memberLevel,_that.isVerified,_that.favoriteDevices);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  String? phone,  String? email,  String nickname,  String? avatar,  String gender,  DateTime? birthday,  DateTime registeredAt,  DateTime? lastLoginAt,  int points,  String memberLevel,  bool isVerified,  List<String> favoriteDevices)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.username,_that.phone,_that.email,_that.nickname,_that.avatar,_that.gender,_that.birthday,_that.registeredAt,_that.lastLoginAt,_that.points,_that.memberLevel,_that.isVerified,_that.favoriteDevices);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel extends UserModel {
  const _UserModel({required this.id, required this.username, this.phone, this.email, this.nickname = '', this.avatar, this.gender = 'unknown', this.birthday, required this.registeredAt, this.lastLoginAt, this.points = 0, this.memberLevel = 'normal', this.isVerified = false, final  List<String> favoriteDevices = const []}): _favoriteDevices = favoriteDevices,super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

/// 用户ID
@override final  String id;
/// 用户名（手机号或邮箱）
@override final  String username;
/// 手机号
@override final  String? phone;
/// 邮箱
@override final  String? email;
/// 用户昵称
@override@JsonKey() final  String nickname;
/// 用户头像URL
@override final  String? avatar;
/// 用户性别：male、female、unknown
@override@JsonKey() final  String gender;
/// 用户生日
@override final  DateTime? birthday;
/// 用户注册时间
@override final  DateTime registeredAt;
/// 用户最后登录时间
@override final  DateTime? lastLoginAt;
/// 用户积分
@override@JsonKey() final  int points;
/// 用户会员等级
@override@JsonKey() final  String memberLevel;
/// 用户是否已实名认证
@override@JsonKey() final  bool isVerified;
/// 保存的设备ID列表（常用设备）
 final  List<String> _favoriteDevices;
/// 保存的设备ID列表（常用设备）
@override@JsonKey() List<String> get favoriteDevices {
  if (_favoriteDevices is EqualUnmodifiableListView) return _favoriteDevices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteDevices);
}


/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt)&&(identical(other.points, points) || other.points == points)&&(identical(other.memberLevel, memberLevel) || other.memberLevel == memberLevel)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&const DeepCollectionEquality().equals(other._favoriteDevices, _favoriteDevices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,phone,email,nickname,avatar,gender,birthday,registeredAt,lastLoginAt,points,memberLevel,isVerified,const DeepCollectionEquality().hash(_favoriteDevices));

@override
String toString() {
  return 'UserModel(id: $id, username: $username, phone: $phone, email: $email, nickname: $nickname, avatar: $avatar, gender: $gender, birthday: $birthday, registeredAt: $registeredAt, lastLoginAt: $lastLoginAt, points: $points, memberLevel: $memberLevel, isVerified: $isVerified, favoriteDevices: $favoriteDevices)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, String? phone, String? email, String nickname, String? avatar, String gender, DateTime? birthday, DateTime registeredAt, DateTime? lastLoginAt, int points, String memberLevel, bool isVerified, List<String> favoriteDevices
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? phone = freezed,Object? email = freezed,Object? nickname = null,Object? avatar = freezed,Object? gender = null,Object? birthday = freezed,Object? registeredAt = null,Object? lastLoginAt = freezed,Object? points = null,Object? memberLevel = null,Object? isVerified = null,Object? favoriteDevices = null,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime?,registeredAt: null == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,memberLevel: null == memberLevel ? _self.memberLevel : memberLevel // ignore: cast_nullable_to_non_nullable
as String,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,favoriteDevices: null == favoriteDevices ? _self._favoriteDevices : favoriteDevices // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
