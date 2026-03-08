// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentState {

 PaymentIntentResponse? get paymentIntent; bool get isPaymentSheetReady; bool get isPaymentSuccessful; bool get isPaymentCanceled; PaymentMethod get selectedMethod;
/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentStateCopyWith<PaymentState> get copyWith => _$PaymentStateCopyWithImpl<PaymentState>(this as PaymentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentState&&(identical(other.paymentIntent, paymentIntent) || other.paymentIntent == paymentIntent)&&(identical(other.isPaymentSheetReady, isPaymentSheetReady) || other.isPaymentSheetReady == isPaymentSheetReady)&&(identical(other.isPaymentSuccessful, isPaymentSuccessful) || other.isPaymentSuccessful == isPaymentSuccessful)&&(identical(other.isPaymentCanceled, isPaymentCanceled) || other.isPaymentCanceled == isPaymentCanceled)&&(identical(other.selectedMethod, selectedMethod) || other.selectedMethod == selectedMethod));
}


@override
int get hashCode => Object.hash(runtimeType,paymentIntent,isPaymentSheetReady,isPaymentSuccessful,isPaymentCanceled,selectedMethod);

@override
String toString() {
  return 'PaymentState(paymentIntent: $paymentIntent, isPaymentSheetReady: $isPaymentSheetReady, isPaymentSuccessful: $isPaymentSuccessful, isPaymentCanceled: $isPaymentCanceled, selectedMethod: $selectedMethod)';
}


}

