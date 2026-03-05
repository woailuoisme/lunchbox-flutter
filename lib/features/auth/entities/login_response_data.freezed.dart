// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginResponseData {

/// 用户ID
 int get id;/// 手机号
 String? get telephone;/// 认证 Token
 String get token;/// 过期时长（字符串形式，如 "20160 minutes"）
@JsonKey(name: 'expires_in') String? get expiresIn;/// 创建时间
@JsonKey(name: 'created_at') String? get createdAt;/// 过期时间
@JsonKey(name: 'expires_at') String? get expiresAt;
/// Create a copy of LoginResponseData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseDataCopyWith<LoginResponseData> get copyWith => _$LoginResponseDataCopyWithImpl<LoginResponseData>(this as LoginResponseData, _$identity);

  /// Serializes this LoginResponseData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponseData&&(identical(other.id, id) || other.id == id)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,telephone,token,expiresIn,createdAt,expiresAt);

@override
String toString() {
  return 'LoginResponseData(id: $id, telephone: $telephone, token: $token, expiresIn: $expiresIn, createdAt: $createdAt, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $LoginResponseDataCopyWith<$Res>  {
  factory $LoginResponseDataCopyWith(LoginResponseData value, $Res Function(LoginResponseData) _then) = _$LoginResponseDataCopyWithImpl;
@useResult
$Res call({
 int id, String? telephone, String token,@JsonKey(name: 'expires_in') String? expiresIn,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'expires_at') String? expiresAt
});




}
/// @nodoc
class _$LoginResponseDataCopyWithImpl<$Res>
    implements $LoginResponseDataCopyWith<$Res> {
  _$LoginResponseDataCopyWithImpl(this._self, this._then);

  final LoginResponseData _self;
  final $Res Function(LoginResponseData) _then;

/// Create a copy of LoginResponseData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? telephone = freezed,Object? token = null,Object? expiresIn = freezed,Object? createdAt = freezed,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginResponseData].
extension LoginResponseDataPatterns on LoginResponseData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponseData value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponseData value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? telephone,  String token, @JsonKey(name: 'expires_in')  String? expiresIn, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'expires_at')  String? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponseData() when $default != null:
return $default(_that.id,_that.telephone,_that.token,_that.expiresIn,_that.createdAt,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? telephone,  String token, @JsonKey(name: 'expires_in')  String? expiresIn, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'expires_at')  String? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _LoginResponseData():
return $default(_that.id,_that.telephone,_that.token,_that.expiresIn,_that.createdAt,_that.expiresAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? telephone,  String token, @JsonKey(name: 'expires_in')  String? expiresIn, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'expires_at')  String? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponseData() when $default != null:
return $default(_that.id,_that.telephone,_that.token,_that.expiresIn,_that.createdAt,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponseData implements LoginResponseData {
  const _LoginResponseData({required this.id, this.telephone, required this.token, @JsonKey(name: 'expires_in') this.expiresIn, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'expires_at') this.expiresAt});
  factory _LoginResponseData.fromJson(Map<String, dynamic> json) => _$LoginResponseDataFromJson(json);

/// 用户ID
@override final  int id;
/// 手机号
@override final  String? telephone;
/// 认证 Token
@override final  String token;
/// 过期时长（字符串形式，如 "20160 minutes"）
@override@JsonKey(name: 'expires_in') final  String? expiresIn;
/// 创建时间
@override@JsonKey(name: 'created_at') final  String? createdAt;
/// 过期时间
@override@JsonKey(name: 'expires_at') final  String? expiresAt;

/// Create a copy of LoginResponseData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponseDataCopyWith<_LoginResponseData> get copyWith => __$LoginResponseDataCopyWithImpl<_LoginResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponseData&&(identical(other.id, id) || other.id == id)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,telephone,token,expiresIn,createdAt,expiresAt);

@override
String toString() {
  return 'LoginResponseData(id: $id, telephone: $telephone, token: $token, expiresIn: $expiresIn, createdAt: $createdAt, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseDataCopyWith<$Res> implements $LoginResponseDataCopyWith<$Res> {
  factory _$LoginResponseDataCopyWith(_LoginResponseData value, $Res Function(_LoginResponseData) _then) = __$LoginResponseDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String? telephone, String token,@JsonKey(name: 'expires_in') String? expiresIn,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'expires_at') String? expiresAt
});




}
/// @nodoc
class __$LoginResponseDataCopyWithImpl<$Res>
    implements _$LoginResponseDataCopyWith<$Res> {
  __$LoginResponseDataCopyWithImpl(this._self, this._then);

  final _LoginResponseData _self;
  final $Res Function(_LoginResponseData) _then;

/// Create a copy of LoginResponseData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? telephone = freezed,Object? token = null,Object? expiresIn = freezed,Object? createdAt = freezed,Object? expiresAt = freezed,}) {
  return _then(_LoginResponseData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
