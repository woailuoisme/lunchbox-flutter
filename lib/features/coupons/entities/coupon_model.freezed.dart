// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CouponModel {

/// 优惠券ID
 int get id;/// 优惠券名称
 String get name;/// 优惠券描述
 String? get description;/// 优惠券类型 (full_reduction: 满减券, discount: 折扣券, reduction: 减免)
 String get type;/// 优惠规则
 CouponRuleModel get rule;/// 总数量
@JsonKey(name: 'total_quantity') int get totalQuantity;/// 已使用数量
@JsonKey(name: 'used_quantity') int get usedQuantity;/// 剩余数量
@JsonKey(name: 'remaining_quantity') int get remainingQuantity;/// 每人限领数量
@JsonKey(name: 'per_user_limit') int? get perUserLimit;/// 是否已激活
@JsonKey(name: 'is_activated') bool get isActivated;/// 开始时间
@JsonKey(name: 'start_at') String? get startAt;/// 结束时间
@JsonKey(name: 'end_at') String? get endAt;/// 创建时间
@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of CouponModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CouponModelCopyWith<CouponModel> get copyWith => _$CouponModelCopyWithImpl<CouponModel>(this as CouponModel, _$identity);

  /// Serializes this CouponModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.rule, rule) || other.rule == rule)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.usedQuantity, usedQuantity) || other.usedQuantity == usedQuantity)&&(identical(other.remainingQuantity, remainingQuantity) || other.remainingQuantity == remainingQuantity)&&(identical(other.perUserLimit, perUserLimit) || other.perUserLimit == perUserLimit)&&(identical(other.isActivated, isActivated) || other.isActivated == isActivated)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,type,rule,totalQuantity,usedQuantity,remainingQuantity,perUserLimit,isActivated,startAt,endAt,createdAt);

@override
String toString() {
  return 'CouponModel(id: $id, name: $name, description: $description, type: $type, rule: $rule, totalQuantity: $totalQuantity, usedQuantity: $usedQuantity, remainingQuantity: $remainingQuantity, perUserLimit: $perUserLimit, isActivated: $isActivated, startAt: $startAt, endAt: $endAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CouponModelCopyWith<$Res>  {
  factory $CouponModelCopyWith(CouponModel value, $Res Function(CouponModel) _then) = _$CouponModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? description, String type, CouponRuleModel rule,@JsonKey(name: 'total_quantity') int totalQuantity,@JsonKey(name: 'used_quantity') int usedQuantity,@JsonKey(name: 'remaining_quantity') int remainingQuantity,@JsonKey(name: 'per_user_limit') int? perUserLimit,@JsonKey(name: 'is_activated') bool isActivated,@JsonKey(name: 'start_at') String? startAt,@JsonKey(name: 'end_at') String? endAt,@JsonKey(name: 'created_at') String createdAt
});


$CouponRuleModelCopyWith<$Res> get rule;

}
/// @nodoc
class _$CouponModelCopyWithImpl<$Res>
    implements $CouponModelCopyWith<$Res> {
  _$CouponModelCopyWithImpl(this._self, this._then);

  final CouponModel _self;
  final $Res Function(CouponModel) _then;

/// Create a copy of CouponModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? type = null,Object? rule = null,Object? totalQuantity = null,Object? usedQuantity = null,Object? remainingQuantity = null,Object? perUserLimit = freezed,Object? isActivated = null,Object? startAt = freezed,Object? endAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,rule: null == rule ? _self.rule : rule // ignore: cast_nullable_to_non_nullable
as CouponRuleModel,totalQuantity: null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int,usedQuantity: null == usedQuantity ? _self.usedQuantity : usedQuantity // ignore: cast_nullable_to_non_nullable
as int,remainingQuantity: null == remainingQuantity ? _self.remainingQuantity : remainingQuantity // ignore: cast_nullable_to_non_nullable
as int,perUserLimit: freezed == perUserLimit ? _self.perUserLimit : perUserLimit // ignore: cast_nullable_to_non_nullable
as int?,isActivated: null == isActivated ? _self.isActivated : isActivated // ignore: cast_nullable_to_non_nullable
as bool,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of CouponModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CouponRuleModelCopyWith<$Res> get rule {
  
  return $CouponRuleModelCopyWith<$Res>(_self.rule, (value) {
    return _then(_self.copyWith(rule: value));
  });
}
}


