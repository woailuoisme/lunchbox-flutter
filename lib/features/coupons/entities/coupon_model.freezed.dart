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
 String get id;/// 优惠券名称
 String get name;/// 优惠券描述
 String get description;/// 优惠金额/折扣
 double get amount;/// 使用门槛（0表示无门槛）
 double get minSpend;/// 优惠券类型 (discount: 折扣, cash: 现金)
 String get type;/// 有效期开始时间
 DateTime get startTime;/// 有效期结束时间
 DateTime get endTime;/// 是否已领取
 bool get isReceived;/// 是否已使用
 bool get isUsed;
/// Create a copy of CouponModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CouponModelCopyWith<CouponModel> get copyWith => _$CouponModelCopyWithImpl<CouponModel>(this as CouponModel, _$identity);

  /// Serializes this CouponModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.minSpend, minSpend) || other.minSpend == minSpend)&&(identical(other.type, type) || other.type == type)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.isReceived, isReceived) || other.isReceived == isReceived)&&(identical(other.isUsed, isUsed) || other.isUsed == isUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,amount,minSpend,type,startTime,endTime,isReceived,isUsed);

@override
String toString() {
  return 'CouponModel(id: $id, name: $name, description: $description, amount: $amount, minSpend: $minSpend, type: $type, startTime: $startTime, endTime: $endTime, isReceived: $isReceived, isUsed: $isUsed)';
}


}

/// @nodoc
abstract mixin class $CouponModelCopyWith<$Res>  {
  factory $CouponModelCopyWith(CouponModel value, $Res Function(CouponModel) _then) = _$CouponModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, double amount, double minSpend, String type, DateTime startTime, DateTime endTime, bool isReceived, bool isUsed
});




}
/// @nodoc
class _$CouponModelCopyWithImpl<$Res>
    implements $CouponModelCopyWith<$Res> {
  _$CouponModelCopyWithImpl(this._self, this._then);

  final CouponModel _self;
  final $Res Function(CouponModel) _then;

/// Create a copy of CouponModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? amount = null,Object? minSpend = null,Object? type = null,Object? startTime = null,Object? endTime = null,Object? isReceived = null,Object? isUsed = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,minSpend: null == minSpend ? _self.minSpend : minSpend // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,isReceived: null == isReceived ? _self.isReceived : isReceived // ignore: cast_nullable_to_non_nullable
as bool,isUsed: null == isUsed ? _self.isUsed : isUsed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double amount,  double minSpend,  String type,  DateTime startTime,  DateTime endTime,  bool isReceived,  bool isUsed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CouponModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.amount,_that.minSpend,_that.type,_that.startTime,_that.endTime,_that.isReceived,_that.isUsed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double amount,  double minSpend,  String type,  DateTime startTime,  DateTime endTime,  bool isReceived,  bool isUsed)  $default,) {final _that = this;
switch (_that) {
case _CouponModel():
return $default(_that.id,_that.name,_that.description,_that.amount,_that.minSpend,_that.type,_that.startTime,_that.endTime,_that.isReceived,_that.isUsed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  double amount,  double minSpend,  String type,  DateTime startTime,  DateTime endTime,  bool isReceived,  bool isUsed)?  $default,) {final _that = this;
switch (_that) {
case _CouponModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.amount,_that.minSpend,_that.type,_that.startTime,_that.endTime,_that.isReceived,_that.isUsed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CouponModel implements CouponModel {
  const _CouponModel({required this.id, required this.name, required this.description, required this.amount, this.minSpend = 0, this.type = 'cash', required this.startTime, required this.endTime, this.isReceived = false, this.isUsed = false});
  factory _CouponModel.fromJson(Map<String, dynamic> json) => _$CouponModelFromJson(json);

/// 优惠券ID
@override final  String id;
/// 优惠券名称
@override final  String name;
/// 优惠券描述
@override final  String description;
/// 优惠金额/折扣
@override final  double amount;
/// 使用门槛（0表示无门槛）
@override@JsonKey() final  double minSpend;
/// 优惠券类型 (discount: 折扣, cash: 现金)
@override@JsonKey() final  String type;
/// 有效期开始时间
@override final  DateTime startTime;
/// 有效期结束时间
@override final  DateTime endTime;
/// 是否已领取
@override@JsonKey() final  bool isReceived;
/// 是否已使用
@override@JsonKey() final  bool isUsed;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CouponModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.minSpend, minSpend) || other.minSpend == minSpend)&&(identical(other.type, type) || other.type == type)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.isReceived, isReceived) || other.isReceived == isReceived)&&(identical(other.isUsed, isUsed) || other.isUsed == isUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,amount,minSpend,type,startTime,endTime,isReceived,isUsed);

@override
String toString() {
  return 'CouponModel(id: $id, name: $name, description: $description, amount: $amount, minSpend: $minSpend, type: $type, startTime: $startTime, endTime: $endTime, isReceived: $isReceived, isUsed: $isUsed)';
}


}

/// @nodoc
abstract mixin class _$CouponModelCopyWith<$Res> implements $CouponModelCopyWith<$Res> {
  factory _$CouponModelCopyWith(_CouponModel value, $Res Function(_CouponModel) _then) = __$CouponModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, double amount, double minSpend, String type, DateTime startTime, DateTime endTime, bool isReceived, bool isUsed
});




}
/// @nodoc
class __$CouponModelCopyWithImpl<$Res>
    implements _$CouponModelCopyWith<$Res> {
  __$CouponModelCopyWithImpl(this._self, this._then);

  final _CouponModel _self;
  final $Res Function(_CouponModel) _then;

/// Create a copy of CouponModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? amount = null,Object? minSpend = null,Object? type = null,Object? startTime = null,Object? endTime = null,Object? isReceived = null,Object? isUsed = null,}) {
  return _then(_CouponModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,minSpend: null == minSpend ? _self.minSpend : minSpend // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,isReceived: null == isReceived ? _self.isReceived : isReceived // ignore: cast_nullable_to_non_nullable
as bool,isUsed: null == isUsed ? _self.isUsed : isUsed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
