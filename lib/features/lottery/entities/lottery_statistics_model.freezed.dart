// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lottery_statistics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LotteryStatisticsModel {

/// 总抽奖次数
@JsonKey(name: 'total_draws') int get totalDraws;/// 剩余抽奖次数
@JsonKey(name: 'remaining_spins') int get remainingSpins;/// 总获得金额/积分
@JsonKey(name: 'total_value') double get totalValue;/// 中奖次数
@JsonKey(name: 'win_count') int get winCount;
/// Create a copy of LotteryStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LotteryStatisticsModelCopyWith<LotteryStatisticsModel> get copyWith => _$LotteryStatisticsModelCopyWithImpl<LotteryStatisticsModel>(this as LotteryStatisticsModel, _$identity);

  /// Serializes this LotteryStatisticsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LotteryStatisticsModel&&(identical(other.totalDraws, totalDraws) || other.totalDraws == totalDraws)&&(identical(other.remainingSpins, remainingSpins) || other.remainingSpins == remainingSpins)&&(identical(other.totalValue, totalValue) || other.totalValue == totalValue)&&(identical(other.winCount, winCount) || other.winCount == winCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDraws,remainingSpins,totalValue,winCount);

@override
String toString() {
  return 'LotteryStatisticsModel(totalDraws: $totalDraws, remainingSpins: $remainingSpins, totalValue: $totalValue, winCount: $winCount)';
}


}

/// @nodoc
abstract mixin class $LotteryStatisticsModelCopyWith<$Res>  {
  factory $LotteryStatisticsModelCopyWith(LotteryStatisticsModel value, $Res Function(LotteryStatisticsModel) _then) = _$LotteryStatisticsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_draws') int totalDraws,@JsonKey(name: 'remaining_spins') int remainingSpins,@JsonKey(name: 'total_value') double totalValue,@JsonKey(name: 'win_count') int winCount
});




}
/// @nodoc
class _$LotteryStatisticsModelCopyWithImpl<$Res>
    implements $LotteryStatisticsModelCopyWith<$Res> {
  _$LotteryStatisticsModelCopyWithImpl(this._self, this._then);

  final LotteryStatisticsModel _self;
  final $Res Function(LotteryStatisticsModel) _then;

/// Create a copy of LotteryStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalDraws = null,Object? remainingSpins = null,Object? totalValue = null,Object? winCount = null,}) {
  return _then(_self.copyWith(
totalDraws: null == totalDraws ? _self.totalDraws : totalDraws // ignore: cast_nullable_to_non_nullable
as int,remainingSpins: null == remainingSpins ? _self.remainingSpins : remainingSpins // ignore: cast_nullable_to_non_nullable
as int,totalValue: null == totalValue ? _self.totalValue : totalValue // ignore: cast_nullable_to_non_nullable
as double,winCount: null == winCount ? _self.winCount : winCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LotteryStatisticsModel].
extension LotteryStatisticsModelPatterns on LotteryStatisticsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LotteryStatisticsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LotteryStatisticsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LotteryStatisticsModel value)  $default,){
final _that = this;
switch (_that) {
case _LotteryStatisticsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LotteryStatisticsModel value)?  $default,){
final _that = this;
switch (_that) {
case _LotteryStatisticsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_draws')  int totalDraws, @JsonKey(name: 'remaining_spins')  int remainingSpins, @JsonKey(name: 'total_value')  double totalValue, @JsonKey(name: 'win_count')  int winCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LotteryStatisticsModel() when $default != null:
return $default(_that.totalDraws,_that.remainingSpins,_that.totalValue,_that.winCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_draws')  int totalDraws, @JsonKey(name: 'remaining_spins')  int remainingSpins, @JsonKey(name: 'total_value')  double totalValue, @JsonKey(name: 'win_count')  int winCount)  $default,) {final _that = this;
switch (_that) {
case _LotteryStatisticsModel():
return $default(_that.totalDraws,_that.remainingSpins,_that.totalValue,_that.winCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_draws')  int totalDraws, @JsonKey(name: 'remaining_spins')  int remainingSpins, @JsonKey(name: 'total_value')  double totalValue, @JsonKey(name: 'win_count')  int winCount)?  $default,) {final _that = this;
switch (_that) {
case _LotteryStatisticsModel() when $default != null:
return $default(_that.totalDraws,_that.remainingSpins,_that.totalValue,_that.winCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LotteryStatisticsModel implements LotteryStatisticsModel {
  const _LotteryStatisticsModel({@JsonKey(name: 'total_draws') this.totalDraws = 0, @JsonKey(name: 'remaining_spins') this.remainingSpins = 0, @JsonKey(name: 'total_value') this.totalValue = 0.0, @JsonKey(name: 'win_count') this.winCount = 0});
  factory _LotteryStatisticsModel.fromJson(Map<String, dynamic> json) => _$LotteryStatisticsModelFromJson(json);

/// 总抽奖次数
@override@JsonKey(name: 'total_draws') final  int totalDraws;
/// 剩余抽奖次数
@override@JsonKey(name: 'remaining_spins') final  int remainingSpins;
/// 总获得金额/积分
@override@JsonKey(name: 'total_value') final  double totalValue;
/// 中奖次数
@override@JsonKey(name: 'win_count') final  int winCount;

/// Create a copy of LotteryStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LotteryStatisticsModelCopyWith<_LotteryStatisticsModel> get copyWith => __$LotteryStatisticsModelCopyWithImpl<_LotteryStatisticsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LotteryStatisticsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LotteryStatisticsModel&&(identical(other.totalDraws, totalDraws) || other.totalDraws == totalDraws)&&(identical(other.remainingSpins, remainingSpins) || other.remainingSpins == remainingSpins)&&(identical(other.totalValue, totalValue) || other.totalValue == totalValue)&&(identical(other.winCount, winCount) || other.winCount == winCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDraws,remainingSpins,totalValue,winCount);

@override
String toString() {
  return 'LotteryStatisticsModel(totalDraws: $totalDraws, remainingSpins: $remainingSpins, totalValue: $totalValue, winCount: $winCount)';
}


}

/// @nodoc
abstract mixin class _$LotteryStatisticsModelCopyWith<$Res> implements $LotteryStatisticsModelCopyWith<$Res> {
  factory _$LotteryStatisticsModelCopyWith(_LotteryStatisticsModel value, $Res Function(_LotteryStatisticsModel) _then) = __$LotteryStatisticsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_draws') int totalDraws,@JsonKey(name: 'remaining_spins') int remainingSpins,@JsonKey(name: 'total_value') double totalValue,@JsonKey(name: 'win_count') int winCount
});




}
/// @nodoc
class __$LotteryStatisticsModelCopyWithImpl<$Res>
    implements _$LotteryStatisticsModelCopyWith<$Res> {
  __$LotteryStatisticsModelCopyWithImpl(this._self, this._then);

  final _LotteryStatisticsModel _self;
  final $Res Function(_LotteryStatisticsModel) _then;

/// Create a copy of LotteryStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalDraws = null,Object? remainingSpins = null,Object? totalValue = null,Object? winCount = null,}) {
  return _then(_LotteryStatisticsModel(
totalDraws: null == totalDraws ? _self.totalDraws : totalDraws // ignore: cast_nullable_to_non_nullable
as int,remainingSpins: null == remainingSpins ? _self.remainingSpins : remainingSpins // ignore: cast_nullable_to_non_nullable
as int,totalValue: null == totalValue ? _self.totalValue : totalValue // ignore: cast_nullable_to_non_nullable
as double,winCount: null == winCount ? _self.winCount : winCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