/// Adds pattern-matching-related methods to [CouponModel].
extension CouponModelPatterns on CouponModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CouponModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CouponModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CouponModel value)  $default,){
final _that = this;
switch (_that) {
case _CouponModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CouponModel value)?  $default,){
final _that = this;
switch (_that) {
case _CouponModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? description,  String type,  CouponRuleModel rule, @JsonKey(name: 'total_quantity')  int totalQuantity, @JsonKey(name: 'used_quantity')  int usedQuantity, @JsonKey(name: 'remaining_quantity')  int remainingQuantity, @JsonKey(name: 'per_user_limit')  int? perUserLimit, @JsonKey(name: 'is_activated')  bool isActivated, @JsonKey(name: 'start_at')  String? startAt, @JsonKey(name: 'end_at')  String? endAt, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CouponModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.type,_that.rule,_that.totalQuantity,_that.usedQuantity,_that.remainingQuantity,_that.perUserLimit,_that.isActivated,_that.startAt,_that.endAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? description,  String type,  CouponRuleModel rule, @JsonKey(name: 'total_quantity')  int totalQuantity, @JsonKey(name: 'used_quantity')  int usedQuantity, @JsonKey(name: 'remaining_quantity')  int remainingQuantity, @JsonKey(name: 'per_user_limit')  int? perUserLimit, @JsonKey(name: 'is_activated')  bool isActivated, @JsonKey(name: 'start_at')  String? startAt, @JsonKey(name: 'end_at')  String? endAt, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _CouponModel():
return $default(_that.id,_that.name,_that.description,_that.type,_that.rule,_that.totalQuantity,_that.usedQuantity,_that.remainingQuantity,_that.perUserLimit,_that.isActivated,_that.startAt,_that.endAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? description,  String type,  CouponRuleModel rule, @JsonKey(name: 'total_quantity')  int totalQuantity, @JsonKey(name: 'used_quantity')  int usedQuantity, @JsonKey(name: 'remaining_quantity')  int remainingQuantity, @JsonKey(name: 'per_user_limit')  int? perUserLimit, @JsonKey(name: 'is_activated')  bool isActivated, @JsonKey(name: 'start_at')  String? startAt, @JsonKey(name: 'end_at')  String? endAt, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CouponModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.type,_that.rule,_that.totalQuantity,_that.usedQuantity,_that.remainingQuantity,_that.perUserLimit,_that.isActivated,_that.startAt,_that.endAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CouponModel implements CouponModel {
  const _CouponModel({required this.id, required this.name, this.description, required this.type, required this.rule, @JsonKey(name: 'total_quantity') required this.totalQuantity, @JsonKey(name: 'used_quantity') required this.usedQuantity, @JsonKey(name: 'remaining_quantity') required this.remainingQuantity, @JsonKey(name: 'per_user_limit') this.perUserLimit, @JsonKey(name: 'is_activated') this.isActivated = true, @JsonKey(name: 'start_at') this.startAt, @JsonKey(name: 'end_at') this.endAt, @JsonKey(name: 'created_at') required this.createdAt});
  factory _CouponModel.fromJson(Map<String, dynamic> json) => _$CouponModelFromJson(json);

/// 优惠券ID
@override final  int id;
/// 优惠券名称
@override final  String name;
/// 优惠券描述
@override final  String? description;
/// 优惠券类型 (full_reduction: 满减券, discount: 折扣券, reduction: 减免)
@override final  String type;
/// 优惠规则
@override final  CouponRuleModel rule;
/// 总数量
@override@JsonKey(name: 'total_quantity') final  int totalQuantity;
/// 已使用数量
@override@JsonKey(name: 'used_quantity') final  int usedQuantity;
/// 剩余数量
@override@JsonKey(name: 'remaining_quantity') final  int remainingQuantity;
/// 每人限领数量
@override@JsonKey(name: 'per_user_limit') final  int? perUserLimit;
/// 是否已激活
@override@JsonKey(name: 'is_activated') final  bool isActivated;
/// 开始时间
@override@JsonKey(name: 'start_at') final  String? startAt;
/// 结束时间
@override@JsonKey(name: 'end_at') final  String? endAt;
/// 创建时间
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of CouponModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CouponModelCopyWith<_CouponModel> get copyWith => __$CouponModelCopyWithImpl<_CouponModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CouponModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CouponModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.rule, rule) || other.rule == rule)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.usedQuantity, usedQuantity) || other.usedQuantity == usedQuantity)&&(identical(other.remainingQuantity, remainingQuantity) || other.remainingQuantity == remainingQuantity)&&(identical(other.perUserLimit, perUserLimit) || other.perUserLimit == perUserLimit)&&(identical(other.isActivated, isActivated) || other.isActivated == isActivated)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,type,rule,totalQuantity,usedQuantity,remainingQuantity,perUserLimit,isActivated,startAt,endAt,createdAt);

