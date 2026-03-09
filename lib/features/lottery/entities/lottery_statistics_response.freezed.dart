// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lottery_statistics_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LotteryStatisticsResponse {

/// 总记录数
@JsonKey(name: 'total_records') int get totalRecords;/// 中奖记录数
@JsonKey(name: 'winning_records') int get winningRecords;/// 已发放记录数
@JsonKey(name: 'distributed_records') int get distributedRecords;/// 中奖率
@JsonKey(name: 'win_rate') double get winRate;/// 中奖率百分比字符串
@JsonKey(name: 'win_rate_percentage') String get winRatePercentage;
/// Create a copy of LotteryStatisticsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LotteryStatisticsResponseCopyWith<LotteryStatisticsResponse> get copyWith => _$LotteryStatisticsResponseCopyWithImpl<LotteryStatisticsResponse>(this as LotteryStatisticsResponse, _$identity);

  /// Serializes this LotteryStatisticsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LotteryStatisticsResponse&&(identical(other.totalRecords, totalRecords) || other.totalRecords == totalRecords)&&(identical(other.winningRecords, winningRecords) || other.winningRecords == winningRecords)&&(identical(other.distributedRecords, distributedRecords) || other.distributedRecords == distributedRecords)&&(identical(other.winRate, winRate) || other.winRate == winRate)&&(identical(other.winRatePercentage, winRatePercentage) || other.winRatePercentage == winRatePercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRecords,winningRecords,distributedRecords,winRate,winRatePercentage);

@override
String toString() {
  return 'LotteryStatisticsResponse(totalRecords: $totalRecords, winningRecords: $winningRecords, distributedRecords: $distributedRecords, winRate: $winRate, winRatePercentage: $winRatePercentage)';
}


}

