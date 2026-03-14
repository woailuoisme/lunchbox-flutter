// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentRequest {

/// 支付金额
 double get amount;/// 支付方式 (balance:余额支付, wechat:微信支付)
@JsonKey(name: 'pay_type') PaymentPayType get payType;/// 产品列表
@JsonKey(name: 'product_list') List<PaymentProductItem> get productList;/// 用户优惠券ID
@JsonKey(name: 'user_coupon_id') int? get userCouponId;/// 订单描述
 String? get description;
/// Create a copy of PaymentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentRequestCopyWith<PaymentRequest> get copyWith => _$PaymentRequestCopyWithImpl<PaymentRequest>(this as PaymentRequest, _$identity);

  /// Serializes this PaymentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentRequest&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.payType, payType) || other.payType == payType)&&const DeepCollectionEquality().equals(other.productList, productList)&&(identical(other.userCouponId, userCouponId) || other.userCouponId == userCouponId)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,payType,const DeepCollectionEquality().hash(productList),userCouponId,description);

@override
String toString() {
  return 'PaymentRequest(amount: $amount, payType: $payType, productList: $productList, userCouponId: $userCouponId, description: $description)';
}


}

/// @nodoc
abstract mixin class $PaymentRequestCopyWith<$Res>  {
  factory $PaymentRequestCopyWith(PaymentRequest value, $Res Function(PaymentRequest) _then) = _$PaymentRequestCopyWithImpl;
@useResult
$Res call({
 double amount,@JsonKey(name: 'pay_type') PaymentPayType payType,@JsonKey(name: 'product_list') List<PaymentProductItem> productList,@JsonKey(name: 'user_coupon_id') int? userCouponId, String? description
});




}
/// @nodoc
class _$PaymentRequestCopyWithImpl<$Res>
    implements $PaymentRequestCopyWith<$Res> {
  _$PaymentRequestCopyWithImpl(this._self, this._then);

  final PaymentRequest _self;
  final $Res Function(PaymentRequest) _then;

/// Create a copy of PaymentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? payType = null,Object? productList = null,Object? userCouponId = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,payType: null == payType ? _self.payType : payType // ignore: cast_nullable_to_non_nullable
as PaymentPayType,productList: null == productList ? _self.productList : productList // ignore: cast_nullable_to_non_nullable
as List<PaymentProductItem>,userCouponId: freezed == userCouponId ? _self.userCouponId : userCouponId // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentRequest].
extension PaymentRequestPatterns on PaymentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentRequest value)  $default,){
final _that = this;
switch (_that) {
case _PaymentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount, @JsonKey(name: 'pay_type')  PaymentPayType payType, @JsonKey(name: 'product_list')  List<PaymentProductItem> productList, @JsonKey(name: 'user_coupon_id')  int? userCouponId,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentRequest() when $default != null:
return $default(_that.amount,_that.payType,_that.productList,_that.userCouponId,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount, @JsonKey(name: 'pay_type')  PaymentPayType payType, @JsonKey(name: 'product_list')  List<PaymentProductItem> productList, @JsonKey(name: 'user_coupon_id')  int? userCouponId,  String? description)  $default,) {final _that = this;
switch (_that) {
case _PaymentRequest():
return $default(_that.amount,_that.payType,_that.productList,_that.userCouponId,_that.description);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount, @JsonKey(name: 'pay_type')  PaymentPayType payType, @JsonKey(name: 'product_list')  List<PaymentProductItem> productList, @JsonKey(name: 'user_coupon_id')  int? userCouponId,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _PaymentRequest() when $default != null:
return $default(_that.amount,_that.payType,_that.productList,_that.userCouponId,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentRequest implements PaymentRequest {
  const _PaymentRequest({required this.amount, @JsonKey(name: 'pay_type') required this.payType, @JsonKey(name: 'product_list') required final  List<PaymentProductItem> productList, @JsonKey(name: 'user_coupon_id') this.userCouponId, this.description}): _productList = productList;
  factory _PaymentRequest.fromJson(Map<String, dynamic> json) => _$PaymentRequestFromJson(json);

/// 支付金额
@override final  double amount;
/// 支付方式 (balance:余额支付, wechat:微信支付)
@override@JsonKey(name: 'pay_type') final  PaymentPayType payType;
/// 产品列表
 final  List<PaymentProductItem> _productList;
/// 产品列表
@override@JsonKey(name: 'product_list') List<PaymentProductItem> get productList {
  if (_productList is EqualUnmodifiableListView) return _productList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productList);
}

/// 用户优惠券ID
@override@JsonKey(name: 'user_coupon_id') final  int? userCouponId;
/// 订单描述
@override final  String? description;

/// Create a copy of PaymentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentRequestCopyWith<_PaymentRequest> get copyWith => __$PaymentRequestCopyWithImpl<_PaymentRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentRequest&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.payType, payType) || other.payType == payType)&&const DeepCollectionEquality().equals(other._productList, _productList)&&(identical(other.userCouponId, userCouponId) || other.userCouponId == userCouponId)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,payType,const DeepCollectionEquality().hash(_productList),userCouponId,description);

@override
String toString() {
  return 'PaymentRequest(amount: $amount, payType: $payType, productList: $productList, userCouponId: $userCouponId, description: $description)';
}


}

/// @nodoc
abstract mixin class _$PaymentRequestCopyWith<$Res> implements $PaymentRequestCopyWith<$Res> {
  factory _$PaymentRequestCopyWith(_PaymentRequest value, $Res Function(_PaymentRequest) _then) = __$PaymentRequestCopyWithImpl;
@override @useResult
$Res call({
 double amount,@JsonKey(name: 'pay_type') PaymentPayType payType,@JsonKey(name: 'product_list') List<PaymentProductItem> productList,@JsonKey(name: 'user_coupon_id') int? userCouponId, String? description
});




}
/// @nodoc
class __$PaymentRequestCopyWithImpl<$Res>
    implements _$PaymentRequestCopyWith<$Res> {
  __$PaymentRequestCopyWithImpl(this._self, this._then);

  final _PaymentRequest _self;
  final $Res Function(_PaymentRequest) _then;

/// Create a copy of PaymentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? payType = null,Object? productList = null,Object? userCouponId = freezed,Object? description = freezed,}) {
  return _then(_PaymentRequest(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,payType: null == payType ? _self.payType : payType // ignore: cast_nullable_to_non_nullable
as PaymentPayType,productList: null == productList ? _self._productList : productList // ignore: cast_nullable_to_non_nullable
as List<PaymentProductItem>,userCouponId: freezed == userCouponId ? _self.userCouponId : userCouponId // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PaymentProductItem {

/// 设备ID
@JsonKey(name: 'device_id') int get deviceId;/// 产品ID
@JsonKey(name: 'product_id') int get productId;/// 数量
 int get quantity;
/// Create a copy of PaymentProductItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentProductItemCopyWith<PaymentProductItem> get copyWith => _$PaymentProductItemCopyWithImpl<PaymentProductItem>(this as PaymentProductItem, _$identity);

  /// Serializes this PaymentProductItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentProductItem&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId,productId,quantity);

@override
String toString() {
  return 'PaymentProductItem(deviceId: $deviceId, productId: $productId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $PaymentProductItemCopyWith<$Res>  {
  factory $PaymentProductItemCopyWith(PaymentProductItem value, $Res Function(PaymentProductItem) _then) = _$PaymentProductItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'device_id') int deviceId,@JsonKey(name: 'product_id') int productId, int quantity
});




}
/// @nodoc
class _$PaymentProductItemCopyWithImpl<$Res>
    implements $PaymentProductItemCopyWith<$Res> {
  _$PaymentProductItemCopyWithImpl(this._self, this._then);

  final PaymentProductItem _self;
  final $Res Function(PaymentProductItem) _then;

/// Create a copy of PaymentProductItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,Object? productId = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentProductItem].
extension PaymentProductItemPatterns on PaymentProductItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentProductItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentProductItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentProductItem value)  $default,){
final _that = this;
switch (_that) {
case _PaymentProductItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentProductItem value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentProductItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'device_id')  int deviceId, @JsonKey(name: 'product_id')  int productId,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentProductItem() when $default != null:
return $default(_that.deviceId,_that.productId,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'device_id')  int deviceId, @JsonKey(name: 'product_id')  int productId,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _PaymentProductItem():
return $default(_that.deviceId,_that.productId,_that.quantity);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'device_id')  int deviceId, @JsonKey(name: 'product_id')  int productId,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _PaymentProductItem() when $default != null:
return $default(_that.deviceId,_that.productId,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentProductItem implements PaymentProductItem {
  const _PaymentProductItem({@JsonKey(name: 'device_id') required this.deviceId, @JsonKey(name: 'product_id') required this.productId, required this.quantity});
  factory _PaymentProductItem.fromJson(Map<String, dynamic> json) => _$PaymentProductItemFromJson(json);

/// 设备ID
@override@JsonKey(name: 'device_id') final  int deviceId;
/// 产品ID
@override@JsonKey(name: 'product_id') final  int productId;
/// 数量
@override final  int quantity;

/// Create a copy of PaymentProductItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentProductItemCopyWith<_PaymentProductItem> get copyWith => __$PaymentProductItemCopyWithImpl<_PaymentProductItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentProductItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentProductItem&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId,productId,quantity);

@override
String toString() {
  return 'PaymentProductItem(deviceId: $deviceId, productId: $productId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$PaymentProductItemCopyWith<$Res> implements $PaymentProductItemCopyWith<$Res> {
  factory _$PaymentProductItemCopyWith(_PaymentProductItem value, $Res Function(_PaymentProductItem) _then) = __$PaymentProductItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'device_id') int deviceId,@JsonKey(name: 'product_id') int productId, int quantity
});




}
/// @nodoc
class __$PaymentProductItemCopyWithImpl<$Res>
    implements _$PaymentProductItemCopyWith<$Res> {
  __$PaymentProductItemCopyWithImpl(this._self, this._then);

  final _PaymentProductItem _self;
  final $Res Function(_PaymentProductItem) _then;

/// Create a copy of PaymentProductItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,Object? productId = null,Object? quantity = null,}) {
  return _then(_PaymentProductItem(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
