// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_coupon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserCouponModel {

/// 用户优惠券关联ID
@JsonKey(name: 'user_coupon_id') int get userCouponId;/// 优惠券基础ID
@JsonKey(name: 'coupon_id') int get couponId;/// 使用时间
@JsonKey(name: 'used_at') String? get usedAt;/// 是否已使用
@JsonKey(name: 'is_used') bool get isUsed;/// 优惠券名称
 String get name;/// 优惠券描述
 String? get description;/// 优惠券分类 (shop: 商城, goods: 食品)
 String get category;/// 优惠券类型 (full_reduction, discount, exchange, gift, reduction)
 String get type;/// 优惠规则
 CouponRuleModel get rule;/// 开始时间
@JsonKey(name: 'start_at') String? get startAt;/// 结束时间
@JsonKey(name: 'end_at') String? get endAt;
/// Create a copy of UserCouponModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCouponModelCopyWith<UserCouponModel> get copyWith => _$UserCouponModelCopyWithImpl<UserCouponModel>(this as UserCouponModel, _$identity);

  /// Serializes this UserCouponModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCouponModel&&(identical(other.userCouponId, userCouponId) || other.userCouponId == userCouponId)&&(identical(other.couponId, couponId) || other.couponId == couponId)&&(identical(other.usedAt, usedAt) || other.usedAt == usedAt)&&(identical(other.isUsed, isUsed) || other.isUsed == isUsed)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.type, type) || other.type == type)&&(identical(other.rule, rule) || other.rule == rule)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userCouponId,couponId,usedAt,isUsed,name,description,category,type,rule,startAt,endAt);

@override
String toString() {
  return 'UserCouponModel(userCouponId: $userCouponId, couponId: $couponId, usedAt: $usedAt, isUsed: $isUsed, name: $name, description: $description, category: $category, type: $type, rule: $rule, startAt: $startAt, endAt: $endAt)';
}


}

/// @nodoc
abstract mixin class $UserCouponModelCopyWith<$Res>  {
  factory $UserCouponModelCopyWith(UserCouponModel value, $Res Function(UserCouponModel) _then) = _$UserCouponModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_coupon_id') int userCouponId,@JsonKey(name: 'coupon_id') int couponId,@JsonKey(name: 'used_at') String? usedAt,@JsonKey(name: 'is_used') bool isUsed, String name, String? description, String category, String type, CouponRuleModel rule,@JsonKey(name: 'start_at') String? startAt,@JsonKey(name: 'end_at') String? endAt
});


