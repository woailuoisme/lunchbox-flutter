// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_update_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileUpdateData {

 int get id; String? get avatar; String get gender; String get nickname; String get telephone;
/// Create a copy of ProfileUpdateData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileUpdateDataCopyWith<ProfileUpdateData> get copyWith => _$ProfileUpdateDataCopyWithImpl<ProfileUpdateData>(this as ProfileUpdateData, _$identity);

  /// Serializes this ProfileUpdateData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileUpdateData&&(identical(other.id, id) || other.id == id)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.telephone, telephone) || other.telephone == telephone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,avatar,gender,nickname,telephone);

@override
String toString() {
  return 'ProfileUpdateData(id: $id, avatar: $avatar, gender: $gender, nickname: $nickname, telephone: $telephone)';
}


}

/// @nodoc
abstract mixin class $ProfileUpdateDataCopyWith<$Res>  {
  factory $ProfileUpdateDataCopyWith(ProfileUpdateData value, $Res Function(ProfileUpdateData) _then) = _$ProfileUpdateDataCopyWithImpl;
@useResult
$Res call({
 int id, String? avatar, String gender, String nickname, String telephone
});




}
/// @nodoc
class _$ProfileUpdateDataCopyWithImpl<$Res>
    implements $ProfileUpdateDataCopyWith<$Res> {
  _$ProfileUpdateDataCopyWithImpl(this._self, this._then);

  final ProfileUpdateData _self;
  final $Res Function(ProfileUpdateData) _then;

/// Create a copy of ProfileUpdateData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? avatar = freezed,Object? gender = null,Object? nickname = null,Object? telephone = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,telephone: null == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileUpdateData].
extension ProfileUpdateDataPatterns on ProfileUpdateData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileUpdateData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileUpdateData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileUpdateData value)  $default,){
final _that = this;
switch (_that) {
case _ProfileUpdateData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileUpdateData value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileUpdateData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? avatar,  String gender,  String nickname,  String telephone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileUpdateData() when $default != null:
return $default(_that.id,_that.avatar,_that.gender,_that.nickname,_that.telephone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? avatar,  String gender,  String nickname,  String telephone)  $default,) {final _that = this;
switch (_that) {
case _ProfileUpdateData():
return $default(_that.id,_that.avatar,_that.gender,_that.nickname,_that.telephone);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? avatar,  String gender,  String nickname,  String telephone)?  $default,) {final _that = this;
switch (_that) {
case _ProfileUpdateData() when $default != null:
return $default(_that.id,_that.avatar,_that.gender,_that.nickname,_that.telephone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileUpdateData implements ProfileUpdateData {
  const _ProfileUpdateData({required this.id, this.avatar, required this.gender, required this.nickname, required this.telephone});
  factory _ProfileUpdateData.fromJson(Map<String, dynamic> json) => _$ProfileUpdateDataFromJson(json);

@override final  int id;
@override final  String? avatar;
@override final  String gender;
@override final  String nickname;
@override final  String telephone;

/// Create a copy of ProfileUpdateData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileUpdateDataCopyWith<_ProfileUpdateData> get copyWith => __$ProfileUpdateDataCopyWithImpl<_ProfileUpdateData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileUpdateDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileUpdateData&&(identical(other.id, id) || other.id == id)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.telephone, telephone) || other.telephone == telephone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,avatar,gender,nickname,telephone);

@override
String toString() {
  return 'ProfileUpdateData(id: $id, avatar: $avatar, gender: $gender, nickname: $nickname, telephone: $telephone)';
}


}

/// @nodoc
abstract mixin class _$ProfileUpdateDataCopyWith<$Res> implements $ProfileUpdateDataCopyWith<$Res> {
  factory _$ProfileUpdateDataCopyWith(_ProfileUpdateData value, $Res Function(_ProfileUpdateData) _then) = __$ProfileUpdateDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String? avatar, String gender, String nickname, String telephone
});




}
/// @nodoc
class __$ProfileUpdateDataCopyWithImpl<$Res>
    implements _$ProfileUpdateDataCopyWith<$Res> {
  __$ProfileUpdateDataCopyWithImpl(this._self, this._then);

  final _ProfileUpdateData _self;
  final $Res Function(_ProfileUpdateData) _then;

/// Create a copy of ProfileUpdateData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? avatar = freezed,Object? gender = null,Object? nickname = null,Object? telephone = null,}) {
  return _then(_ProfileUpdateData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,telephone: null == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
