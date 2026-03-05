// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_intent_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentIntentResponse {

/// Stripe 支付意向客户端密钥
@JsonKey(name: 'client_secret') String get clientSecret;/// Stripe 支付意向ID
@JsonKey(name: 'payment_intent_id') String get paymentIntentId;/// Stripe 客户ID
@JsonKey(name: 'customer_id') String get customerId;/// 支付金额
 double get amount;/// 订单ID
@JsonKey(name: 'order_id') int? get orderId;
/// Create a copy of PaymentIntentResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentIntentResponseCopyWith<PaymentIntentResponse> get copyWith => _$PaymentIntentResponseCopyWithImpl<PaymentIntentResponse>(this as PaymentIntentResponse, _$identity);

  /// Serializes this PaymentIntentResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentIntentResponse&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret)&&(identical(other.paymentIntentId, paymentIntentId) || other.paymentIntentId == paymentIntentId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientSecret,paymentIntentId,customerId,amount,orderId);

@override
String toString() {
  return 'PaymentIntentResponse(clientSecret: $clientSecret, paymentIntentId: $paymentIntentId, customerId: $customerId, amount: $amount, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class $PaymentIntentResponseCopyWith<$Res>  {
  factory $PaymentIntentResponseCopyWith(PaymentIntentResponse value, $Res Function(PaymentIntentResponse) _then) = _$PaymentIntentResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'client_secret') String clientSecret,@JsonKey(name: 'payment_intent_id') String paymentIntentId,@JsonKey(name: 'customer_id') String customerId, double amount,@JsonKey(name: 'order_id') int? orderId
});




}
/// @nodoc
class _$PaymentIntentResponseCopyWithImpl<$Res>
    implements $PaymentIntentResponseCopyWith<$Res> {
  _$PaymentIntentResponseCopyWithImpl(this._self, this._then);

  final PaymentIntentResponse _self;
  final $Res Function(PaymentIntentResponse) _then;

/// Create a copy of PaymentIntentResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientSecret = null,Object? paymentIntentId = null,Object? customerId = null,Object? amount = null,Object? orderId = freezed,}) {
  return _then(_self.copyWith(
clientSecret: null == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String,paymentIntentId: null == paymentIntentId ? _self.paymentIntentId : paymentIntentId // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentIntentResponse].
extension PaymentIntentResponsePatterns on PaymentIntentResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentIntentResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentIntentResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentIntentResponse value)  $default,){
final _that = this;
switch (_that) {
case _PaymentIntentResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentIntentResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentIntentResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'client_secret')  String clientSecret, @JsonKey(name: 'payment_intent_id')  String paymentIntentId, @JsonKey(name: 'customer_id')  String customerId,  double amount, @JsonKey(name: 'order_id')  int? orderId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentIntentResponse() when $default != null:
return $default(_that.clientSecret,_that.paymentIntentId,_that.customerId,_that.amount,_that.orderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'client_secret')  String clientSecret, @JsonKey(name: 'payment_intent_id')  String paymentIntentId, @JsonKey(name: 'customer_id')  String customerId,  double amount, @JsonKey(name: 'order_id')  int? orderId)  $default,) {final _that = this;
switch (_that) {
case _PaymentIntentResponse():
return $default(_that.clientSecret,_that.paymentIntentId,_that.customerId,_that.amount,_that.orderId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'client_secret')  String clientSecret, @JsonKey(name: 'payment_intent_id')  String paymentIntentId, @JsonKey(name: 'customer_id')  String customerId,  double amount, @JsonKey(name: 'order_id')  int? orderId)?  $default,) {final _that = this;
switch (_that) {
case _PaymentIntentResponse() when $default != null:
return $default(_that.clientSecret,_that.paymentIntentId,_that.customerId,_that.amount,_that.orderId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentIntentResponse implements PaymentIntentResponse {
  const _PaymentIntentResponse({@JsonKey(name: 'client_secret') required this.clientSecret, @JsonKey(name: 'payment_intent_id') required this.paymentIntentId, @JsonKey(name: 'customer_id') required this.customerId, required this.amount, @JsonKey(name: 'order_id') this.orderId});
  factory _PaymentIntentResponse.fromJson(Map<String, dynamic> json) => _$PaymentIntentResponseFromJson(json);

/// Stripe 支付意向客户端密钥
@override@JsonKey(name: 'client_secret') final  String clientSecret;
/// Stripe 支付意向ID
@override@JsonKey(name: 'payment_intent_id') final  String paymentIntentId;
/// Stripe 客户ID
@override@JsonKey(name: 'customer_id') final  String customerId;
/// 支付金额
@override final  double amount;
/// 订单ID
@override@JsonKey(name: 'order_id') final  int? orderId;

/// Create a copy of PaymentIntentResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentIntentResponseCopyWith<_PaymentIntentResponse> get copyWith => __$PaymentIntentResponseCopyWithImpl<_PaymentIntentResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentIntentResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentIntentResponse&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret)&&(identical(other.paymentIntentId, paymentIntentId) || other.paymentIntentId == paymentIntentId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientSecret,paymentIntentId,customerId,amount,orderId);

@override
String toString() {
  return 'PaymentIntentResponse(clientSecret: $clientSecret, paymentIntentId: $paymentIntentId, customerId: $customerId, amount: $amount, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$PaymentIntentResponseCopyWith<$Res> implements $PaymentIntentResponseCopyWith<$Res> {
  factory _$PaymentIntentResponseCopyWith(_PaymentIntentResponse value, $Res Function(_PaymentIntentResponse) _then) = __$PaymentIntentResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'client_secret') String clientSecret,@JsonKey(name: 'payment_intent_id') String paymentIntentId,@JsonKey(name: 'customer_id') String customerId, double amount,@JsonKey(name: 'order_id') int? orderId
});




}
/// @nodoc
class __$PaymentIntentResponseCopyWithImpl<$Res>
    implements _$PaymentIntentResponseCopyWith<$Res> {
  __$PaymentIntentResponseCopyWithImpl(this._self, this._then);

  final _PaymentIntentResponse _self;
  final $Res Function(_PaymentIntentResponse) _then;

/// Create a copy of PaymentIntentResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientSecret = null,Object? paymentIntentId = null,Object? customerId = null,Object? amount = null,Object? orderId = freezed,}) {
  return _then(_PaymentIntentResponse(
clientSecret: null == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String,paymentIntentId: null == paymentIntentId ? _self.paymentIntentId : paymentIntentId // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
