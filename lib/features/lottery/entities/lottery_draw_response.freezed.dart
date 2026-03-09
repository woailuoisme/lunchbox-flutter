// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lottery_draw_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LotteryDrawRecord {

 int get id;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'prize_id') int get prizeId;@JsonKey(name: 'prize_type') String get prizeType;@JsonKey(name: 'prize_value') int get prizeValue; String get result;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of LotteryDrawRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LotteryDrawRecordCopyWith<LotteryDrawRecord> get copyWith => _$LotteryDrawRecordCopyWithImpl<LotteryDrawRecord>(this as LotteryDrawRecord, _$identity);

  /// Serializes this LotteryDrawRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LotteryDrawRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.prizeId, prizeId) || other.prizeId == prizeId)&&(identical(other.prizeType, prizeType) || other.prizeType == prizeType)&&(identical(other.prizeValue, prizeValue) || other.prizeValue == prizeValue)&&(identical(other.result, result) || other.result == result)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,prizeId,prizeType,prizeValue,result,createdAt,updatedAt);

@override
String toString() {
  return 'LotteryDrawRecord(id: $id, userId: $userId, prizeId: $prizeId, prizeType: $prizeType, prizeValue: $prizeValue, result: $result, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $LotteryDrawRecordCopyWith<$Res>  {
  factory $LotteryDrawRecordCopyWith(LotteryDrawRecord value, $Res Function(LotteryDrawRecord) _then) = _$LotteryDrawRecordCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'prize_id') int prizeId,@JsonKey(name: 'prize_type') String prizeType,@JsonKey(name: 'prize_value') int prizeValue, String result,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$LotteryDrawRecordCopyWithImpl<$Res>
    implements $LotteryDrawRecordCopyWith<$Res> {
  _$LotteryDrawRecordCopyWithImpl(this._self, this._then);

  final LotteryDrawRecord _self;
  final $Res Function(LotteryDrawRecord) _then;

/// Create a copy of LotteryDrawRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? prizeId = null,Object? prizeType = null,Object? prizeValue = null,Object? result = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,prizeId: null == prizeId ? _self.prizeId : prizeId // ignore: cast_nullable_to_non_nullable
as int,prizeType: null == prizeType ? _self.prizeType : prizeType // ignore: cast_nullable_to_non_nullable
as String,prizeValue: null == prizeValue ? _self.prizeValue : prizeValue // ignore: cast_nullable_to_non_nullable
as int,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [LotteryDrawRecord].
extension LotteryDrawRecordPatterns on LotteryDrawRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LotteryDrawRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LotteryDrawRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LotteryDrawRecord value)  $default,){
final _that = this;
switch (_that) {
case _LotteryDrawRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LotteryDrawRecord value)?  $default,){
final _that = this;
switch (_that) {
case _LotteryDrawRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'prize_id')  int prizeId, @JsonKey(name: 'prize_type')  String prizeType, @JsonKey(name: 'prize_value')  int prizeValue,  String result, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LotteryDrawRecord() when $default != null:
return $default(_that.id,_that.userId,_that.prizeId,_that.prizeType,_that.prizeValue,_that.result,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'prize_id')  int prizeId, @JsonKey(name: 'prize_type')  String prizeType, @JsonKey(name: 'prize_value')  int prizeValue,  String result, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _LotteryDrawRecord():
return $default(_that.id,_that.userId,_that.prizeId,_that.prizeType,_that.prizeValue,_that.result,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'prize_id')  int prizeId, @JsonKey(name: 'prize_type')  String prizeType, @JsonKey(name: 'prize_value')  int prizeValue,  String result, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _LotteryDrawRecord() when $default != null:
return $default(_that.id,_that.userId,_that.prizeId,_that.prizeType,_that.prizeValue,_that.result,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LotteryDrawRecord implements LotteryDrawRecord {
  const _LotteryDrawRecord({required this.id, @JsonKey(name: 'user_id') this.userId = 0, @JsonKey(name: 'prize_id') this.prizeId = 0, @JsonKey(name: 'prize_type') this.prizeType = '', @JsonKey(name: 'prize_value') this.prizeValue = 0, this.result = '', @JsonKey(name: 'created_at') this.createdAt = null, @JsonKey(name: 'updated_at') this.updatedAt = null});
  factory _LotteryDrawRecord.fromJson(Map<String, dynamic> json) => _$LotteryDrawRecordFromJson(json);

@override final  int id;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'prize_id') final  int prizeId;
@override@JsonKey(name: 'prize_type') final  String prizeType;
@override@JsonKey(name: 'prize_value') final  int prizeValue;
@override@JsonKey() final  String result;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of LotteryDrawRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LotteryDrawRecordCopyWith<_LotteryDrawRecord> get copyWith => __$LotteryDrawRecordCopyWithImpl<_LotteryDrawRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LotteryDrawRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LotteryDrawRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.prizeId, prizeId) || other.prizeId == prizeId)&&(identical(other.prizeType, prizeType) || other.prizeType == prizeType)&&(identical(other.prizeValue, prizeValue) || other.prizeValue == prizeValue)&&(identical(other.result, result) || other.result == result)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,prizeId,prizeType,prizeValue,result,createdAt,updatedAt);

