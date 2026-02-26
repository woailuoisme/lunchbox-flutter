// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_verify_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvitationVerifyModel {

/// 邀请码是否有效
@JsonKey(name: 'is_valid') bool get isValid;/// 邀请人昵称
@JsonKey(name: 'inviter_name') String? get inviterName;/// 邀请人头像
@JsonKey(name: 'inviter_avatar') String? get inviterAvatar;
/// Create a copy of InvitationVerifyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvitationVerifyModelCopyWith<InvitationVerifyModel> get copyWith => _$InvitationVerifyModelCopyWithImpl<InvitationVerifyModel>(this as InvitationVerifyModel, _$identity);

  /// Serializes this InvitationVerifyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvitationVerifyModel&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.inviterName, inviterName) || other.inviterName == inviterName)&&(identical(other.inviterAvatar, inviterAvatar) || other.inviterAvatar == inviterAvatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isValid,inviterName,inviterAvatar);

@override
String toString() {
  return 'InvitationVerifyModel(isValid: $isValid, inviterName: $inviterName, inviterAvatar: $inviterAvatar)';
}


}

/// @nodoc
abstract mixin class $InvitationVerifyModelCopyWith<$Res>  {
  factory $InvitationVerifyModelCopyWith(InvitationVerifyModel value, $Res Function(InvitationVerifyModel) _then) = _$InvitationVerifyModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_valid') bool isValid,@JsonKey(name: 'inviter_name') String? inviterName,@JsonKey(name: 'inviter_avatar') String? inviterAvatar
});




}
/// @nodoc
class _$InvitationVerifyModelCopyWithImpl<$Res>
    implements $InvitationVerifyModelCopyWith<$Res> {
  _$InvitationVerifyModelCopyWithImpl(this._self, this._then);

  final InvitationVerifyModel _self;
  final $Res Function(InvitationVerifyModel) _then;

/// Create a copy of InvitationVerifyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isValid = null,Object? inviterName = freezed,Object? inviterAvatar = freezed,}) {
  return _then(_self.copyWith(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,inviterName: freezed == inviterName ? _self.inviterName : inviterName // ignore: cast_nullable_to_non_nullable
as String?,inviterAvatar: freezed == inviterAvatar ? _self.inviterAvatar : inviterAvatar // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvitationVerifyModel].
extension InvitationVerifyModelPatterns on InvitationVerifyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvitationVerifyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvitationVerifyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvitationVerifyModel value)  $default,){
final _that = this;
switch (_that) {
case _InvitationVerifyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvitationVerifyModel value)?  $default,){
final _that = this;
switch (_that) {
case _InvitationVerifyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_valid')  bool isValid, @JsonKey(name: 'inviter_name')  String? inviterName, @JsonKey(name: 'inviter_avatar')  String? inviterAvatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvitationVerifyModel() when $default != null:
return $default(_that.isValid,_that.inviterName,_that.inviterAvatar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_valid')  bool isValid, @JsonKey(name: 'inviter_name')  String? inviterName, @JsonKey(name: 'inviter_avatar')  String? inviterAvatar)  $default,) {final _that = this;
switch (_that) {
case _InvitationVerifyModel():
return $default(_that.isValid,_that.inviterName,_that.inviterAvatar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_valid')  bool isValid, @JsonKey(name: 'inviter_name')  String? inviterName, @JsonKey(name: 'inviter_avatar')  String? inviterAvatar)?  $default,) {final _that = this;
switch (_that) {
case _InvitationVerifyModel() when $default != null:
return $default(_that.isValid,_that.inviterName,_that.inviterAvatar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvitationVerifyModel implements InvitationVerifyModel {
  const _InvitationVerifyModel({@JsonKey(name: 'is_valid') this.isValid = false, @JsonKey(name: 'inviter_name') this.inviterName, @JsonKey(name: 'inviter_avatar') this.inviterAvatar});
  factory _InvitationVerifyModel.fromJson(Map<String, dynamic> json) => _$InvitationVerifyModelFromJson(json);

/// 邀请码是否有效
@override@JsonKey(name: 'is_valid') final  bool isValid;
/// 邀请人昵称
@override@JsonKey(name: 'inviter_name') final  String? inviterName;
/// 邀请人头像
@override@JsonKey(name: 'inviter_avatar') final  String? inviterAvatar;

/// Create a copy of InvitationVerifyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvitationVerifyModelCopyWith<_InvitationVerifyModel> get copyWith => __$InvitationVerifyModelCopyWithImpl<_InvitationVerifyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvitationVerifyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvitationVerifyModel&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.inviterName, inviterName) || other.inviterName == inviterName)&&(identical(other.inviterAvatar, inviterAvatar) || other.inviterAvatar == inviterAvatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isValid,inviterName,inviterAvatar);

@override
String toString() {
  return 'InvitationVerifyModel(isValid: $isValid, inviterName: $inviterName, inviterAvatar: $inviterAvatar)';
}


}

/// @nodoc
abstract mixin class _$InvitationVerifyModelCopyWith<$Res> implements $InvitationVerifyModelCopyWith<$Res> {
  factory _$InvitationVerifyModelCopyWith(_InvitationVerifyModel value, $Res Function(_InvitationVerifyModel) _then) = __$InvitationVerifyModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_valid') bool isValid,@JsonKey(name: 'inviter_name') String? inviterName,@JsonKey(name: 'inviter_avatar') String? inviterAvatar
});




}
/// @nodoc
class __$InvitationVerifyModelCopyWithImpl<$Res>
    implements _$InvitationVerifyModelCopyWith<$Res> {
  __$InvitationVerifyModelCopyWithImpl(this._self, this._then);

  final _InvitationVerifyModel _self;
  final $Res Function(_InvitationVerifyModel) _then;

/// Create a copy of InvitationVerifyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isValid = null,Object? inviterName = freezed,Object? inviterAvatar = freezed,}) {
  return _then(_InvitationVerifyModel(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,inviterName: freezed == inviterName ? _self.inviterName : inviterName // ignore: cast_nullable_to_non_nullable
as String?,inviterAvatar: freezed == inviterAvatar ? _self.inviterAvatar : inviterAvatar // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
