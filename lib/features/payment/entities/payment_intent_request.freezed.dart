// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_intent_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentIntentRequest {

/// 订单ID
@JsonKey(name: 'order_id') int? get orderId;/// 支付金额（如 10.50），当不提供 order_id 时必填
 double? get amount;/// 货币代码 (ISO 3字母)
 String get currency;
/// Create a copy of PaymentIntentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentIntentRequestCopyWith<PaymentIntentRequest> get copyWith => _$PaymentIntentRequestCopyWithImpl<PaymentIntentRequest>(this as PaymentIntentRequest, _$identity);

  /// Serializes this PaymentIntentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentIntentRequest&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,amount,currency);

@override
String toString() {
  return 'PaymentIntentRequest(orderId: $orderId, amount: $amount, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $PaymentIntentRequestCopyWith<$Res>  {
  factory $PaymentIntentRequestCopyWith(PaymentIntentRequest value, $Res Function(PaymentIntentRequest) _then) = _$PaymentIntentRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'order_id') int? orderId, double? amount, String currency
});




}
/// @nodoc
class _$PaymentIntentRequestCopyWithImpl<$Res>
    implements $PaymentIntentRequestCopyWith<$Res> {
  _$PaymentIntentRequestCopyWithImpl(this._self, this._then);

  final PaymentIntentRequest _self;
  final $Res Function(PaymentIntentRequest) _then;

/// Create a copy of PaymentIntentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = freezed,Object? amount = freezed,Object? currency = null,}) {
  return _then(_self.copyWith(
orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentIntentRequest].
extension PaymentIntentRequestPatterns on PaymentIntentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentIntentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentIntentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentIntentRequest value)  $default,){
final _that = this;
switch (_that) {
case _PaymentIntentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentIntentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentIntentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'order_id')  int? orderId,  double? amount,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentIntentRequest() when $default != null:
return $default(_that.orderId,_that.amount,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'order_id')  int? orderId,  double? amount,  String currency)  $default,) {final _that = this;
switch (_that) {
case _PaymentIntentRequest():
return $default(_that.orderId,_that.amount,_that.currency);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'order_id')  int? orderId,  double? amount,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _PaymentIntentRequest() when $default != null:
return $default(_that.orderId,_that.amount,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentIntentRequest implements PaymentIntentRequest {
  const _PaymentIntentRequest({@JsonKey(name: 'order_id') this.orderId, this.amount, required this.currency});
  factory _PaymentIntentRequest.fromJson(Map<String, dynamic> json) => _$PaymentIntentRequestFromJson(json);

/// 订单ID
@override@JsonKey(name: 'order_id') final  int? orderId;
/// 支付金额（如 10.50），当不提供 order_id 时必填
@override final  double? amount;
/// 货币代码 (ISO 3字母)
@override final  String currency;

/// Create a copy of PaymentIntentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentIntentRequestCopyWith<_PaymentIntentRequest> get copyWith => __$PaymentIntentRequestCopyWithImpl<_PaymentIntentRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentIntentRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentIntentRequest&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,amount,currency);

@override
String toString() {
  return 'PaymentIntentRequest(orderId: $orderId, amount: $amount, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$PaymentIntentRequestCopyWith<$Res> implements $PaymentIntentRequestCopyWith<$Res> {
  factory _$PaymentIntentRequestCopyWith(_PaymentIntentRequest value, $Res Function(_PaymentIntentRequest) _then) = __$PaymentIntentRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'order_id') int? orderId, double? amount, String currency
});




}
/// @nodoc
class __$PaymentIntentRequestCopyWithImpl<$Res>
    implements _$PaymentIntentRequestCopyWith<$Res> {
  __$PaymentIntentRequestCopyWithImpl(this._self, this._then);

  final _PaymentIntentRequest _self;
  final $Res Function(_PaymentIntentRequest) _then;

/// Create a copy of PaymentIntentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = freezed,Object? amount = freezed,Object? currency = null,}) {
  return _then(_PaymentIntentRequest(
orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
