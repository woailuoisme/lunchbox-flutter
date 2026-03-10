// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'welcome_gift_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WelcomeGiftRules {

@JsonKey(name: 'coupon_id') int? get couponId;
/// Create a copy of WelcomeGiftRules
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WelcomeGiftRulesCopyWith<WelcomeGiftRules> get copyWith => _$WelcomeGiftRulesCopyWithImpl<WelcomeGiftRules>(this as WelcomeGiftRules, _$identity);

  /// Serializes this WelcomeGiftRules to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeGiftRules&&(identical(other.couponId, couponId) || other.couponId == couponId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,couponId);

@override
String toString() {
  return 'WelcomeGiftRules(couponId: $couponId)';
}


}

/// @nodoc
abstract mixin class $WelcomeGiftRulesCopyWith<$Res>  {
  factory $WelcomeGiftRulesCopyWith(WelcomeGiftRules value, $Res Function(WelcomeGiftRules) _then) = _$WelcomeGiftRulesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'coupon_id') int? couponId
});




}
/// @nodoc
class _$WelcomeGiftRulesCopyWithImpl<$Res>
    implements $WelcomeGiftRulesCopyWith<$Res> {
  _$WelcomeGiftRulesCopyWithImpl(this._self, this._then);

  final WelcomeGiftRules _self;
  final $Res Function(WelcomeGiftRules) _then;

/// Create a copy of WelcomeGiftRules
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? couponId = freezed,}) {
  return _then(_self.copyWith(
couponId: freezed == couponId ? _self.couponId : couponId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [WelcomeGiftRules].
extension WelcomeGiftRulesPatterns on WelcomeGiftRules {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WelcomeGiftRules value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WelcomeGiftRules() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WelcomeGiftRules value)  $default,){
final _that = this;
switch (_that) {
case _WelcomeGiftRules():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WelcomeGiftRules value)?  $default,){
final _that = this;
switch (_that) {
case _WelcomeGiftRules() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'coupon_id')  int? couponId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WelcomeGiftRules() when $default != null:
return $default(_that.couponId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'coupon_id')  int? couponId)  $default,) {final _that = this;
switch (_that) {
case _WelcomeGiftRules():
return $default(_that.couponId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'coupon_id')  int? couponId)?  $default,) {final _that = this;
switch (_that) {
case _WelcomeGiftRules() when $default != null:
return $default(_that.couponId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WelcomeGiftRules implements WelcomeGiftRules {
  const _WelcomeGiftRules({@JsonKey(name: 'coupon_id') this.couponId});
  factory _WelcomeGiftRules.fromJson(Map<String, dynamic> json) => _$WelcomeGiftRulesFromJson(json);

@override@JsonKey(name: 'coupon_id') final  int? couponId;

/// Create a copy of WelcomeGiftRules
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WelcomeGiftRulesCopyWith<_WelcomeGiftRules> get copyWith => __$WelcomeGiftRulesCopyWithImpl<_WelcomeGiftRules>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WelcomeGiftRulesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WelcomeGiftRules&&(identical(other.couponId, couponId) || other.couponId == couponId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,couponId);

@override
String toString() {
  return 'WelcomeGiftRules(couponId: $couponId)';
}


}

/// @nodoc
abstract mixin class _$WelcomeGiftRulesCopyWith<$Res> implements $WelcomeGiftRulesCopyWith<$Res> {
  factory _$WelcomeGiftRulesCopyWith(_WelcomeGiftRules value, $Res Function(_WelcomeGiftRules) _then) = __$WelcomeGiftRulesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'coupon_id') int? couponId
});




}
/// @nodoc
class __$WelcomeGiftRulesCopyWithImpl<$Res>
    implements _$WelcomeGiftRulesCopyWith<$Res> {
  __$WelcomeGiftRulesCopyWithImpl(this._self, this._then);

  final _WelcomeGiftRules _self;
  final $Res Function(_WelcomeGiftRules) _then;

/// Create a copy of WelcomeGiftRules
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? couponId = freezed,}) {
  return _then(_WelcomeGiftRules(
couponId: freezed == couponId ? _self.couponId : couponId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$WelcomeGiftItemResponse {

/// ID
 int get id;/// 名称
 String get name;/// 类型
 String get type;/// 类型标签
@JsonKey(name: 'type_label') String get typeLabel;/// 规则
 WelcomeGiftRules get rules;/// 描述
 String get description;/// 排序
 int get order;/// 创建时间
@JsonKey(name: 'created_at') String get createdAt;/// 是否已领取
@JsonKey(name: 'is_claimed') bool get isClaimed;
/// Create a copy of WelcomeGiftItemResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WelcomeGiftItemResponseCopyWith<WelcomeGiftItemResponse> get copyWith => _$WelcomeGiftItemResponseCopyWithImpl<WelcomeGiftItemResponse>(this as WelcomeGiftItemResponse, _$identity);

  /// Serializes this WelcomeGiftItemResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeGiftItemResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeLabel, typeLabel) || other.typeLabel == typeLabel)&&(identical(other.rules, rules) || other.rules == rules)&&(identical(other.description, description) || other.description == description)&&(identical(other.order, order) || other.order == order)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isClaimed, isClaimed) || other.isClaimed == isClaimed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,typeLabel,rules,description,order,createdAt,isClaimed);

@override
String toString() {
  return 'WelcomeGiftItemResponse(id: $id, name: $name, type: $type, typeLabel: $typeLabel, rules: $rules, description: $description, order: $order, createdAt: $createdAt, isClaimed: $isClaimed)';
}


}

/// @nodoc
abstract mixin class $WelcomeGiftItemResponseCopyWith<$Res>  {
  factory $WelcomeGiftItemResponseCopyWith(WelcomeGiftItemResponse value, $Res Function(WelcomeGiftItemResponse) _then) = _$WelcomeGiftItemResponseCopyWithImpl;
@useResult
$Res call({
 int id, String name, String type,@JsonKey(name: 'type_label') String typeLabel, WelcomeGiftRules rules, String description, int order,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'is_claimed') bool isClaimed
});


$WelcomeGiftRulesCopyWith<$Res> get rules;

}
/// @nodoc
class _$WelcomeGiftItemResponseCopyWithImpl<$Res>
    implements $WelcomeGiftItemResponseCopyWith<$Res> {
  _$WelcomeGiftItemResponseCopyWithImpl(this._self, this._then);

  final WelcomeGiftItemResponse _self;
  final $Res Function(WelcomeGiftItemResponse) _then;

/// Create a copy of WelcomeGiftItemResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? typeLabel = null,Object? rules = null,Object? description = null,Object? order = null,Object? createdAt = null,Object? isClaimed = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,typeLabel: null == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as WelcomeGiftRules,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,isClaimed: null == isClaimed ? _self.isClaimed : isClaimed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of WelcomeGiftItemResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WelcomeGiftRulesCopyWith<$Res> get rules {
  
  return $WelcomeGiftRulesCopyWith<$Res>(_self.rules, (value) {
    return _then(_self.copyWith(rules: value));
  });
}
}


/// Adds pattern-matching-related methods to [WelcomeGiftItemResponse].
extension WelcomeGiftItemResponsePatterns on WelcomeGiftItemResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WelcomeGiftItemResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WelcomeGiftItemResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WelcomeGiftItemResponse value)  $default,){
final _that = this;
switch (_that) {
case _WelcomeGiftItemResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WelcomeGiftItemResponse value)?  $default,){
final _that = this;
switch (_that) {
case _WelcomeGiftItemResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String type, @JsonKey(name: 'type_label')  String typeLabel,  WelcomeGiftRules rules,  String description,  int order, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'is_claimed')  bool isClaimed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WelcomeGiftItemResponse() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.typeLabel,_that.rules,_that.description,_that.order,_that.createdAt,_that.isClaimed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String type, @JsonKey(name: 'type_label')  String typeLabel,  WelcomeGiftRules rules,  String description,  int order, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'is_claimed')  bool isClaimed)  $default,) {final _that = this;
switch (_that) {
case _WelcomeGiftItemResponse():
return $default(_that.id,_that.name,_that.type,_that.typeLabel,_that.rules,_that.description,_that.order,_that.createdAt,_that.isClaimed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String type, @JsonKey(name: 'type_label')  String typeLabel,  WelcomeGiftRules rules,  String description,  int order, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'is_claimed')  bool isClaimed)?  $default,) {final _that = this;
switch (_that) {
case _WelcomeGiftItemResponse() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.typeLabel,_that.rules,_that.description,_that.order,_that.createdAt,_that.isClaimed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WelcomeGiftItemResponse implements WelcomeGiftItemResponse {
  const _WelcomeGiftItemResponse({required this.id, required this.name, required this.type, @JsonKey(name: 'type_label') required this.typeLabel, required this.rules, required this.description, required this.order, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'is_claimed') this.isClaimed = false});
  factory _WelcomeGiftItemResponse.fromJson(Map<String, dynamic> json) => _$WelcomeGiftItemResponseFromJson(json);

/// ID
@override final  int id;
/// 名称
@override final  String name;
/// 类型
@override final  String type;
/// 类型标签
@override@JsonKey(name: 'type_label') final  String typeLabel;
/// 规则
@override final  WelcomeGiftRules rules;
/// 描述
@override final  String description;
/// 排序
@override final  int order;
/// 创建时间
@override@JsonKey(name: 'created_at') final  String createdAt;
/// 是否已领取
@override@JsonKey(name: 'is_claimed') final  bool isClaimed;

/// Create a copy of WelcomeGiftItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WelcomeGiftItemResponseCopyWith<_WelcomeGiftItemResponse> get copyWith => __$WelcomeGiftItemResponseCopyWithImpl<_WelcomeGiftItemResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WelcomeGiftItemResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WelcomeGiftItemResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeLabel, typeLabel) || other.typeLabel == typeLabel)&&(identical(other.rules, rules) || other.rules == rules)&&(identical(other.description, description) || other.description == description)&&(identical(other.order, order) || other.order == order)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isClaimed, isClaimed) || other.isClaimed == isClaimed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,typeLabel,rules,description,order,createdAt,isClaimed);

@override
String toString() {
  return 'WelcomeGiftItemResponse(id: $id, name: $name, type: $type, typeLabel: $typeLabel, rules: $rules, description: $description, order: $order, createdAt: $createdAt, isClaimed: $isClaimed)';
}


}

/// @nodoc
abstract mixin class _$WelcomeGiftItemResponseCopyWith<$Res> implements $WelcomeGiftItemResponseCopyWith<$Res> {
  factory _$WelcomeGiftItemResponseCopyWith(_WelcomeGiftItemResponse value, $Res Function(_WelcomeGiftItemResponse) _then) = __$WelcomeGiftItemResponseCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String type,@JsonKey(name: 'type_label') String typeLabel, WelcomeGiftRules rules, String description, int order,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'is_claimed') bool isClaimed
});


@override $WelcomeGiftRulesCopyWith<$Res> get rules;

}
/// @nodoc
class __$WelcomeGiftItemResponseCopyWithImpl<$Res>
    implements _$WelcomeGiftItemResponseCopyWith<$Res> {
  __$WelcomeGiftItemResponseCopyWithImpl(this._self, this._then);

  final _WelcomeGiftItemResponse _self;
  final $Res Function(_WelcomeGiftItemResponse) _then;

/// Create a copy of WelcomeGiftItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? typeLabel = null,Object? rules = null,Object? description = null,Object? order = null,Object? createdAt = null,Object? isClaimed = null,}) {
  return _then(_WelcomeGiftItemResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,typeLabel: null == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as WelcomeGiftRules,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,isClaimed: null == isClaimed ? _self.isClaimed : isClaimed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of WelcomeGiftItemResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WelcomeGiftRulesCopyWith<$Res> get rules {
  
  return $WelcomeGiftRulesCopyWith<$Res>(_self.rules, (value) {
    return _then(_self.copyWith(rules: value));
  });
}
}

// dart format on
