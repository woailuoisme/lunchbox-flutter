// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lottery_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LotteryRecordModel {

/// 记录ID
 String get id;/// 获得的奖品
 LotteryPrizeModel get prize;/// 抽奖时间
@JsonKey(name: 'created_at') DateTime get createdAt;/// 状态 (pending: 待发放, completed: 已发放)
 String get status;
/// Create a copy of LotteryRecordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LotteryRecordModelCopyWith<LotteryRecordModel> get copyWith => _$LotteryRecordModelCopyWithImpl<LotteryRecordModel>(this as LotteryRecordModel, _$identity);

  /// Serializes this LotteryRecordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LotteryRecordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.prize, prize) || other.prize == prize)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prize,createdAt,status);

@override
String toString() {
  return 'LotteryRecordModel(id: $id, prize: $prize, createdAt: $createdAt, status: $status)';
}


}

/// @nodoc
abstract mixin class $LotteryRecordModelCopyWith<$Res>  {
  factory $LotteryRecordModelCopyWith(LotteryRecordModel value, $Res Function(LotteryRecordModel) _then) = _$LotteryRecordModelCopyWithImpl;
@useResult
$Res call({
 String id, LotteryPrizeModel prize,@JsonKey(name: 'created_at') DateTime createdAt, String status
});


$LotteryPrizeModelCopyWith<$Res> get prize;

}
/// @nodoc
class _$LotteryRecordModelCopyWithImpl<$Res>
    implements $LotteryRecordModelCopyWith<$Res> {
  _$LotteryRecordModelCopyWithImpl(this._self, this._then);

  final LotteryRecordModel _self;
  final $Res Function(LotteryRecordModel) _then;

/// Create a copy of LotteryRecordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? prize = null,Object? createdAt = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prize: null == prize ? _self.prize : prize // ignore: cast_nullable_to_non_nullable
as LotteryPrizeModel,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of LotteryRecordModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LotteryPrizeModelCopyWith<$Res> get prize {
  
  return $LotteryPrizeModelCopyWith<$Res>(_self.prize, (value) {
    return _then(_self.copyWith(prize: value));
  });
}
}


/// Adds pattern-matching-related methods to [LotteryRecordModel].
extension LotteryRecordModelPatterns on LotteryRecordModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LotteryRecordModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LotteryRecordModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LotteryRecordModel value)  $default,){
final _that = this;
switch (_that) {
case _LotteryRecordModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LotteryRecordModel value)?  $default,){
final _that = this;
switch (_that) {
case _LotteryRecordModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LotteryPrizeModel prize, @JsonKey(name: 'created_at')  DateTime createdAt,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LotteryRecordModel() when $default != null:
return $default(_that.id,_that.prize,_that.createdAt,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LotteryPrizeModel prize, @JsonKey(name: 'created_at')  DateTime createdAt,  String status)  $default,) {final _that = this;
switch (_that) {
case _LotteryRecordModel():
return $default(_that.id,_that.prize,_that.createdAt,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LotteryPrizeModel prize, @JsonKey(name: 'created_at')  DateTime createdAt,  String status)?  $default,) {final _that = this;
switch (_that) {
case _LotteryRecordModel() when $default != null:
return $default(_that.id,_that.prize,_that.createdAt,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LotteryRecordModel implements LotteryRecordModel {
  const _LotteryRecordModel({required this.id, required this.prize, @JsonKey(name: 'created_at') required this.createdAt, this.status = 'completed'});
  factory _LotteryRecordModel.fromJson(Map<String, dynamic> json) => _$LotteryRecordModelFromJson(json);

/// 记录ID
@override final  String id;
/// 获得的奖品
@override final  LotteryPrizeModel prize;
/// 抽奖时间
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
/// 状态 (pending: 待发放, completed: 已发放)
@override@JsonKey() final  String status;

/// Create a copy of LotteryRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LotteryRecordModelCopyWith<_LotteryRecordModel> get copyWith => __$LotteryRecordModelCopyWithImpl<_LotteryRecordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LotteryRecordModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LotteryRecordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.prize, prize) || other.prize == prize)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prize,createdAt,status);

@override
String toString() {
  return 'LotteryRecordModel(id: $id, prize: $prize, createdAt: $createdAt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$LotteryRecordModelCopyWith<$Res> implements $LotteryRecordModelCopyWith<$Res> {
  factory _$LotteryRecordModelCopyWith(_LotteryRecordModel value, $Res Function(_LotteryRecordModel) _then) = __$LotteryRecordModelCopyWithImpl;
@override @useResult
$Res call({
 String id, LotteryPrizeModel prize,@JsonKey(name: 'created_at') DateTime createdAt, String status
});


@override $LotteryPrizeModelCopyWith<$Res> get prize;

}
/// @nodoc
class __$LotteryRecordModelCopyWithImpl<$Res>
    implements _$LotteryRecordModelCopyWith<$Res> {
  __$LotteryRecordModelCopyWithImpl(this._self, this._then);

  final _LotteryRecordModel _self;
  final $Res Function(_LotteryRecordModel) _then;

/// Create a copy of LotteryRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prize = null,Object? createdAt = null,Object? status = null,}) {
  return _then(_LotteryRecordModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prize: null == prize ? _self.prize : prize // ignore: cast_nullable_to_non_nullable
as LotteryPrizeModel,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of LotteryRecordModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LotteryPrizeModelCopyWith<$Res> get prize {
  
  return $LotteryPrizeModelCopyWith<$Res>(_self.prize, (value) {
    return _then(_self.copyWith(prize: value));
  });
}
}

// dart format on
