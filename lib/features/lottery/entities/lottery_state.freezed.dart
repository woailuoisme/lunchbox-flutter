// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lottery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LotteryState {

/// 奖盘池中的商品列表
 List<LotteryPrizeResponse> get prizes;/// 用户的中奖/抽奖记录
 List<LotteryRecordResponse> get records;/// 统计信息
 LotteryStatisticsResponse? get statistics;/// 剩余次数
 int get remainingSpins;/// 是否正在旋转
 bool get isSpinning;/// 是否正在加载
 bool get isLoading;/// 最后一次中奖的奖品
 LotteryPrizeResponse? get lastWonPrize;/// 错误消息
 String? get errorMessage;
/// Create a copy of LotteryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LotteryStateCopyWith<LotteryState> get copyWith => _$LotteryStateCopyWithImpl<LotteryState>(this as LotteryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LotteryState&&const DeepCollectionEquality().equals(other.prizes, prizes)&&const DeepCollectionEquality().equals(other.records, records)&&(identical(other.statistics, statistics) || other.statistics == statistics)&&(identical(other.remainingSpins, remainingSpins) || other.remainingSpins == remainingSpins)&&(identical(other.isSpinning, isSpinning) || other.isSpinning == isSpinning)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.lastWonPrize, lastWonPrize) || other.lastWonPrize == lastWonPrize)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(prizes),const DeepCollectionEquality().hash(records),statistics,remainingSpins,isSpinning,isLoading,lastWonPrize,errorMessage);

@override
String toString() {
  return 'LotteryState(prizes: $prizes, records: $records, statistics: $statistics, remainingSpins: $remainingSpins, isSpinning: $isSpinning, isLoading: $isLoading, lastWonPrize: $lastWonPrize, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $LotteryStateCopyWith<$Res>  {
  factory $LotteryStateCopyWith(LotteryState value, $Res Function(LotteryState) _then) = _$LotteryStateCopyWithImpl;
@useResult
$Res call({
 List<LotteryPrizeResponse> prizes, List<LotteryRecordResponse> records, LotteryStatisticsResponse? statistics, int remainingSpins, bool isSpinning, bool isLoading, LotteryPrizeResponse? lastWonPrize, String? errorMessage
});


$LotteryStatisticsResponseCopyWith<$Res>? get statistics;$LotteryPrizeResponseCopyWith<$Res>? get lastWonPrize;

}
/// @nodoc
class _$LotteryStateCopyWithImpl<$Res>
    implements $LotteryStateCopyWith<$Res> {
  _$LotteryStateCopyWithImpl(this._self, this._then);

  final LotteryState _self;
  final $Res Function(LotteryState) _then;

/// Create a copy of LotteryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prizes = null,Object? records = null,Object? statistics = freezed,Object? remainingSpins = null,Object? isSpinning = null,Object? isLoading = null,Object? lastWonPrize = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
prizes: null == prizes ? _self.prizes : prizes // ignore: cast_nullable_to_non_nullable
as List<LotteryPrizeResponse>,records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as List<LotteryRecordResponse>,statistics: freezed == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as LotteryStatisticsResponse?,remainingSpins: null == remainingSpins ? _self.remainingSpins : remainingSpins // ignore: cast_nullable_to_non_nullable
as int,isSpinning: null == isSpinning ? _self.isSpinning : isSpinning // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,lastWonPrize: freezed == lastWonPrize ? _self.lastWonPrize : lastWonPrize // ignore: cast_nullable_to_non_nullable
as LotteryPrizeResponse?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of LotteryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LotteryStatisticsResponseCopyWith<$Res>? get statistics {
    if (_self.statistics == null) {
    return null;
  }

  return $LotteryStatisticsResponseCopyWith<$Res>(_self.statistics!, (value) {
    return _then(_self.copyWith(statistics: value));
  });
}/// Create a copy of LotteryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LotteryPrizeResponseCopyWith<$Res>? get lastWonPrize {
    if (_self.lastWonPrize == null) {
    return null;
  }

  return $LotteryPrizeResponseCopyWith<$Res>(_self.lastWonPrize!, (value) {
    return _then(_self.copyWith(lastWonPrize: value));
  });
}
}


