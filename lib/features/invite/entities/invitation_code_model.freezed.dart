// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_code_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvitationCodeModel {

/// 邀请码
 String get code;/// 邀请链接
@JsonKey(name: 'share_url') String? get shareUrl;/// 过期时间
@JsonKey(name: 'expire_at') DateTime? get expireAt;
/// Create a copy of InvitationCodeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvitationCodeModelCopyWith<InvitationCodeModel> get copyWith => _$InvitationCodeModelCopyWithImpl<InvitationCodeModel>(this as InvitationCodeModel, _$identity);

  /// Serializes this InvitationCodeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvitationCodeModel&&(identical(other.code, code) || other.code == code)&&(identical(other.shareUrl, shareUrl) || other.shareUrl == shareUrl)&&(identical(other.expireAt, expireAt) || other.expireAt == expireAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,shareUrl,expireAt);

@override
String toString() {
  return 'InvitationCodeModel(code: $code, shareUrl: $shareUrl, expireAt: $expireAt)';
}


}

/// @nodoc
abstract mixin class $InvitationCodeModelCopyWith<$Res>  {
  factory $InvitationCodeModelCopyWith(InvitationCodeModel value, $Res Function(InvitationCodeModel) _then) = _$InvitationCodeModelCopyWithImpl;
@useResult
$Res call({
 String code,@JsonKey(name: 'share_url') String? shareUrl,@JsonKey(name: 'expire_at') DateTime? expireAt
});




}
/// @nodoc
class _$InvitationCodeModelCopyWithImpl<$Res>
    implements $InvitationCodeModelCopyWith<$Res> {
  _$InvitationCodeModelCopyWithImpl(this._self, this._then);

  final InvitationCodeModel _self;
  final $Res Function(InvitationCodeModel) _then;

/// Create a copy of InvitationCodeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? shareUrl = freezed,Object? expireAt = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,shareUrl: freezed == shareUrl ? _self.shareUrl : shareUrl // ignore: cast_nullable_to_non_nullable
as String?,expireAt: freezed == expireAt ? _self.expireAt : expireAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvitationCodeModel].
extension InvitationCodeModelPatterns on InvitationCodeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvitationCodeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvitationCodeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvitationCodeModel value)  $default,){
final _that = this;
switch (_that) {
case _InvitationCodeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvitationCodeModel value)?  $default,){
final _that = this;
switch (_that) {
case _InvitationCodeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code, @JsonKey(name: 'share_url')  String? shareUrl, @JsonKey(name: 'expire_at')  DateTime? expireAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvitationCodeModel() when $default != null:
return $default(_that.code,_that.shareUrl,_that.expireAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code, @JsonKey(name: 'share_url')  String? shareUrl, @JsonKey(name: 'expire_at')  DateTime? expireAt)  $default,) {final _that = this;
switch (_that) {
case _InvitationCodeModel():
return $default(_that.code,_that.shareUrl,_that.expireAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code, @JsonKey(name: 'share_url')  String? shareUrl, @JsonKey(name: 'expire_at')  DateTime? expireAt)?  $default,) {final _that = this;
switch (_that) {
case _InvitationCodeModel() when $default != null:
return $default(_that.code,_that.shareUrl,_that.expireAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvitationCodeModel implements InvitationCodeModel {
  const _InvitationCodeModel({required this.code, @JsonKey(name: 'share_url') this.shareUrl, @JsonKey(name: 'expire_at') this.expireAt});
  factory _InvitationCodeModel.fromJson(Map<String, dynamic> json) => _$InvitationCodeModelFromJson(json);

/// 邀请码
@override final  String code;
/// 邀请链接
@override@JsonKey(name: 'share_url') final  String? shareUrl;
/// 过期时间
@override@JsonKey(name: 'expire_at') final  DateTime? expireAt;

/// Create a copy of InvitationCodeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvitationCodeModelCopyWith<_InvitationCodeModel> get copyWith => __$InvitationCodeModelCopyWithImpl<_InvitationCodeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvitationCodeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvitationCodeModel&&(identical(other.code, code) || other.code == code)&&(identical(other.shareUrl, shareUrl) || other.shareUrl == shareUrl)&&(identical(other.expireAt, expireAt) || other.expireAt == expireAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,shareUrl,expireAt);

@override
String toString() {
  return 'InvitationCodeModel(code: $code, shareUrl: $shareUrl, expireAt: $expireAt)';
}


}

/// @nodoc
abstract mixin class _$InvitationCodeModelCopyWith<$Res> implements $InvitationCodeModelCopyWith<$Res> {
  factory _$InvitationCodeModelCopyWith(_InvitationCodeModel value, $Res Function(_InvitationCodeModel) _then) = __$InvitationCodeModelCopyWithImpl;
@override @useResult
$Res call({
 String code,@JsonKey(name: 'share_url') String? shareUrl,@JsonKey(name: 'expire_at') DateTime? expireAt
});




}
/// @nodoc
class __$InvitationCodeModelCopyWithImpl<$Res>
    implements _$InvitationCodeModelCopyWith<$Res> {
  __$InvitationCodeModelCopyWithImpl(this._self, this._then);

  final _InvitationCodeModel _self;
  final $Res Function(_InvitationCodeModel) _then;

/// Create a copy of InvitationCodeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? shareUrl = freezed,Object? expireAt = freezed,}) {
  return _then(_InvitationCodeModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,shareUrl: freezed == shareUrl ? _self.shareUrl : shareUrl // ignore: cast_nullable_to_non_nullable
as String?,expireAt: freezed == expireAt ? _self.expireAt : expireAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
