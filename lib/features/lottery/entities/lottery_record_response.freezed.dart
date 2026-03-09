// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lottery_record_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LotteryRecordResponse {

/// 记录ID
 int get id;/// 用户ID
@JsonKey(name: 'user_id') int get userId;/// 奖品ID
@JsonKey(name: 'prize_id') int? get prizeId;/// 奖品类型
@JsonKey(name: 'prize_type') String get prizeType;/// 奖品价值
@JsonKey(name: 'prize_value') int get prizeValue;/// 抽奖结果 (win, lose)
 String get result;/// 获得的奖品详情
 LotteryPrizeResponse? get prize;/// 抽奖时间
@JsonKey(name: 'created_at') DateTime? get createdAt;/// 更新时间
@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of LotteryRecordResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LotteryRecordResponseCopyWith<LotteryRecordResponse> get copyWith => _$LotteryRecordResponseCopyWithImpl<LotteryRecordResponse>(this as LotteryRecordResponse, _$identity);

  /// Serializes this LotteryRecordResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LotteryRecordResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.prizeId, prizeId) || other.prizeId == prizeId)&&(identical(other.prizeType, prizeType) || other.prizeType == prizeType)&&(identical(other.prizeValue, prizeValue) || other.prizeValue == prizeValue)&&(identical(other.result, result) || other.result == result)&&(identical(other.prize, prize) || other.prize == prize)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,prizeId,prizeType,prizeValue,result,prize,createdAt,updatedAt);

@override
String toString() {
  return 'LotteryRecordResponse(id: $id, userId: $userId, prizeId: $prizeId, prizeType: $prizeType, prizeValue: $prizeValue, result: $result, prize: $prize, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $LotteryRecordResponseCopyWith<$Res>  {
  factory $LotteryRecordResponseCopyWith(LotteryRecordResponse value, $Res Function(LotteryRecordResponse) _then) = _$LotteryRecordResponseCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'prize_id') int? prizeId,@JsonKey(name: 'prize_type') String prizeType,@JsonKey(name: 'prize_value') int prizeValue, String result, LotteryPrizeResponse? prize,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


$LotteryPrizeResponseCopyWith<$Res>? get prize;

}
/// @nodoc
class _$LotteryRecordResponseCopyWithImpl<$Res>
    implements $LotteryRecordResponseCopyWith<$Res> {
  _$LotteryRecordResponseCopyWithImpl(this._self, this._then);

  final LotteryRecordResponse _self;
  final $Res Function(LotteryRecordResponse) _then;

/// Create a copy of LotteryRecordResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? prizeId = freezed,Object? prizeType = null,Object? prizeValue = null,Object? result = null,Object? prize = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,prizeId: freezed == prizeId ? _self.prizeId : prizeId // ignore: cast_nullable_to_non_nullable
as int?,prizeType: null == prizeType ? _self.prizeType : prizeType // ignore: cast_nullable_to_non_nullable
as String,prizeValue: null == prizeValue ? _self.prizeValue : prizeValue // ignore: cast_nullable_to_non_nullable
as int,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,prize: freezed == prize ? _self.prize : prize // ignore: cast_nullable_to_non_nullable
as LotteryPrizeResponse?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of LotteryRecordResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LotteryPrizeResponseCopyWith<$Res>? get prize {
    if (_self.prize == null) {
    return null;
  }

  return $LotteryPrizeResponseCopyWith<$Res>(_self.prize!, (value) {
    return _then(_self.copyWith(prize: value));
  });
}
}


