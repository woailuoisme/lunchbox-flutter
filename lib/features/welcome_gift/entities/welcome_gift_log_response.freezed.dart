// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'welcome_gift_log_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WelcomeGiftLogResponse {

 int get id;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'welcome_gift_id') int get welcomeGiftId;@JsonKey(name: 'claimed_at') String get claimedAt;@JsonKey(name: 'welcomeGift') WelcomeGiftItemResponse get welcomeGift;
/// Create a copy of WelcomeGiftLogResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WelcomeGiftLogResponseCopyWith<WelcomeGiftLogResponse> get copyWith => _$WelcomeGiftLogResponseCopyWithImpl<WelcomeGiftLogResponse>(this as WelcomeGiftLogResponse, _$identity);

  /// Serializes this WelcomeGiftLogResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeGiftLogResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.welcomeGiftId, welcomeGiftId) || other.welcomeGiftId == welcomeGiftId)&&(identical(other.claimedAt, claimedAt) || other.claimedAt == claimedAt)&&(identical(other.welcomeGift, welcomeGift) || other.welcomeGift == welcomeGift));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,welcomeGiftId,claimedAt,welcomeGift);

@override
String toString() {
  return 'WelcomeGiftLogResponse(id: $id, userId: $userId, welcomeGiftId: $welcomeGiftId, claimedAt: $claimedAt, welcomeGift: $welcomeGift)';
}


}

/// @nodoc
abstract mixin class $WelcomeGiftLogResponseCopyWith<$Res>  {
  factory $WelcomeGiftLogResponseCopyWith(WelcomeGiftLogResponse value, $Res Function(WelcomeGiftLogResponse) _then) = _$WelcomeGiftLogResponseCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'welcome_gift_id') int welcomeGiftId,@JsonKey(name: 'claimed_at') String claimedAt,@JsonKey(name: 'welcomeGift') WelcomeGiftItemResponse welcomeGift
});


$WelcomeGiftItemResponseCopyWith<$Res> get welcomeGift;

}
/// @nodoc
class _$WelcomeGiftLogResponseCopyWithImpl<$Res>
    implements $WelcomeGiftLogResponseCopyWith<$Res> {
  _$WelcomeGiftLogResponseCopyWithImpl(this._self, this._then);

  final WelcomeGiftLogResponse _self;
  final $Res Function(WelcomeGiftLogResponse) _then;

/// Create a copy of WelcomeGiftLogResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? welcomeGiftId = null,Object? claimedAt = null,Object? welcomeGift = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,welcomeGiftId: null == welcomeGiftId ? _self.welcomeGiftId : welcomeGiftId // ignore: cast_nullable_to_non_nullable
as int,claimedAt: null == claimedAt ? _self.claimedAt : claimedAt // ignore: cast_nullable_to_non_nullable
as String,welcomeGift: null == welcomeGift ? _self.welcomeGift : welcomeGift // ignore: cast_nullable_to_non_nullable
as WelcomeGiftItemResponse,
  ));
}
/// Create a copy of WelcomeGiftLogResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WelcomeGiftItemResponseCopyWith<$Res> get welcomeGift {
  
  return $WelcomeGiftItemResponseCopyWith<$Res>(_self.welcomeGift, (value) {
    return _then(_self.copyWith(welcomeGift: value));
  });
}
}


