// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lottery_prize_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrizeRules {

@JsonKey(name: 'integral_amount') int? get integralAmount;
/// Create a copy of PrizeRules
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrizeRulesCopyWith<PrizeRules> get copyWith => _$PrizeRulesCopyWithImpl<PrizeRules>(this as PrizeRules, _$identity);

  /// Serializes this PrizeRules to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrizeRules&&(identical(other.integralAmount, integralAmount) || other.integralAmount == integralAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,integralAmount);

@override
String toString() {
  return 'PrizeRules(integralAmount: $integralAmount)';
}


}

/// @nodoc
abstract mixin class $PrizeRulesCopyWith<$Res>  {
  factory $PrizeRulesCopyWith(PrizeRules value, $Res Function(PrizeRules) _then) = _$PrizeRulesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'integral_amount') int? integralAmount
});




}
/// @nodoc
class _$PrizeRulesCopyWithImpl<$Res>
    implements $PrizeRulesCopyWith<$Res> {
  _$PrizeRulesCopyWithImpl(this._self, this._then);

  final PrizeRules _self;
  final $Res Function(PrizeRules) _then;

/// Create a copy of PrizeRules
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? integralAmount = freezed,}) {
  return _then(_self.copyWith(
integralAmount: freezed == integralAmount ? _self.integralAmount : integralAmount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PrizeRules].
extension PrizeRulesPatterns on PrizeRules {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrizeRules value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrizeRules() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrizeRules value)  $default,){
final _that = this;
switch (_that) {
case _PrizeRules():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrizeRules value)?  $default,){
final _that = this;
switch (_that) {
case _PrizeRules() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'integral_amount')  int? integralAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrizeRules() when $default != null:
return $default(_that.integralAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'integral_amount')  int? integralAmount)  $default,) {final _that = this;
switch (_that) {
case _PrizeRules():
return $default(_that.integralAmount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'integral_amount')  int? integralAmount)?  $default,) {final _that = this;
switch (_that) {
case _PrizeRules() when $default != null:
return $default(_that.integralAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrizeRules implements PrizeRules {
  const _PrizeRules({@JsonKey(name: 'integral_amount') this.integralAmount = null});
  factory _PrizeRules.fromJson(Map<String, dynamic> json) => _$PrizeRulesFromJson(json);

@override@JsonKey(name: 'integral_amount') final  int? integralAmount;

/// Create a copy of PrizeRules
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrizeRulesCopyWith<_PrizeRules> get copyWith => __$PrizeRulesCopyWithImpl<_PrizeRules>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrizeRulesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrizeRules&&(identical(other.integralAmount, integralAmount) || other.integralAmount == integralAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,integralAmount);

@override
String toString() {
  return 'PrizeRules(integralAmount: $integralAmount)';
}


}

/// @nodoc
abstract mixin class _$PrizeRulesCopyWith<$Res> implements $PrizeRulesCopyWith<$Res> {
  factory _$PrizeRulesCopyWith(_PrizeRules value, $Res Function(_PrizeRules) _then) = __$PrizeRulesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'integral_amount') int? integralAmount
});




}
/// @nodoc
class __$PrizeRulesCopyWithImpl<$Res>
    implements _$PrizeRulesCopyWith<$Res> {
  __$PrizeRulesCopyWithImpl(this._self, this._then);

  final _PrizeRules _self;
  final $Res Function(_PrizeRules) _then;

/// Create a copy of PrizeRules
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? integralAmount = freezed,}) {
  return _then(_PrizeRules(
integralAmount: freezed == integralAmount ? _self.integralAmount : integralAmount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$LotteryPrizeResponse {

/// 奖品ID
 int get id;/// 奖品名称
 String get name;/// 奖品类型 (integral: 积分)
 String get type;/// 奖品规则
 PrizeRules get rules;/// 中奖概率 (万分位)
 int get probability;/// 每日限制
@JsonKey(name: 'daily_limit') int get dailyLimit;/// 总量限制
@JsonKey(name: 'total_limit') int get totalLimit;/// 今日已发数量
@JsonKey(name: 'daily_count') int get dailyCount;/// 总计已发数量
@JsonKey(name: 'total_count') int get totalCount;/// 是否启用
@JsonKey(name: 'is_enabled') bool get isEnabled;/// 奖品图片
 String get image;/// 奖品描述
 String get description;/// 创建时间
@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of LotteryPrizeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LotteryPrizeResponseCopyWith<LotteryPrizeResponse> get copyWith => _$LotteryPrizeResponseCopyWithImpl<LotteryPrizeResponse>(this as LotteryPrizeResponse, _$identity);

  /// Serializes this LotteryPrizeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LotteryPrizeResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.rules, rules) || other.rules == rules)&&(identical(other.probability, probability) || other.probability == probability)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.totalLimit, totalLimit) || other.totalLimit == totalLimit)&&(identical(other.dailyCount, dailyCount) || other.dailyCount == dailyCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.image, image) || other.image == image)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,rules,probability,dailyLimit,totalLimit,dailyCount,totalCount,isEnabled,image,description,createdAt);

@override
String toString() {
  return 'LotteryPrizeResponse(id: $id, name: $name, type: $type, rules: $rules, probability: $probability, dailyLimit: $dailyLimit, totalLimit: $totalLimit, dailyCount: $dailyCount, totalCount: $totalCount, isEnabled: $isEnabled, image: $image, description: $description, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $LotteryPrizeResponseCopyWith<$Res>  {
  factory $LotteryPrizeResponseCopyWith(LotteryPrizeResponse value, $Res Function(LotteryPrizeResponse) _then) = _$LotteryPrizeResponseCopyWithImpl;
@useResult
$Res call({
 int id, String name, String type, PrizeRules rules, int probability,@JsonKey(name: 'daily_limit') int dailyLimit,@JsonKey(name: 'total_limit') int totalLimit,@JsonKey(name: 'daily_count') int dailyCount,@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'is_enabled') bool isEnabled, String image, String description,@JsonKey(name: 'created_at') String createdAt
});


$PrizeRulesCopyWith<$Res> get rules;

}
/// @nodoc
class _$LotteryPrizeResponseCopyWithImpl<$Res>
    implements $LotteryPrizeResponseCopyWith<$Res> {
  _$LotteryPrizeResponseCopyWithImpl(this._self, this._then);

  final LotteryPrizeResponse _self;
  final $Res Function(LotteryPrizeResponse) _then;

/// Create a copy of LotteryPrizeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? rules = null,Object? probability = null,Object? dailyLimit = null,Object? totalLimit = null,Object? dailyCount = null,Object? totalCount = null,Object? isEnabled = null,Object? image = null,Object? description = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as PrizeRules,probability: null == probability ? _self.probability : probability // ignore: cast_nullable_to_non_nullable
as int,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as int,totalLimit: null == totalLimit ? _self.totalLimit : totalLimit // ignore: cast_nullable_to_non_nullable
as int,dailyCount: null == dailyCount ? _self.dailyCount : dailyCount // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of LotteryPrizeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrizeRulesCopyWith<$Res> get rules {
  
  return $PrizeRulesCopyWith<$Res>(_self.rules, (value) {
    return _then(_self.copyWith(rules: value));
  });
}
}


/// Adds pattern-matching-related methods to [LotteryPrizeResponse].
extension LotteryPrizeResponsePatterns on LotteryPrizeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LotteryPrizeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LotteryPrizeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LotteryPrizeResponse value)  $default,){
final _that = this;
switch (_that) {
case _LotteryPrizeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LotteryPrizeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LotteryPrizeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String type,  PrizeRules rules,  int probability, @JsonKey(name: 'daily_limit')  int dailyLimit, @JsonKey(name: 'total_limit')  int totalLimit, @JsonKey(name: 'daily_count')  int dailyCount, @JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'is_enabled')  bool isEnabled,  String image,  String description, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LotteryPrizeResponse() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.rules,_that.probability,_that.dailyLimit,_that.totalLimit,_that.dailyCount,_that.totalCount,_that.isEnabled,_that.image,_that.description,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String type,  PrizeRules rules,  int probability, @JsonKey(name: 'daily_limit')  int dailyLimit, @JsonKey(name: 'total_limit')  int totalLimit, @JsonKey(name: 'daily_count')  int dailyCount, @JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'is_enabled')  bool isEnabled,  String image,  String description, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _LotteryPrizeResponse():
return $default(_that.id,_that.name,_that.type,_that.rules,_that.probability,_that.dailyLimit,_that.totalLimit,_that.dailyCount,_that.totalCount,_that.isEnabled,_that.image,_that.description,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String type,  PrizeRules rules,  int probability, @JsonKey(name: 'daily_limit')  int dailyLimit, @JsonKey(name: 'total_limit')  int totalLimit, @JsonKey(name: 'daily_count')  int dailyCount, @JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'is_enabled')  bool isEnabled,  String image,  String description, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _LotteryPrizeResponse() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.rules,_that.probability,_that.dailyLimit,_that.totalLimit,_that.dailyCount,_that.totalCount,_that.isEnabled,_that.image,_that.description,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LotteryPrizeResponse implements LotteryPrizeResponse {
  const _LotteryPrizeResponse({required this.id, this.name = '', this.type = '', this.rules = const PrizeRules(), this.probability = 0, @JsonKey(name: 'daily_limit') this.dailyLimit = 0, @JsonKey(name: 'total_limit') this.totalLimit = 0, @JsonKey(name: 'daily_count') this.dailyCount = 0, @JsonKey(name: 'total_count') this.totalCount = 0, @JsonKey(name: 'is_enabled') this.isEnabled = false, this.image = '', this.description = '', @JsonKey(name: 'created_at') this.createdAt = ''});
  factory _LotteryPrizeResponse.fromJson(Map<String, dynamic> json) => _$LotteryPrizeResponseFromJson(json);

/// 奖品ID
@override final  int id;
/// 奖品名称
@override@JsonKey() final  String name;
/// 奖品类型 (integral: 积分)
@override@JsonKey() final  String type;
/// 奖品规则
@override@JsonKey() final  PrizeRules rules;
/// 中奖概率 (万分位)
@override@JsonKey() final  int probability;
/// 每日限制
@override@JsonKey(name: 'daily_limit') final  int dailyLimit;
/// 总量限制
@override@JsonKey(name: 'total_limit') final  int totalLimit;
/// 今日已发数量
@override@JsonKey(name: 'daily_count') final  int dailyCount;
/// 总计已发数量
@override@JsonKey(name: 'total_count') final  int totalCount;
/// 是否启用
@override@JsonKey(name: 'is_enabled') final  bool isEnabled;
/// 奖品图片
@override@JsonKey() final  String image;
/// 奖品描述
@override@JsonKey() final  String description;
/// 创建时间
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of LotteryPrizeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LotteryPrizeResponseCopyWith<_LotteryPrizeResponse> get copyWith => __$LotteryPrizeResponseCopyWithImpl<_LotteryPrizeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LotteryPrizeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LotteryPrizeResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.rules, rules) || other.rules == rules)&&(identical(other.probability, probability) || other.probability == probability)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.totalLimit, totalLimit) || other.totalLimit == totalLimit)&&(identical(other.dailyCount, dailyCount) || other.dailyCount == dailyCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.image, image) || other.image == image)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,rules,probability,dailyLimit,totalLimit,dailyCount,totalCount,isEnabled,image,description,createdAt);