/// @nodoc
abstract mixin class $PaymentStateCopyWith<$Res>  {
  factory $PaymentStateCopyWith(PaymentState value, $Res Function(PaymentState) _then) = _$PaymentStateCopyWithImpl;
@useResult
$Res call({
 PaymentIntentResponse? paymentIntent, bool isPaymentSheetReady, bool isPaymentSuccessful, bool isPaymentCanceled, PaymentMethod selectedMethod
});


$PaymentIntentResponseCopyWith<$Res>? get paymentIntent;

}
/// @nodoc
class _$PaymentStateCopyWithImpl<$Res>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._self, this._then);

  final PaymentState _self;
  final $Res Function(PaymentState) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentIntent = freezed,Object? isPaymentSheetReady = null,Object? isPaymentSuccessful = null,Object? isPaymentCanceled = null,Object? selectedMethod = null,}) {
  return _then(_self.copyWith(
paymentIntent: freezed == paymentIntent ? _self.paymentIntent : paymentIntent // ignore: cast_nullable_to_non_nullable
as PaymentIntentResponse?,isPaymentSheetReady: null == isPaymentSheetReady ? _self.isPaymentSheetReady : isPaymentSheetReady // ignore: cast_nullable_to_non_nullable
as bool,isPaymentSuccessful: null == isPaymentSuccessful ? _self.isPaymentSuccessful : isPaymentSuccessful // ignore: cast_nullable_to_non_nullable
as bool,isPaymentCanceled: null == isPaymentCanceled ? _self.isPaymentCanceled : isPaymentCanceled // ignore: cast_nullable_to_non_nullable
as bool,selectedMethod: null == selectedMethod ? _self.selectedMethod : selectedMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,
  ));
}
/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentIntentResponseCopyWith<$Res>? get paymentIntent {
    if (_self.paymentIntent == null) {
    return null;
  }

  return $PaymentIntentResponseCopyWith<$Res>(_self.paymentIntent!, (value) {
    return _then(_self.copyWith(paymentIntent: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaymentState].
extension PaymentStatePatterns on PaymentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentState value)  $default,){
final _that = this;
switch (_that) {
case _PaymentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentState value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaymentIntentResponse? paymentIntent,  bool isPaymentSheetReady,  bool isPaymentSuccessful,  bool isPaymentCanceled,  PaymentMethod selectedMethod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
return $default(_that.paymentIntent,_that.isPaymentSheetReady,_that.isPaymentSuccessful,_that.isPaymentCanceled,_that.selectedMethod);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaymentIntentResponse? paymentIntent,  bool isPaymentSheetReady,  bool isPaymentSuccessful,  bool isPaymentCanceled,  PaymentMethod selectedMethod)  $default,) {final _that = this;
switch (_that) {
case _PaymentState():
return $default(_that.paymentIntent,_that.isPaymentSheetReady,_that.isPaymentSuccessful,_that.isPaymentCanceled,_that.selectedMethod);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaymentIntentResponse? paymentIntent,  bool isPaymentSheetReady,  bool isPaymentSuccessful,  bool isPaymentCanceled,  PaymentMethod selectedMethod)?  $default,) {final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
return $default(_that.paymentIntent,_that.isPaymentSheetReady,_that.isPaymentSuccessful,_that.isPaymentCanceled,_that.selectedMethod);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentState extends PaymentState {
  const _PaymentState({this.paymentIntent, this.isPaymentSheetReady = false, this.isPaymentSuccessful = false, this.isPaymentCanceled = false, this.selectedMethod = PaymentMethod.stripe}): super._();
  

@override final  PaymentIntentResponse? paymentIntent;
@override@JsonKey() final  bool isPaymentSheetReady;
@override@JsonKey() final  bool isPaymentSuccessful;
@override@JsonKey() final  bool isPaymentCanceled;
@override@JsonKey() final  PaymentMethod selectedMethod;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentStateCopyWith<_PaymentState> get copyWith => __$PaymentStateCopyWithImpl<_PaymentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentState&&(identical(other.paymentIntent, paymentIntent) || other.paymentIntent == paymentIntent)&&(identical(other.isPaymentSheetReady, isPaymentSheetReady) || other.isPaymentSheetReady == isPaymentSheetReady)&&(identical(other.isPaymentSuccessful, isPaymentSuccessful) || other.isPaymentSuccessful == isPaymentSuccessful)&&(identical(other.isPaymentCanceled, isPaymentCanceled) || other.isPaymentCanceled == isPaymentCanceled)&&(identical(other.selectedMethod, selectedMethod) || other.selectedMethod == selectedMethod));
}


@override
int get hashCode => Object.hash(runtimeType,paymentIntent,isPaymentSheetReady,isPaymentSuccessful,isPaymentCanceled,selectedMethod);

@override
String toString() {
  return 'PaymentState(paymentIntent: $paymentIntent, isPaymentSheetReady: $isPaymentSheetReady, isPaymentSuccessful: $isPaymentSuccessful, isPaymentCanceled: $isPaymentCanceled, selectedMethod: $selectedMethod)';
}


}

/// @nodoc
abstract mixin class _$PaymentStateCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory _$PaymentStateCopyWith(_PaymentState value, $Res Function(_PaymentState) _then) = __$PaymentStateCopyWithImpl;
@override @useResult
$Res call({
 PaymentIntentResponse? paymentIntent, bool isPaymentSheetReady, bool isPaymentSuccessful, bool isPaymentCanceled, PaymentMethod selectedMethod
});


@override $PaymentIntentResponseCopyWith<$Res>? get paymentIntent;

}
/// @nodoc
class __$PaymentStateCopyWithImpl<$Res>
    implements _$PaymentStateCopyWith<$Res> {
  __$PaymentStateCopyWithImpl(this._self, this._then);

  final _PaymentState _self;
  final $Res Function(_PaymentState) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentIntent = freezed,Object? isPaymentSheetReady = null,Object? isPaymentSuccessful = null,Object? isPaymentCanceled = null,Object? selectedMethod = null,}) {
  return _then(_PaymentState(
paymentIntent: freezed == paymentIntent ? _self.paymentIntent : paymentIntent // ignore: cast_nullable_to_non_nullable
as PaymentIntentResponse?,isPaymentSheetReady: null == isPaymentSheetReady ? _self.isPaymentSheetReady : isPaymentSheetReady // ignore: cast_nullable_to_non_nullable
as bool,isPaymentSuccessful: null == isPaymentSuccessful ? _self.isPaymentSuccessful : isPaymentSuccessful // ignore: cast_nullable_to_non_nullable
as bool,isPaymentCanceled: null == isPaymentCanceled ? _self.isPaymentCanceled : isPaymentCanceled // ignore: cast_nullable_to_non_nullable
as bool,selectedMethod: null == selectedMethod ? _self.selectedMethod : selectedMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,
  ));
}

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentIntentResponseCopyWith<$Res>? get paymentIntent {
    if (_self.paymentIntent == null) {
    return null;
  }

  return $PaymentIntentResponseCopyWith<$Res>(_self.paymentIntent!, (value) {
    return _then(_self.copyWith(paymentIntent: value));
  });
}
}

// dart format on