/// Adds pattern-matching-related methods to [WelcomeGiftLogResponse].
extension WelcomeGiftLogResponsePatterns on WelcomeGiftLogResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WelcomeGiftLogResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WelcomeGiftLogResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WelcomeGiftLogResponse value)  $default,){
final _that = this;
switch (_that) {
case _WelcomeGiftLogResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WelcomeGiftLogResponse value)?  $default,){
final _that = this;
switch (_that) {
case _WelcomeGiftLogResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'welcome_gift_id')  int welcomeGiftId, @JsonKey(name: 'claimed_at')  String claimedAt, @JsonKey(name: 'welcomeGift')  WelcomeGiftItemResponse welcomeGift)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WelcomeGiftLogResponse() when $default != null:
return $default(_that.id,_that.userId,_that.welcomeGiftId,_that.claimedAt,_that.welcomeGift);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'welcome_gift_id')  int welcomeGiftId, @JsonKey(name: 'claimed_at')  String claimedAt, @JsonKey(name: 'welcomeGift')  WelcomeGiftItemResponse welcomeGift)  $default,) {final _that = this;
switch (_that) {
case _WelcomeGiftLogResponse():
return $default(_that.id,_that.userId,_that.welcomeGiftId,_that.claimedAt,_that.welcomeGift);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'welcome_gift_id')  int welcomeGiftId, @JsonKey(name: 'claimed_at')  String claimedAt, @JsonKey(name: 'welcomeGift')  WelcomeGiftItemResponse welcomeGift)?  $default,) {final _that = this;
switch (_that) {
case _WelcomeGiftLogResponse() when $default != null:
return $default(_that.id,_that.userId,_that.welcomeGiftId,_that.claimedAt,_that.welcomeGift);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WelcomeGiftLogResponse implements WelcomeGiftLogResponse {
  const _WelcomeGiftLogResponse({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'welcome_gift_id') required this.welcomeGiftId, @JsonKey(name: 'claimed_at') required this.claimedAt, @JsonKey(name: 'welcomeGift') required this.welcomeGift});
  factory _WelcomeGiftLogResponse.fromJson(Map<String, dynamic> json) => _$WelcomeGiftLogResponseFromJson(json);

@override final  int id;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'welcome_gift_id') final  int welcomeGiftId;
@override@JsonKey(name: 'claimed_at') final  String claimedAt;
@override@JsonKey(name: 'welcomeGift') final  WelcomeGiftItemResponse welcomeGift;

/// Create a copy of WelcomeGiftLogResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WelcomeGiftLogResponseCopyWith<_WelcomeGiftLogResponse> get copyWith => __$WelcomeGiftLogResponseCopyWithImpl<_WelcomeGiftLogResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WelcomeGiftLogResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WelcomeGiftLogResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.welcomeGiftId, welcomeGiftId) || other.welcomeGiftId == welcomeGiftId)&&(identical(other.claimedAt, claimedAt) || other.claimedAt == claimedAt)&&(identical(other.welcomeGift, welcomeGift) || other.welcomeGift == welcomeGift));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,welcomeGiftId,claimedAt,welcomeGift);

@override
String toString() {
  return 'WelcomeGiftLogResponse(id: $id, userId: $userId, welcomeGiftId: $welcomeGiftId, claimedAt: $claimedAt, welcomeGift: $welcomeGift)';
}


}

/// @nodoc
abstract mixin class _$WelcomeGiftLogResponseCopyWith<$Res> implements $WelcomeGiftLogResponseCopyWith<$Res> {
  factory _$WelcomeGiftLogResponseCopyWith(_WelcomeGiftLogResponse value, $Res Function(_WelcomeGiftLogResponse) _then) = __$WelcomeGiftLogResponseCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'welcome_gift_id') int welcomeGiftId,@JsonKey(name: 'claimed_at') String claimedAt,@JsonKey(name: 'welcomeGift') WelcomeGiftItemResponse welcomeGift
});


@override $WelcomeGiftItemResponseCopyWith<$Res> get welcomeGift;

}
/// @nodoc
class __$WelcomeGiftLogResponseCopyWithImpl<$Res>
    implements _$WelcomeGiftLogResponseCopyWith<$Res> {
  __$WelcomeGiftLogResponseCopyWithImpl(this._self, this._then);

  final _WelcomeGiftLogResponse _self;
  final $Res Function(_WelcomeGiftLogResponse) _then;

/// Create a copy of WelcomeGiftLogResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? welcomeGiftId = null,Object? claimedAt = null,Object? welcomeGift = null,}) {
  return _then(_WelcomeGiftLogResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,welcomeGiftId: null == welcomeGiftId ? _self.welcomeGiftId : welcomeGiftId // ignore: cast_nullable_to_non_nullable
as int,claimedAt: null == claimedAt ? _self.claimedAt : claimedAt // ignore: cast_nullable_to_non_nullable
as String,welcomeGift: null == welcomeGift ? _self.welcomeGift : welcomeGift // ignore: cast_nullable_to_non_nullable
as WelcomeGiftItemResponse,
  ));
}

/// Create a copy of WelcomeGiftLogResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WelcomeGiftItemResponseCopyWith<$Res> get welcomeGift {
  
  return $WelcomeGiftItemResponseCopyWith<$Res>(_self.welcomeGift, (value) {
    return _then(_self.copyWith(welcomeGift: value));
  });
}
}

// dart format on