@override
String toString() {
  return 'CouponModel(id: $id, name: $name, description: $description, type: $type, rule: $rule, totalQuantity: $totalQuantity, usedQuantity: $usedQuantity, remainingQuantity: $remainingQuantity, perUserLimit: $perUserLimit, isActivated: $isActivated, startAt: $startAt, endAt: $endAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CouponModelCopyWith<$Res> implements $CouponModelCopyWith<$Res> {
  factory _$CouponModelCopyWith(_CouponModel value, $Res Function(_CouponModel) _then) = __$CouponModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? description, String type, CouponRuleModel rule,@JsonKey(name: 'total_quantity') int totalQuantity,@JsonKey(name: 'used_quantity') int usedQuantity,@JsonKey(name: 'remaining_quantity') int remainingQuantity,@JsonKey(name: 'per_user_limit') int? perUserLimit,@JsonKey(name: 'is_activated') bool isActivated,@JsonKey(name: 'start_at') String? startAt,@JsonKey(name: 'end_at') String? endAt,@JsonKey(name: 'created_at') String createdAt
});


@override $CouponRuleModelCopyWith<$Res> get rule;

}
/// @nodoc
class __$CouponModelCopyWithImpl<$Res>
    implements _$CouponModelCopyWith<$Res> {
  __$CouponModelCopyWithImpl(this._self, this._then);

  final _CouponModel _self;
  final $Res Function(_CouponModel) _then;

/// Create a copy of CouponModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? type = null,Object? rule = null,Object? totalQuantity = null,Object? usedQuantity = null,Object? remainingQuantity = null,Object? perUserLimit = freezed,Object? isActivated = null,Object? startAt = freezed,Object? endAt = freezed,Object? createdAt = null,}) {
  return _then(_CouponModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,rule: null == rule ? _self.rule : rule // ignore: cast_nullable_to_non_nullable
as CouponRuleModel,totalQuantity: null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int,usedQuantity: null == usedQuantity ? _self.usedQuantity : usedQuantity // ignore: cast_nullable_to_non_nullable
as int,remainingQuantity: null == remainingQuantity ? _self.remainingQuantity : remainingQuantity // ignore: cast_nullable_to_non_nullable
as int,perUserLimit: freezed == perUserLimit ? _self.perUserLimit : perUserLimit // ignore: cast_nullable_to_non_nullable
as int?,isActivated: null == isActivated ? _self.isActivated : isActivated // ignore: cast_nullable_to_non_nullable
as bool,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CouponModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CouponRuleModelCopyWith<$Res> get rule {
  
  return $CouponRuleModelCopyWith<$Res>(_self.rule, (value) {
    return _then(_self.copyWith(rule: value));
  });
}
}


/// @nodoc
mixin _$CouponRuleModel {

/// 减免金额
@JsonKey(name: 'reduce_amount') double? get reduceAmount;/// 折扣比例 (0-100)
@JsonKey(name: 'discount_rate') double? get discountRate;/// 最高折扣金额
@JsonKey(name: 'max_discount') double? get maxDiscount;/// 门槛金额 (min_amount 或 min_spend_amount)
@JsonKey(name: 'min_amount') double? get minAmount;/// 满减门槛金额 (兼容旧字段)
@JsonKey(name: 'min_spend_amount') double? get minSpendAmount;
/// Create a copy of CouponRuleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CouponRuleModelCopyWith<CouponRuleModel> get copyWith => _$CouponRuleModelCopyWithImpl<CouponRuleModel>(this as CouponRuleModel, _$identity);

  /// Serializes this CouponRuleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponRuleModel&&(identical(other.reduceAmount, reduceAmount) || other.reduceAmount == reduceAmount)&&(identical(other.discountRate, discountRate) || other.discountRate == discountRate)&&(identical(other.maxDiscount, maxDiscount) || other.maxDiscount == maxDiscount)&&(identical(other.minAmount, minAmount) || other.minAmount == minAmount)&&(identical(other.minSpendAmount, minSpendAmount) || other.minSpendAmount == minSpendAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reduceAmount,discountRate,maxDiscount,minAmount,minSpendAmount);

@override
String toString() {
  return 'CouponRuleModel(reduceAmount: $reduceAmount, discountRate: $discountRate, maxDiscount: $maxDiscount, minAmount: $minAmount, minSpendAmount: $minSpendAmount)';
}


}

/// @nodoc
abstract mixin class $CouponRuleModelCopyWith<$Res>  {
  factory $CouponRuleModelCopyWith(CouponRuleModel value, $Res Function(CouponRuleModel) _then) = _$CouponRuleModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'reduce_amount') double? reduceAmount,@JsonKey(name: 'discount_rate') double? discountRate,@JsonKey(name: 'max_discount') double? maxDiscount,@JsonKey(name: 'min_amount') double? minAmount,@JsonKey(name: 'min_spend_amount') double? minSpendAmount
});




}
/// @nodoc
class _$CouponRuleModelCopyWithImpl<$Res>
    implements $CouponRuleModelCopyWith<$Res> {
  _$CouponRuleModelCopyWithImpl(this._self, this._then);

  final CouponRuleModel _self;
  final $Res Function(CouponRuleModel) _then;

/// Create a copy of CouponRuleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reduceAmount = freezed,Object? discountRate = freezed,Object? maxDiscount = freezed,Object? minAmount = freezed,Object? minSpendAmount = freezed,}) {
  return _then(_self.copyWith(
reduceAmount: freezed == reduceAmount ? _self.reduceAmount : reduceAmount // ignore: cast_nullable_to_non_nullable
as double?,discountRate: freezed == discountRate ? _self.discountRate : discountRate // ignore: cast_nullable_to_non_nullable
as double?,maxDiscount: freezed == maxDiscount ? _self.maxDiscount : maxDiscount // ignore: cast_nullable_to_non_nullable
as double?,minAmount: freezed == minAmount ? _self.minAmount : minAmount // ignore: cast_nullable_to_non_nullable
as double?,minSpendAmount: freezed == minSpendAmount ? _self.minSpendAmount : minSpendAmount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [CouponRuleModel].
extension CouponRuleModelPatterns on CouponRuleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CouponRuleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CouponRuleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CouponRuleModel value)  $default,){
final _that = this;
switch (_that) {
case _CouponRuleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CouponRuleModel value)?  $default,){
final _that = this;
switch (_that) {
case _CouponRuleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'reduce_amount')  double? reduceAmount, @JsonKey(name: 'discount_rate')  double? discountRate, @JsonKey(name: 'max_discount')  double? maxDiscount, @JsonKey(name: 'min_amount')  double? minAmount, @JsonKey(name: 'min_spend_amount')  double? minSpendAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CouponRuleModel() when $default != null:
return $default(_that.reduceAmount,_that.discountRate,_that.maxDiscount,_that.minAmount,_that.minSpendAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'reduce_amount')  double? reduceAmount, @JsonKey(name: 'discount_rate')  double? discountRate, @JsonKey(name: 'max_discount')  double? maxDiscount, @JsonKey(name: 'min_amount')  double? minAmount, @JsonKey(name: 'min_spend_amount')  double? minSpendAmount)  $default,) {final _that = this;
switch (_that) {
case _CouponRuleModel():
return $default(_that.reduceAmount,_that.discountRate,_that.maxDiscount,_that.minAmount,_that.minSpendAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'reduce_amount')  double? reduceAmount, @JsonKey(name: 'discount_rate')  double? discountRate, @JsonKey(name: 'max_discount')  double? maxDiscount, @JsonKey(name: 'min_amount')  double? minAmount, @JsonKey(name: 'min_spend_amount')  double? minSpendAmount)?  $default,) {final _that = this;
switch (_that) {
case _CouponRuleModel() when $default != null:
return $default(_that.reduceAmount,_that.discountRate,_that.maxDiscount,_that.minAmount,_that.minSpendAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CouponRuleModel implements CouponRuleModel {
  const _CouponRuleModel({@JsonKey(name: 'reduce_amount') this.reduceAmount, @JsonKey(name: 'discount_rate') this.discountRate, @JsonKey(name: 'max_discount') this.maxDiscount, @JsonKey(name: 'min_amount') this.minAmount, @JsonKey(name: 'min_spend_amount') this.minSpendAmount});
  factory _CouponRuleModel.fromJson(Map<String, dynamic> json) => _$CouponRuleModelFromJson(json);

/// 减免金额
@override@JsonKey(name: 'reduce_amount') final  double? reduceAmount;
/// 折扣比例 (0-100)
@override@JsonKey(name: 'discount_rate') final  double? discountRate;
/// 最高折扣金额
@override@JsonKey(name: 'max_discount') final  double? maxDiscount;
/// 门槛金额 (min_amount 或 min_spend_amount)
@override@JsonKey(name: 'min_amount') final  double? minAmount;
/// 满减门槛金额 (兼容旧字段)
@override@JsonKey(name: 'min_spend_amount') final  double? minSpendAmount;

/// Create a copy of CouponRuleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CouponRuleModelCopyWith<_CouponRuleModel> get copyWith => __$CouponRuleModelCopyWithImpl<_CouponRuleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CouponRuleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CouponRuleModel&&(identical(other.reduceAmount, reduceAmount) || other.reduceAmount == reduceAmount)&&(identical(other.discountRate, discountRate) || other.discountRate == discountRate)&&(identical(other.maxDiscount, maxDiscount) || other.maxDiscount == maxDiscount)&&(identical(other.minAmount, minAmount) || other.minAmount == minAmount)&&(identical(other.minSpendAmount, minSpendAmount) || other.minSpendAmount == minSpendAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reduceAmount,discountRate,maxDiscount,minAmount,minSpendAmount);

@override
String toString() {
  return 'CouponRuleModel(reduceAmount: $reduceAmount, discountRate: $discountRate, maxDiscount: $maxDiscount, minAmount: $minAmount, minSpendAmount: $minSpendAmount)';
}


}

/// @nodoc
abstract mixin class _$CouponRuleModelCopyWith<$Res> implements $CouponRuleModelCopyWith<$Res> {
  factory _$CouponRuleModelCopyWith(_CouponRuleModel value, $Res Function(_CouponRuleModel) _then) = __$CouponRuleModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'reduce_amount') double? reduceAmount,@JsonKey(name: 'discount_rate') double? discountRate,@JsonKey(name: 'max_discount') double? maxDiscount,@JsonKey(name: 'min_amount') double? minAmount,@JsonKey(name: 'min_spend_amount') double? minSpendAmount
});




}
/// @nodoc
class __$CouponRuleModelCopyWithImpl<$Res>
    implements _$CouponRuleModelCopyWith<$Res> {
  __$CouponRuleModelCopyWithImpl(this._self, this._then);

  final _CouponRuleModel _self;
  final $Res Function(_CouponRuleModel) _then;

/// Create a copy of CouponRuleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reduceAmount = freezed,Object? discountRate = freezed,Object? maxDiscount = freezed,Object? minAmount = freezed,Object? minSpendAmount = freezed,}) {
  return _then(_CouponRuleModel(
reduceAmount: freezed == reduceAmount ? _self.reduceAmount : reduceAmount // ignore: cast_nullable_to_non_nullable
as double?,discountRate: freezed == discountRate ? _self.discountRate : discountRate // ignore: cast_nullable_to_non_nullable
as double?,maxDiscount: freezed == maxDiscount ? _self.maxDiscount : maxDiscount // ignore: cast_nullable_to_non_nullable
as double?,minAmount: freezed == minAmount ? _self.minAmount : minAmount // ignore: cast_nullable_to_non_nullable
as double?,minSpendAmount: freezed == minSpendAmount ? _self.minSpendAmount : minSpendAmount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