$CouponRuleModelCopyWith<$Res> get rule;

}
/// @nodoc
class _$UserCouponModelCopyWithImpl<$Res>
    implements $UserCouponModelCopyWith<$Res> {
  _$UserCouponModelCopyWithImpl(this._self, this._then);

  final UserCouponModel _self;
  final $Res Function(UserCouponModel) _then;

/// Create a copy of UserCouponModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userCouponId = null,Object? couponId = null,Object? usedAt = freezed,Object? isUsed = null,Object? name = null,Object? description = freezed,Object? category = null,Object? type = null,Object? rule = null,Object? startAt = freezed,Object? endAt = freezed,}) {
  return _then(_self.copyWith(
userCouponId: null == userCouponId ? _self.userCouponId : userCouponId // ignore: cast_nullable_to_non_nullable
as int,couponId: null == couponId ? _self.couponId : couponId // ignore: cast_nullable_to_non_nullable
as int,usedAt: freezed == usedAt ? _self.usedAt : usedAt // ignore: cast_nullable_to_non_nullable
as String?,isUsed: null == isUsed ? _self.isUsed : isUsed // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,rule: null == rule ? _self.rule : rule // ignore: cast_nullable_to_non_nullable
as CouponRuleModel,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of UserCouponModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CouponRuleModelCopyWith<$Res> get rule {
  
  return $CouponRuleModelCopyWith<$Res>(_self.rule, (value) {
    return _then(_self.copyWith(rule: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserCouponModel].
extension UserCouponModelPatterns on UserCouponModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserCouponModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserCouponModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserCouponModel value)  $default,){
final _that = this;
switch (_that) {
case _UserCouponModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserCouponModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserCouponModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_coupon_id')  int userCouponId, @JsonKey(name: 'coupon_id')  int couponId, @JsonKey(name: 'used_at')  String? usedAt, @JsonKey(name: 'is_used')  bool isUsed,  String name,  String? description,  String category,  String type,  CouponRuleModel rule, @JsonKey(name: 'start_at')  String? startAt, @JsonKey(name: 'end_at')  String? endAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserCouponModel() when $default != null:
return $default(_that.userCouponId,_that.couponId,_that.usedAt,_that.isUsed,_that.name,_that.description,_that.category,_that.type,_that.rule,_that.startAt,_that.endAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_coupon_id')  int userCouponId, @JsonKey(name: 'coupon_id')  int couponId, @JsonKey(name: 'used_at')  String? usedAt, @JsonKey(name: 'is_used')  bool isUsed,  String name,  String? description,  String category,  String type,  CouponRuleModel rule, @JsonKey(name: 'start_at')  String? startAt, @JsonKey(name: 'end_at')  String? endAt)  $default,) {final _that = this;
switch (_that) {
case _UserCouponModel():
return $default(_that.userCouponId,_that.couponId,_that.usedAt,_that.isUsed,_that.name,_that.description,_that.category,_that.type,_that.rule,_that.startAt,_that.endAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_coupon_id')  int userCouponId, @JsonKey(name: 'coupon_id')  int couponId, @JsonKey(name: 'used_at')  String? usedAt, @JsonKey(name: 'is_used')  bool isUsed,  String name,  String? description,  String category,  String type,  CouponRuleModel rule, @JsonKey(name: 'start_at')  String? startAt, @JsonKey(name: 'end_at')  String? endAt)?  $default,) {final _that = this;
switch (_that) {
case _UserCouponModel() when $default != null:
return $default(_that.userCouponId,_that.couponId,_that.usedAt,_that.isUsed,_that.name,_that.description,_that.category,_that.type,_that.rule,_that.startAt,_that.endAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserCouponModel implements UserCouponModel {
  const _UserCouponModel({@JsonKey(name: 'user_coupon_id') required this.userCouponId, @JsonKey(name: 'coupon_id') required this.couponId, @JsonKey(name: 'used_at') this.usedAt = null, @JsonKey(name: 'is_used') this.isUsed = false, this.name = '', this.description = null, this.category = 'shop', this.type = 'reduction', this.rule = const CouponRuleModel(), @JsonKey(name: 'start_at') this.startAt = null, @JsonKey(name: 'end_at') this.endAt = null});
  factory _UserCouponModel.fromJson(Map<String, dynamic> json) => _$UserCouponModelFromJson(json);

/// 用户优惠券关联ID
@override@JsonKey(name: 'user_coupon_id') final  int userCouponId;
/// 优惠券基础ID
@override@JsonKey(name: 'coupon_id') final  int couponId;
/// 使用时间
@override@JsonKey(name: 'used_at') final  String? usedAt;
/// 是否已使用
@override@JsonKey(name: 'is_used') final  bool isUsed;
/// 优惠券名称
@override@JsonKey() final  String name;
/// 优惠券描述
@override@JsonKey() final  String? description;
/// 优惠券分类 (shop: 商城, goods: 食品)
@override@JsonKey() final  String category;
/// 优惠券类型 (full_reduction, discount, exchange, gift, reduction)
@override@JsonKey() final  String type;
/// 优惠规则
@override@JsonKey() final  CouponRuleModel rule;
/// 开始时间
@override@JsonKey(name: 'start_at') final  String? startAt;
/// 结束时间
@override@JsonKey(name: 'end_at') final  String? endAt;

/// Create a copy of UserCouponModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCouponModelCopyWith<_UserCouponModel> get copyWith => __$UserCouponModelCopyWithImpl<_UserCouponModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserCouponModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserCouponModel&&(identical(other.userCouponId, userCouponId) || other.userCouponId == userCouponId)&&(identical(other.couponId, couponId) || other.couponId == couponId)&&(identical(other.usedAt, usedAt) || other.usedAt == usedAt)&&(identical(other.isUsed, isUsed) || other.isUsed == isUsed)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.type, type) || other.type == type)&&(identical(other.rule, rule) || other.rule == rule)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userCouponId,couponId,usedAt,isUsed,name,description,category,type,rule,startAt,endAt);

@override
String toString() {
  return 'UserCouponModel(userCouponId: $userCouponId, couponId: $couponId, usedAt: $usedAt, isUsed: $isUsed, name: $name, description: $description, category: $category, type: $type, rule: $rule, startAt: $startAt, endAt: $endAt)';
}


}

/// @nodoc
abstract mixin class _$UserCouponModelCopyWith<$Res> implements $UserCouponModelCopyWith<$Res> {
  factory _$UserCouponModelCopyWith(_UserCouponModel value, $Res Function(_UserCouponModel) _then) = __$UserCouponModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_coupon_id') int userCouponId,@JsonKey(name: 'coupon_id') int couponId,@JsonKey(name: 'used_at') String? usedAt,@JsonKey(name: 'is_used') bool isUsed, String name, String? description, String category, String type, CouponRuleModel rule,@JsonKey(name: 'start_at') String? startAt,@JsonKey(name: 'end_at') String? endAt
});


@override $CouponRuleModelCopyWith<$Res> get rule;

}
/// @nodoc
class __$UserCouponModelCopyWithImpl<$Res>
    implements _$UserCouponModelCopyWith<$Res> {
  __$UserCouponModelCopyWithImpl(this._self, this._then);

  final _UserCouponModel _self;
  final $Res Function(_UserCouponModel) _then;

/// Create a copy of UserCouponModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userCouponId = null,Object? couponId = null,Object? usedAt = freezed,Object? isUsed = null,Object? name = null,Object? description = freezed,Object? category = null,Object? type = null,Object? rule = null,Object? startAt = freezed,Object? endAt = freezed,}) {
  return _then(_UserCouponModel(
userCouponId: null == userCouponId ? _self.userCouponId : userCouponId // ignore: cast_nullable_to_non_nullable
as int,couponId: null == couponId ? _self.couponId : couponId // ignore: cast_nullable_to_non_nullable
as int,usedAt: freezed == usedAt ? _self.usedAt : usedAt // ignore: cast_nullable_to_non_nullable
as String?,isUsed: null == isUsed ? _self.isUsed : isUsed // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,rule: null == rule ? _self.rule : rule // ignore: cast_nullable_to_non_nullable
as CouponRuleModel,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of UserCouponModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CouponRuleModelCopyWith<$Res> get rule {
  
  return $CouponRuleModelCopyWith<$Res>(_self.rule, (value) {
    return _then(_self.copyWith(rule: value));
  });
}
}

// dart format on