@override
String toString() {
  return 'LotteryDrawRecord(id: $id, userId: $userId, prizeId: $prizeId, prizeType: $prizeType, prizeValue: $prizeValue, result: $result, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$LotteryDrawRecordCopyWith<$Res> implements $LotteryDrawRecordCopyWith<$Res> {
  factory _$LotteryDrawRecordCopyWith(_LotteryDrawRecord value, $Res Function(_LotteryDrawRecord) _then) = __$LotteryDrawRecordCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'prize_id') int prizeId,@JsonKey(name: 'prize_type') String prizeType,@JsonKey(name: 'prize_value') int prizeValue, String result,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$LotteryDrawRecordCopyWithImpl<$Res>
    implements _$LotteryDrawRecordCopyWith<$Res> {
  __$LotteryDrawRecordCopyWithImpl(this._self, this._then);

  final _LotteryDrawRecord _self;
  final $Res Function(_LotteryDrawRecord) _then;

/// Create a copy of LotteryDrawRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? prizeId = null,Object? prizeType = null,Object? prizeValue = null,Object? result = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_LotteryDrawRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,prizeId: null == prizeId ? _self.prizeId : prizeId // ignore: cast_nullable_to_non_nullable
as int,prizeType: null == prizeType ? _self.prizeType : prizeType // ignore: cast_nullable_to_non_nullable
as String,prizeValue: null == prizeValue ? _self.prizeValue : prizeValue // ignore: cast_nullable_to_non_nullable
as int,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$LotteryDrawResponse {

/// 抽奖生成的记录
 LotteryDrawRecord get record;/// 中奖的奖品详情 (未中奖时可能为 null 或特定的空奖品)
 LotteryPrizeResponse? get prize;/// 是否中奖
@JsonKey(name: 'is_winning') bool get isWinning;
/// Create a copy of LotteryDrawResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LotteryDrawResponseCopyWith<LotteryDrawResponse> get copyWith => _$LotteryDrawResponseCopyWithImpl<LotteryDrawResponse>(this as LotteryDrawResponse, _$identity);

  /// Serializes this LotteryDrawResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LotteryDrawResponse&&(identical(other.record, record) || other.record == record)&&(identical(other.prize, prize) || other.prize == prize)&&(identical(other.isWinning, isWinning) || other.isWinning == isWinning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,record,prize,isWinning);

@override
String toString() {
  return 'LotteryDrawResponse(record: $record, prize: $prize, isWinning: $isWinning)';
}


}

/// @nodoc
abstract mixin class $LotteryDrawResponseCopyWith<$Res>  {
  factory $LotteryDrawResponseCopyWith(LotteryDrawResponse value, $Res Function(LotteryDrawResponse) _then) = _$LotteryDrawResponseCopyWithImpl;
@useResult
$Res call({
 LotteryDrawRecord record, LotteryPrizeResponse? prize,@JsonKey(name: 'is_winning') bool isWinning
});


$LotteryDrawRecordCopyWith<$Res> get record;$LotteryPrizeResponseCopyWith<$Res>? get prize;

}
/// @nodoc
class _$LotteryDrawResponseCopyWithImpl<$Res>
    implements $LotteryDrawResponseCopyWith<$Res> {
  _$LotteryDrawResponseCopyWithImpl(this._self, this._then);

  final LotteryDrawResponse _self;
  final $Res Function(LotteryDrawResponse) _then;

/// Create a copy of LotteryDrawResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? record = null,Object? prize = freezed,Object? isWinning = null,}) {
  return _then(_self.copyWith(
record: null == record ? _self.record : record // ignore: cast_nullable_to_non_nullable
as LotteryDrawRecord,prize: freezed == prize ? _self.prize : prize // ignore: cast_nullable_to_non_nullable
as LotteryPrizeResponse?,isWinning: null == isWinning ? _self.isWinning : isWinning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of LotteryDrawResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LotteryDrawRecordCopyWith<$Res> get record {
  
  return $LotteryDrawRecordCopyWith<$Res>(_self.record, (value) {
    return _then(_self.copyWith(record: value));
  });
}/// Create a copy of LotteryDrawResponse
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


/// Adds pattern-matching-related methods to [LotteryDrawResponse].
extension LotteryDrawResponsePatterns on LotteryDrawResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LotteryDrawResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LotteryDrawResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LotteryDrawResponse value)  $default,){
final _that = this;
switch (_that) {
case _LotteryDrawResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LotteryDrawResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LotteryDrawResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LotteryDrawRecord record,  LotteryPrizeResponse? prize, @JsonKey(name: 'is_winning')  bool isWinning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LotteryDrawResponse() when $default != null:
return $default(_that.record,_that.prize,_that.isWinning);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LotteryDrawRecord record,  LotteryPrizeResponse? prize, @JsonKey(name: 'is_winning')  bool isWinning)  $default,) {final _that = this;
switch (_that) {
case _LotteryDrawResponse():
return $default(_that.record,_that.prize,_that.isWinning);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LotteryDrawRecord record,  LotteryPrizeResponse? prize, @JsonKey(name: 'is_winning')  bool isWinning)?  $default,) {final _that = this;
switch (_that) {
case _LotteryDrawResponse() when $default != null:
return $default(_that.record,_that.prize,_that.isWinning);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LotteryDrawResponse implements LotteryDrawResponse {
  const _LotteryDrawResponse({this.record = const LotteryDrawRecord(id: 0), this.prize = null, @JsonKey(name: 'is_winning') this.isWinning = false});
  factory _LotteryDrawResponse.fromJson(Map<String, dynamic> json) => _$LotteryDrawResponseFromJson(json);

/// 抽奖生成的记录
@override@JsonKey() final  LotteryDrawRecord record;
/// 中奖的奖品详情 (未中奖时可能为 null 或特定的空奖品)
@override@JsonKey() final  LotteryPrizeResponse? prize;
/// 是否中奖
@override@JsonKey(name: 'is_winning') final  bool isWinning;

/// Create a copy of LotteryDrawResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LotteryDrawResponseCopyWith<_LotteryDrawResponse> get copyWith => __$LotteryDrawResponseCopyWithImpl<_LotteryDrawResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LotteryDrawResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LotteryDrawResponse&&(identical(other.record, record) || other.record == record)&&(identical(other.prize, prize) || other.prize == prize)&&(identical(other.isWinning, isWinning) || other.isWinning == isWinning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,record,prize,isWinning);

@override
String toString() {
  return 'LotteryDrawResponse(record: $record, prize: $prize, isWinning: $isWinning)';
}


}

/// @nodoc
abstract mixin class _$LotteryDrawResponseCopyWith<$Res> implements $LotteryDrawResponseCopyWith<$Res> {
  factory _$LotteryDrawResponseCopyWith(_LotteryDrawResponse value, $Res Function(_LotteryDrawResponse) _then) = __$LotteryDrawResponseCopyWithImpl;
@override @useResult
$Res call({
 LotteryDrawRecord record, LotteryPrizeResponse? prize,@JsonKey(name: 'is_winning') bool isWinning
});


@override $LotteryDrawRecordCopyWith<$Res> get record;@override $LotteryPrizeResponseCopyWith<$Res>? get prize;

}
/// @nodoc
class __$LotteryDrawResponseCopyWithImpl<$Res>
    implements _$LotteryDrawResponseCopyWith<$Res> {
  __$LotteryDrawResponseCopyWithImpl(this._self, this._then);

  final _LotteryDrawResponse _self;
  final $Res Function(_LotteryDrawResponse) _then;

/// Create a copy of LotteryDrawResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? record = null,Object? prize = freezed,Object? isWinning = null,}) {
  return _then(_LotteryDrawResponse(
record: null == record ? _self.record : record // ignore: cast_nullable_to_non_nullable
as LotteryDrawRecord,prize: freezed == prize ? _self.prize : prize // ignore: cast_nullable_to_non_nullable
as LotteryPrizeResponse?,isWinning: null == isWinning ? _self.isWinning : isWinning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of LotteryDrawResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LotteryDrawRecordCopyWith<$Res> get record {
  
  return $LotteryDrawRecordCopyWith<$Res>(_self.record, (value) {
    return _then(_self.copyWith(record: value));
  });
}/// Create a copy of LotteryDrawResponse
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