/// Adds pattern-matching-related methods to [LotteryState].
extension LotteryStatePatterns on LotteryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LotteryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LotteryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LotteryState value)  $default,){
final _that = this;
switch (_that) {
case _LotteryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LotteryState value)?  $default,){
final _that = this;
switch (_that) {
case _LotteryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LotteryPrizeResponse> prizes,  List<LotteryRecordResponse> records,  LotteryStatisticsResponse? statistics,  int remainingSpins,  bool isSpinning,  bool isLoading,  LotteryPrizeResponse? lastWonPrize,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LotteryState() when $default != null:
return $default(_that.prizes,_that.records,_that.statistics,_that.remainingSpins,_that.isSpinning,_that.isLoading,_that.lastWonPrize,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LotteryPrizeResponse> prizes,  List<LotteryRecordResponse> records,  LotteryStatisticsResponse? statistics,  int remainingSpins,  bool isSpinning,  bool isLoading,  LotteryPrizeResponse? lastWonPrize,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _LotteryState():
return $default(_that.prizes,_that.records,_that.statistics,_that.remainingSpins,_that.isSpinning,_that.isLoading,_that.lastWonPrize,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LotteryPrizeResponse> prizes,  List<LotteryRecordResponse> records,  LotteryStatisticsResponse? statistics,  int remainingSpins,  bool isSpinning,  bool isLoading,  LotteryPrizeResponse? lastWonPrize,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _LotteryState() when $default != null:
return $default(_that.prizes,_that.records,_that.statistics,_that.remainingSpins,_that.isSpinning,_that.isLoading,_that.lastWonPrize,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _LotteryState implements LotteryState {
  const _LotteryState({final  List<LotteryPrizeResponse> prizes = const [], final  List<LotteryRecordResponse> records = const [], this.statistics, this.remainingSpins = 0, this.isSpinning = false, this.isLoading = false, this.lastWonPrize, this.errorMessage}): _prizes = prizes,_records = records;
  

/// 奖盘池中的商品列表
 final  List<LotteryPrizeResponse> _prizes;
/// 奖盘池中的商品列表
@override@JsonKey() List<LotteryPrizeResponse> get prizes {
  if (_prizes is EqualUnmodifiableListView) return _prizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_prizes);
}

/// 用户的中奖/抽奖记录
 final  List<LotteryRecordResponse> _records;
/// 用户的中奖/抽奖记录
@override@JsonKey() List<LotteryRecordResponse> get records {
  if (_records is EqualUnmodifiableListView) return _records;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_records);
}

/// 统计信息
@override final  LotteryStatisticsResponse? statistics;
/// 剩余次数
@override@JsonKey() final  int remainingSpins;
/// 是否正在旋转
@override@JsonKey() final  bool isSpinning;
/// 是否正在加载
@override@JsonKey() final  bool isLoading;
/// 最后一次中奖的奖品
@override final  LotteryPrizeResponse? lastWonPrize;
/// 错误消息
@override final  String? errorMessage;

/// Create a copy of LotteryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LotteryStateCopyWith<_LotteryState> get copyWith => __$LotteryStateCopyWithImpl<_LotteryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LotteryState&&const DeepCollectionEquality().equals(other._prizes, _prizes)&&const DeepCollectionEquality().equals(other._records, _records)&&(identical(other.statistics, statistics) || other.statistics == statistics)&&(identical(other.remainingSpins, remainingSpins) || other.remainingSpins == remainingSpins)&&(identical(other.isSpinning, isSpinning) || other.isSpinning == isSpinning)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.lastWonPrize, lastWonPrize) || other.lastWonPrize == lastWonPrize)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_prizes),const DeepCollectionEquality().hash(_records),statistics,remainingSpins,isSpinning,isLoading,lastWonPrize,errorMessage);

@override
String toString() {
  return 'LotteryState(prizes: $prizes, records: $records, statistics: $statistics, remainingSpins: $remainingSpins, isSpinning: $isSpinning, isLoading: $isLoading, lastWonPrize: $lastWonPrize, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$LotteryStateCopyWith<$Res> implements $LotteryStateCopyWith<$Res> {
  factory _$LotteryStateCopyWith(_LotteryState value, $Res Function(_LotteryState) _then) = __$LotteryStateCopyWithImpl;
@override @useResult
$Res call({
 List<LotteryPrizeResponse> prizes, List<LotteryRecordResponse> records, LotteryStatisticsResponse? statistics, int remainingSpins, bool isSpinning, bool isLoading, LotteryPrizeResponse? lastWonPrize, String? errorMessage
});


@override $LotteryStatisticsResponseCopyWith<$Res>? get statistics;@override $LotteryPrizeResponseCopyWith<$Res>? get lastWonPrize;

}
/// @nodoc
class __$LotteryStateCopyWithImpl<$Res>
    implements _$LotteryStateCopyWith<$Res> {
  __$LotteryStateCopyWithImpl(this._self, this._then);

  final _LotteryState _self;
  final $Res Function(_LotteryState) _then;

/// Create a copy of LotteryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prizes = null,Object? records = null,Object? statistics = freezed,Object? remainingSpins = null,Object? isSpinning = null,Object? isLoading = null,Object? lastWonPrize = freezed,Object? errorMessage = freezed,}) {
  return _then(_LotteryState(
prizes: null == prizes ? _self._prizes : prizes // ignore: cast_nullable_to_non_nullable
as List<LotteryPrizeResponse>,records: null == records ? _self._records : records // ignore: cast_nullable_to_non_nullable
as List<LotteryRecordResponse>,statistics: freezed == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as LotteryStatisticsResponse?,remainingSpins: null == remainingSpins ? _self.remainingSpins : remainingSpins // ignore: cast_nullable_to_non_nullable
as int,isSpinning: null == isSpinning ? _self.isSpinning : isSpinning // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,lastWonPrize: freezed == lastWonPrize ? _self.lastWonPrize : lastWonPrize // ignore: cast_nullable_to_non_nullable
as LotteryPrizeResponse?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LotteryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LotteryStatisticsResponseCopyWith<$Res>? get statistics {
    if (_self.statistics == null) {
    return null;
  }

  return $LotteryStatisticsResponseCopyWith<$Res>(_self.statistics!, (value) {
    return _then(_self.copyWith(statistics: value));
  });
}/// Create a copy of LotteryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LotteryPrizeResponseCopyWith<$Res>? get lastWonPrize {
    if (_self.lastWonPrize == null) {
    return null;
  }

  return $LotteryPrizeResponseCopyWith<$Res>(_self.lastWonPrize!, (value) {
    return _then(_self.copyWith(lastWonPrize: value));
  });
}
}

// dart format on