@override
String toString() {
  return 'LotteryPrizeResponse(id: $id, name: $name, type: $type, rules: $rules, probability: $probability, dailyLimit: $dailyLimit, totalLimit: $totalLimit, dailyCount: $dailyCount, totalCount: $totalCount, isEnabled: $isEnabled, image: $image, description: $description, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$LotteryPrizeResponseCopyWith<$Res> implements $LotteryPrizeResponseCopyWith<$Res> {
  factory _$LotteryPrizeResponseCopyWith(_LotteryPrizeResponse value, $Res Function(_LotteryPrizeResponse) _then) = __$LotteryPrizeResponseCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String type, PrizeRules rules, int probability,@JsonKey(name: 'daily_limit') int dailyLimit,@JsonKey(name: 'total_limit') int totalLimit,@JsonKey(name: 'daily_count') int dailyCount,@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'is_enabled') bool isEnabled, String image, String description,@JsonKey(name: 'created_at') String createdAt
});


@override $PrizeRulesCopyWith<$Res> get rules;

}
/// @nodoc
class __$LotteryPrizeResponseCopyWithImpl<$Res>
    implements _$LotteryPrizeResponseCopyWith<$Res> {
  __$LotteryPrizeResponseCopyWithImpl(this._self, this._then);

  final _LotteryPrizeResponse _self;
  final $Res Function(_LotteryPrizeResponse) _then;

/// Create a copy of LotteryPrizeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? rules = null,Object? probability = null,Object? dailyLimit = null,Object? totalLimit = null,Object? dailyCount = null,Object? totalCount = null,Object? isEnabled = null,Object? image = null,Object? description = null,Object? createdAt = null,}) {
  return _then(_LotteryPrizeResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as PrizeRules,probability: null == probability ? _self.probability : probability // ignore: cast_nullable_to_non_nullable
as int,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as int,totalLimit: null == totalLimit ? _self.totalLimit : totalLimit // ignore: cast_nullable_to_non_nullable
as int,dailyCount: null == dailyCount ? _self.dailyCount : dailyCount // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of LotteryPrizeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrizeRulesCopyWith<$Res> get rules {
  
  return $PrizeRulesCopyWith<$Res>(_self.rules, (value) {
    return _then(_self.copyWith(rules: value));
  });
}
}

// dart format on