/// @nodoc
abstract mixin class $LotteryStatisticsResponseCopyWith<$Res>  {
  factory $LotteryStatisticsResponseCopyWith(LotteryStatisticsResponse value, $Res Function(LotteryStatisticsResponse) _then) = _$LotteryStatisticsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_records') int totalRecords,@JsonKey(name: 'winning_records') int winningRecords,@JsonKey(name: 'distributed_records') int distributedRecords,@JsonKey(name: 'win_rate') double winRate,@JsonKey(name: 'win_rate_percentage') String winRatePercentage
});




}
/// @nodoc
class _$LotteryStatisticsResponseCopyWithImpl<$Res>
    implements $LotteryStatisticsResponseCopyWith<$Res> {
  _$LotteryStatisticsResponseCopyWithImpl(this._self, this._then);

  final LotteryStatisticsResponse _self;
  final $Res Function(LotteryStatisticsResponse) _then;

/// Create a copy of LotteryStatisticsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalRecords = null,Object? winningRecords = null,Object? distributedRecords = null,Object? winRate = null,Object? winRatePercentage = null,}) {
  return _then(_self.copyWith(
totalRecords: null == totalRecords ? _self.totalRecords : totalRecords // ignore: cast_nullable_to_non_nullable
as int,winningRecords: null == winningRecords ? _self.winningRecords : winningRecords // ignore: cast_nullable_to_non_nullable
as int,distributedRecords: null == distributedRecords ? _self.distributedRecords : distributedRecords // ignore: cast_nullable_to_non_nullable
as int,winRate: null == winRate ? _self.winRate : winRate // ignore: cast_nullable_to_non_nullable
as double,winRatePercentage: null == winRatePercentage ? _self.winRatePercentage : winRatePercentage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LotteryStatisticsResponse].
extension LotteryStatisticsResponsePatterns on LotteryStatisticsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LotteryStatisticsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LotteryStatisticsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LotteryStatisticsResponse value)  $default,){
final _that = this;
switch (_that) {
case _LotteryStatisticsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LotteryStatisticsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LotteryStatisticsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_records')  int totalRecords, @JsonKey(name: 'winning_records')  int winningRecords, @JsonKey(name: 'distributed_records')  int distributedRecords, @JsonKey(name: 'win_rate')  double winRate, @JsonKey(name: 'win_rate_percentage')  String winRatePercentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LotteryStatisticsResponse() when $default != null:
return $default(_that.totalRecords,_that.winningRecords,_that.distributedRecords,_that.winRate,_that.winRatePercentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_records')  int totalRecords, @JsonKey(name: 'winning_records')  int winningRecords, @JsonKey(name: 'distributed_records')  int distributedRecords, @JsonKey(name: 'win_rate')  double winRate, @JsonKey(name: 'win_rate_percentage')  String winRatePercentage)  $default,) {final _that = this;
switch (_that) {
case _LotteryStatisticsResponse():
return $default(_that.totalRecords,_that.winningRecords,_that.distributedRecords,_that.winRate,_that.winRatePercentage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_records')  int totalRecords, @JsonKey(name: 'winning_records')  int winningRecords, @JsonKey(name: 'distributed_records')  int distributedRecords, @JsonKey(name: 'win_rate')  double winRate, @JsonKey(name: 'win_rate_percentage')  String winRatePercentage)?  $default,) {final _that = this;
switch (_that) {
case _LotteryStatisticsResponse() when $default != null:
return $default(_that.totalRecords,_that.winningRecords,_that.distributedRecords,_that.winRate,_that.winRatePercentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LotteryStatisticsResponse implements LotteryStatisticsResponse {
  const _LotteryStatisticsResponse({@JsonKey(name: 'total_records') this.totalRecords = 0, @JsonKey(name: 'winning_records') this.winningRecords = 0, @JsonKey(name: 'distributed_records') this.distributedRecords = 0, @JsonKey(name: 'win_rate') this.winRate = 0.0, @JsonKey(name: 'win_rate_percentage') this.winRatePercentage = '0%'});
  factory _LotteryStatisticsResponse.fromJson(Map<String, dynamic> json) => _$LotteryStatisticsResponseFromJson(json);

/// 总记录数
@override@JsonKey(name: 'total_records') final  int totalRecords;
/// 中奖记录数
@override@JsonKey(name: 'winning_records') final  int winningRecords;
/// 已发放记录数
@override@JsonKey(name: 'distributed_records') final  int distributedRecords;
/// 中奖率
@override@JsonKey(name: 'win_rate') final  double winRate;
/// 中奖率百分比字符串
@override@JsonKey(name: 'win_rate_percentage') final  String winRatePercentage;

/// Create a copy of LotteryStatisticsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LotteryStatisticsResponseCopyWith<_LotteryStatisticsResponse> get copyWith => __$LotteryStatisticsResponseCopyWithImpl<_LotteryStatisticsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LotteryStatisticsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LotteryStatisticsResponse&&(identical(other.totalRecords, totalRecords) || other.totalRecords == totalRecords)&&(identical(other.winningRecords, winningRecords) || other.winningRecords == winningRecords)&&(identical(other.distributedRecords, distributedRecords) || other.distributedRecords == distributedRecords)&&(identical(other.winRate, winRate) || other.winRate == winRate)&&(identical(other.winRatePercentage, winRatePercentage) || other.winRatePercentage == winRatePercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRecords,winningRecords,distributedRecords,winRate,winRatePercentage);

@override
String toString() {
  return 'LotteryStatisticsResponse(totalRecords: $totalRecords, winningRecords: $winningRecords, distributedRecords: $distributedRecords, winRate: $winRate, winRatePercentage: $winRatePercentage)';
}


}

/// @nodoc
abstract mixin class _$LotteryStatisticsResponseCopyWith<$Res> implements $LotteryStatisticsResponseCopyWith<$Res> {
  factory _$LotteryStatisticsResponseCopyWith(_LotteryStatisticsResponse value, $Res Function(_LotteryStatisticsResponse) _then) = __$LotteryStatisticsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_records') int totalRecords,@JsonKey(name: 'winning_records') int winningRecords,@JsonKey(name: 'distributed_records') int distributedRecords,@JsonKey(name: 'win_rate') double winRate,@JsonKey(name: 'win_rate_percentage') String winRatePercentage
});




}
/// @nodoc
class __$LotteryStatisticsResponseCopyWithImpl<$Res>
    implements _$LotteryStatisticsResponseCopyWith<$Res> {
  __$LotteryStatisticsResponseCopyWithImpl(this._self, this._then);

  final _LotteryStatisticsResponse _self;
  final $Res Function(_LotteryStatisticsResponse) _then;

/// Create a copy of LotteryStatisticsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalRecords = null,Object? winningRecords = null,Object? distributedRecords = null,Object? winRate = null,Object? winRatePercentage = null,}) {
  return _then(_LotteryStatisticsResponse(
totalRecords: null == totalRecords ? _self.totalRecords : totalRecords // ignore: cast_nullable_to_non_nullable
as int,winningRecords: null == winningRecords ? _self.winningRecords : winningRecords // ignore: cast_nullable_to_non_nullable
as int,distributedRecords: null == distributedRecords ? _self.distributedRecords : distributedRecords // ignore: cast_nullable_to_non_nullable
as int,winRate: null == winRate ? _self.winRate : winRate // ignore: cast_nullable_to_non_nullable
as double,winRatePercentage: null == winRatePercentage ? _self.winRatePercentage : winRatePercentage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
