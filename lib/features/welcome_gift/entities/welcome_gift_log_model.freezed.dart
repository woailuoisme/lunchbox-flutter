// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'welcome_gift_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WelcomeGiftLogModel {

 String get id; String get giftId; String get giftTitle; DateTime get claimedAt;
/// Create a copy of WelcomeGiftLogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WelcomeGiftLogModelCopyWith<WelcomeGiftLogModel> get copyWith => _$WelcomeGiftLogModelCopyWithImpl<WelcomeGiftLogModel>(this as WelcomeGiftLogModel, _$identity);

  /// Serializes this WelcomeGiftLogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeGiftLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.giftId, giftId) || other.giftId == giftId)&&(identical(other.giftTitle, giftTitle) || other.giftTitle == giftTitle)&&(identical(other.claimedAt, claimedAt) || other.claimedAt == claimedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,giftId,giftTitle,claimedAt);

@override
String toString() {
  return 'WelcomeGiftLogModel(id: $id, giftId: $giftId, giftTitle: $giftTitle, claimedAt: $claimedAt)';
}


}

/// @nodoc
abstract mixin class $WelcomeGiftLogModelCopyWith<$Res>  {
  factory $WelcomeGiftLogModelCopyWith(WelcomeGiftLogModel value, $Res Function(WelcomeGiftLogModel) _then) = _$WelcomeGiftLogModelCopyWithImpl;
@useResult
$Res call({
 String id, String giftId, String giftTitle, DateTime claimedAt
});




}
/// @nodoc
class _$WelcomeGiftLogModelCopyWithImpl<$Res>
    implements $WelcomeGiftLogModelCopyWith<$Res> {
  _$WelcomeGiftLogModelCopyWithImpl(this._self, this._then);

  final WelcomeGiftLogModel _self;
  final $Res Function(WelcomeGiftLogModel) _then;

/// Create a copy of WelcomeGiftLogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? giftId = null,Object? giftTitle = null,Object? claimedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,giftId: null == giftId ? _self.giftId : giftId // ignore: cast_nullable_to_non_nullable
as String,giftTitle: null == giftTitle ? _self.giftTitle : giftTitle // ignore: cast_nullable_to_non_nullable
as String,claimedAt: null == claimedAt ? _self.claimedAt : claimedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [WelcomeGiftLogModel].
extension WelcomeGiftLogModelPatterns on WelcomeGiftLogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WelcomeGiftLogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WelcomeGiftLogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WelcomeGiftLogModel value)  $default,){
final _that = this;
switch (_that) {
case _WelcomeGiftLogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WelcomeGiftLogModel value)?  $default,){
final _that = this;
switch (_that) {
case _WelcomeGiftLogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String giftId,  String giftTitle,  DateTime claimedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WelcomeGiftLogModel() when $default != null:
return $default(_that.id,_that.giftId,_that.giftTitle,_that.claimedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String giftId,  String giftTitle,  DateTime claimedAt)  $default,) {final _that = this;
switch (_that) {
case _WelcomeGiftLogModel():
return $default(_that.id,_that.giftId,_that.giftTitle,_that.claimedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String giftId,  String giftTitle,  DateTime claimedAt)?  $default,) {final _that = this;
switch (_that) {
case _WelcomeGiftLogModel() when $default != null:
return $default(_that.id,_that.giftId,_that.giftTitle,_that.claimedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WelcomeGiftLogModel implements WelcomeGiftLogModel {
  const _WelcomeGiftLogModel({required this.id, required this.giftId, required this.giftTitle, required this.claimedAt});
  factory _WelcomeGiftLogModel.fromJson(Map<String, dynamic> json) => _$WelcomeGiftLogModelFromJson(json);

@override final  String id;
@override final  String giftId;
@override final  String giftTitle;
@override final  DateTime claimedAt;

/// Create a copy of WelcomeGiftLogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WelcomeGiftLogModelCopyWith<_WelcomeGiftLogModel> get copyWith => __$WelcomeGiftLogModelCopyWithImpl<_WelcomeGiftLogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WelcomeGiftLogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WelcomeGiftLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.giftId, giftId) || other.giftId == giftId)&&(identical(other.giftTitle, giftTitle) || other.giftTitle == giftTitle)&&(identical(other.claimedAt, claimedAt) || other.claimedAt == claimedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,giftId,giftTitle,claimedAt);

@override
String toString() {
  return 'WelcomeGiftLogModel(id: $id, giftId: $giftId, giftTitle: $giftTitle, claimedAt: $claimedAt)';
}


}

/// @nodoc
abstract mixin class _$WelcomeGiftLogModelCopyWith<$Res> implements $WelcomeGiftLogModelCopyWith<$Res> {
  factory _$WelcomeGiftLogModelCopyWith(_WelcomeGiftLogModel value, $Res Function(_WelcomeGiftLogModel) _then) = __$WelcomeGiftLogModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String giftId, String giftTitle, DateTime claimedAt
});




}
/// @nodoc
class __$WelcomeGiftLogModelCopyWithImpl<$Res>
    implements _$WelcomeGiftLogModelCopyWith<$Res> {
  __$WelcomeGiftLogModelCopyWithImpl(this._self, this._then);

  final _WelcomeGiftLogModel _self;
  final $Res Function(_WelcomeGiftLogModel) _then;

/// Create a copy of WelcomeGiftLogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? giftId = null,Object? giftTitle = null,Object? claimedAt = null,}) {
  return _then(_WelcomeGiftLogModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,giftId: null == giftId ? _self.giftId : giftId // ignore: cast_nullable_to_non_nullable
as String,giftTitle: null == giftTitle ? _self.giftTitle : giftTitle // ignore: cast_nullable_to_non_nullable
as String,claimedAt: null == claimedAt ? _self.claimedAt : claimedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
