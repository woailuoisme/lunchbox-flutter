// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentRequestModel {

/// 支付金额
 double get amount;/// 支付方式 (wechat, alipay, etc.)
@JsonKey(name: 'payment_method') String get paymentMethod;/// 商品列表 (包含 product_id, quantity)
 List<Map<String, dynamic>> get items;/// 设备ID
@JsonKey(name: 'device_id') String? get deviceId;/// 优惠券ID
@JsonKey(name: 'coupon_id') String? get couponId;/// 备注
 String? get remark;
/// Create a copy of PaymentRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentRequestModelCopyWith<PaymentRequestModel> get copyWith => _$PaymentRequestModelCopyWithImpl<PaymentRequestModel>(this as PaymentRequestModel, _$identity);

  /// Serializes this PaymentRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentRequestModel&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.couponId, couponId) || other.couponId == couponId)&&(identical(other.remark, remark) || other.remark == remark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,paymentMethod,const DeepCollectionEquality().hash(items),deviceId,couponId,remark);

@override
String toString() {
  return 'PaymentRequestModel(amount: $amount, paymentMethod: $paymentMethod, items: $items, deviceId: $deviceId, couponId: $couponId, remark: $remark)';
}


}

/// @nodoc
abstract mixin class $PaymentRequestModelCopyWith<$Res>  {
  factory $PaymentRequestModelCopyWith(PaymentRequestModel value, $Res Function(PaymentRequestModel) _then) = _$PaymentRequestModelCopyWithImpl;
@useResult
$Res call({
 double amount,@JsonKey(name: 'payment_method') String paymentMethod, List<Map<String, dynamic>> items,@JsonKey(name: 'device_id') String? deviceId,@JsonKey(name: 'coupon_id') String? couponId, String? remark
});




}
/// @nodoc
class _$PaymentRequestModelCopyWithImpl<$Res>
    implements $PaymentRequestModelCopyWith<$Res> {
  _$PaymentRequestModelCopyWithImpl(this._self, this._then);

  final PaymentRequestModel _self;
  final $Res Function(PaymentRequestModel) _then;

/// Create a copy of PaymentRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? paymentMethod = null,Object? items = null,Object? deviceId = freezed,Object? couponId = freezed,Object? remark = freezed,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,couponId: freezed == couponId ? _self.couponId : couponId // ignore: cast_nullable_to_non_nullable
as String?,remark: freezed == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentRequestModel].
extension PaymentRequestModelPatterns on PaymentRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount, @JsonKey(name: 'payment_method')  String paymentMethod,  List<Map<String, dynamic>> items, @JsonKey(name: 'device_id')  String? deviceId, @JsonKey(name: 'coupon_id')  String? couponId,  String? remark)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentRequestModel() when $default != null:
return $default(_that.amount,_that.paymentMethod,_that.items,_that.deviceId,_that.couponId,_that.remark);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount, @JsonKey(name: 'payment_method')  String paymentMethod,  List<Map<String, dynamic>> items, @JsonKey(name: 'device_id')  String? deviceId, @JsonKey(name: 'coupon_id')  String? couponId,  String? remark)  $default,) {final _that = this;
switch (_that) {
case _PaymentRequestModel():
return $default(_that.amount,_that.paymentMethod,_that.items,_that.deviceId,_that.couponId,_that.remark);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount, @JsonKey(name: 'payment_method')  String paymentMethod,  List<Map<String, dynamic>> items, @JsonKey(name: 'device_id')  String? deviceId, @JsonKey(name: 'coupon_id')  String? couponId,  String? remark)?  $default,) {final _that = this;
switch (_that) {
case _PaymentRequestModel() when $default != null:
return $default(_that.amount,_that.paymentMethod,_that.items,_that.deviceId,_that.couponId,_that.remark);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentRequestModel implements PaymentRequestModel {
  const _PaymentRequestModel({required this.amount, @JsonKey(name: 'payment_method') required this.paymentMethod, required final  List<Map<String, dynamic>> items, @JsonKey(name: 'device_id') this.deviceId, @JsonKey(name: 'coupon_id') this.couponId, this.remark}): _items = items;
  factory _PaymentRequestModel.fromJson(Map<String, dynamic> json) => _$PaymentRequestModelFromJson(json);

/// 支付金额
@override final  double amount;
/// 支付方式 (wechat, alipay, etc.)
@override@JsonKey(name: 'payment_method') final  String paymentMethod;
/// 商品列表 (包含 product_id, quantity)
 final  List<Map<String, dynamic>> _items;
/// 商品列表 (包含 product_id, quantity)
@override List<Map<String, dynamic>> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

/// 设备ID
@override@JsonKey(name: 'device_id') final  String? deviceId;
/// 优惠券ID
@override@JsonKey(name: 'coupon_id') final  String? couponId;
/// 备注
@override final  String? remark;

/// Create a copy of PaymentRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentRequestModelCopyWith<_PaymentRequestModel> get copyWith => __$PaymentRequestModelCopyWithImpl<_PaymentRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentRequestModel&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.couponId, couponId) || other.couponId == couponId)&&(identical(other.remark, remark) || other.remark == remark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,paymentMethod,const DeepCollectionEquality().hash(_items),deviceId,couponId,remark);

@override
String toString() {
  return 'PaymentRequestModel(amount: $amount, paymentMethod: $paymentMethod, items: $items, deviceId: $deviceId, couponId: $couponId, remark: $remark)';
}


}

/// @nodoc
abstract mixin class _$PaymentRequestModelCopyWith<$Res> implements $PaymentRequestModelCopyWith<$Res> {
  factory _$PaymentRequestModelCopyWith(_PaymentRequestModel value, $Res Function(_PaymentRequestModel) _then) = __$PaymentRequestModelCopyWithImpl;
@override @useResult
$Res call({
 double amount,@JsonKey(name: 'payment_method') String paymentMethod, List<Map<String, dynamic>> items,@JsonKey(name: 'device_id') String? deviceId,@JsonKey(name: 'coupon_id') String? couponId, String? remark
});




}
/// @nodoc
class __$PaymentRequestModelCopyWithImpl<$Res>
    implements _$PaymentRequestModelCopyWith<$Res> {
  __$PaymentRequestModelCopyWithImpl(this._self, this._then);

  final _PaymentRequestModel _self;
  final $Res Function(_PaymentRequestModel) _then;

/// Create a copy of PaymentRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? paymentMethod = null,Object? items = null,Object? deviceId = freezed,Object? couponId = freezed,Object? remark = freezed,}) {
  return _then(_PaymentRequestModel(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,couponId: freezed == couponId ? _self.couponId : couponId // ignore: cast_nullable_to_non_nullable
as String?,remark: freezed == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