/// Adds pattern-matching-related methods to [LotteryRecordResponse].
extension LotteryRecordResponsePatterns on LotteryRecordResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LotteryRecordResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LotteryRecordResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LotteryRecordResponse value)  $default,){
final _that = this;
switch (_that) {
case _LotteryRecordResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LotteryRecordResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LotteryRecordResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'prize_id')  int? prizeId, @JsonKey(name: 'prize_type')  String prizeType, @JsonKey(name: 'prize_value')  int prizeValue,  String result,  LotteryPrizeResponse? prize, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LotteryRecordResponse() when $default != null:
return $default(_that.id,_that.userId,_that.prizeId,_that.prizeType,_that.prizeValue,_that.result,_that.prize,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'prize_id')  int? prizeId, @JsonKey(name: 'prize_type')  String prizeType, @JsonKey(name: 'prize_value')  int prizeValue,  String result,  LotteryPrizeResponse? prize, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _LotteryRecordResponse():
return $default(_that.id,_that.userId,_that.prizeId,_that.prizeType,_that.prizeValue,_that.result,_that.prize,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'prize_id')  int? prizeId, @JsonKey(name: 'prize_type')  String prizeType, @JsonKey(name: 'prize_value')  int prizeValue,  String result,  LotteryPrizeResponse? prize, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _LotteryRecordResponse() when $default != null:
return $default(_that.id,_that.userId,_that.prizeId,_that.prizeType,_that.prizeValue,_that.result,_that.prize,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LotteryRecordResponse implements LotteryRecordResponse {
  const _LotteryRecordResponse({required this.id, @JsonKey(name: 'user_id') this.userId = 0, @JsonKey(name: 'prize_id') this.prizeId = null, @JsonKey(name: 'prize_type') this.prizeType = '', @JsonKey(name: 'prize_value') this.prizeValue = 0, this.result = '', this.prize = null, @JsonKey(name: 'created_at') this.createdAt = null, @JsonKey(name: 'updated_at') this.updatedAt = null});
  factory _LotteryRecordResponse.fromJson(Map<String, dynamic> json) => _$LotteryRecordResponseFromJson(json);

/// 记录ID
@override final  int id;
/// 用户ID
@override@JsonKey(name: 'user_id') final  int userId;
/// 奖品ID
@override@JsonKey(name: 'prize_id') final  int? prizeId;
/// 奖品类型
@override@JsonKey(name: 'prize_type') final  String prizeType;
/// 奖品价值
@override@JsonKey(name: 'prize_value') final  int prizeValue;
/// 抽奖结果 (win, lose)
@override@JsonKey() final  String result;
/// 获得的奖品详情
@override@JsonKey() final  LotteryPrizeResponse? prize;
/// 抽奖时间
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
/// 更新时间
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of LotteryRecordResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LotteryRecordResponseCopyWith<_LotteryRecordResponse> get copyWith => __$LotteryRecordResponseCopyWithImpl<_LotteryRecordResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LotteryRecordResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LotteryRecordResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.prizeId, prizeId) || other.prizeId == prizeId)&&(identical(other.prizeType, prizeType) || other.prizeType == prizeType)&&(identical(other.prizeValue, prizeValue) || other.prizeValue == prizeValue)&&(identical(other.result, result) || other.result == result)&&(identical(other.prize, prize) || other.prize == prize)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,prizeId,prizeType,prizeValue,result,prize,createdAt,updatedAt);

@override
String toString() {
  return 'LotteryRecordResponse(id: $id, userId: $userId, prizeId: $prizeId, prizeType: $prizeType, prizeValue: $prizeValue, result: $result, prize: $prize, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$LotteryRecordResponseCopyWith<$Res> implements $LotteryRecordResponseCopyWith<$Res> {
  factory _$LotteryRecordResponseCopyWith(_LotteryRecordResponse value, $Res Function(_LotteryRecordResponse) _then) = __$LotteryRecordResponseCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'prize_id') int? prizeId,@JsonKey(name: 'prize_type') String prizeType,@JsonKey(name: 'prize_value') int prizeValue, String result, LotteryPrizeResponse? prize,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


@override $LotteryPrizeResponseCopyWith<$Res>? get prize;

}
/// @nodoc
class __$LotteryRecordResponseCopyWithImpl<$Res>
    implements _$LotteryRecordResponseCopyWith<$Res> {
  __$LotteryRecordResponseCopyWithImpl(this._self, this._then);

  final _LotteryRecordResponse _self;
  final $Res Function(_LotteryRecordResponse) _then;

/// Create a copy of LotteryRecordResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? prizeId = freezed,Object? prizeType = null,Object? prizeValue = null,Object? result = null,Object? prize = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_LotteryRecordResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,prizeId: freezed == prizeId ? _self.prizeId : prizeId // ignore: cast_nullable_to_non_nullable
as int?,prizeType: null == prizeType ? _self.prizeType : prizeType // ignore: cast_nullable_to_non_nullable
as String,prizeValue: null == prizeValue ? _self.prizeValue : prizeValue // ignore: cast_nullable_to_non_nullable
as int,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,prize: freezed == prize ? _self.prize : prize // ignore: cast_nullable_to_non_nullable
as LotteryPrizeResponse?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of LotteryRecordResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LotteryPrizeResponseCopyWith<$Res>? get prize {
    if (_self.prize == null) {
    return null;
  }

  return $LotteryPrizeResponseCopyWith<$Res>(_self.prize!, (value) {
    return _then(_self.copyWith(prize: value));
  });
}
}

// dart format on
