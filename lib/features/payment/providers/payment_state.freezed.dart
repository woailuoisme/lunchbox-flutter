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

 OrderModel? get order; bool get isLoading; int get countdown; bool get isPaymentSheetReady; bool get isPaymentSuccessful; String? get errorMessage;
/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentStateCopyWith<PaymentState> get copyWith => _$PaymentStateCopyWithImpl<PaymentState>(this as PaymentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentState&&(identical(other.order, order) || other.order == order)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.countdown, countdown) || other.countdown == countdown)&&(identical(other.isPaymentSheetReady, isPaymentSheetReady) || other.isPaymentSheetReady == isPaymentSheetReady)&&(identical(other.isPaymentSuccessful, isPaymentSuccessful) || other.isPaymentSuccessful == isPaymentSuccessful)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,order,isLoading,countdown,isPaymentSheetReady,isPaymentSuccessful,errorMessage);

@override
String toString() {
  return 'PaymentState(order: $order, isLoading: $isLoading, countdown: $countdown, isPaymentSheetReady: $isPaymentSheetReady, isPaymentSuccessful: $isPaymentSuccessful, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PaymentStateCopyWith<$Res>  {
  factory $PaymentStateCopyWith(PaymentState value, $Res Function(PaymentState) _then) = _$PaymentStateCopyWithImpl;
@useResult
$Res call({
 OrderModel? order, bool isLoading, int countdown, bool isPaymentSheetReady, bool isPaymentSuccessful, String? errorMessage
});


$OrderModelCopyWith<$Res>? get order;

}
/// @nodoc
class _$PaymentStateCopyWithImpl<$Res>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._self, this._then);

  final PaymentState _self;
  final $Res Function(PaymentState) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? order = freezed,Object? isLoading = null,Object? countdown = null,Object? isPaymentSheetReady = null,Object? isPaymentSuccessful = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderModel?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,countdown: null == countdown ? _self.countdown : countdown // ignore: cast_nullable_to_non_nullable
as int,isPaymentSheetReady: null == isPaymentSheetReady ? _self.isPaymentSheetReady : isPaymentSheetReady // ignore: cast_nullable_to_non_nullable
as bool,isPaymentSuccessful: null == isPaymentSuccessful ? _self.isPaymentSuccessful : isPaymentSuccessful // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderModelCopyWith<$Res>? get order {
    if (_self.order == null) {
    return null;
  }

  return $OrderModelCopyWith<$Res>(_self.order!, (value) {
    return _then(_self.copyWith(order: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrderModel? order,  bool isLoading,  int countdown,  bool isPaymentSheetReady,  bool isPaymentSuccessful,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
return $default(_that.order,_that.isLoading,_that.countdown,_that.isPaymentSheetReady,_that.isPaymentSuccessful,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrderModel? order,  bool isLoading,  int countdown,  bool isPaymentSheetReady,  bool isPaymentSuccessful,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PaymentState():
return $default(_that.order,_that.isLoading,_that.countdown,_that.isPaymentSheetReady,_that.isPaymentSuccessful,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrderModel? order,  bool isLoading,  int countdown,  bool isPaymentSheetReady,  bool isPaymentSuccessful,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
return $default(_that.order,_that.isLoading,_that.countdown,_that.isPaymentSheetReady,_that.isPaymentSuccessful,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentState implements PaymentState {
  const _PaymentState({this.order, this.isLoading = false, this.countdown = 300, this.isPaymentSheetReady = false, this.isPaymentSuccessful = false, this.errorMessage});
  

@override final  OrderModel? order;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  int countdown;
@override@JsonKey() final  bool isPaymentSheetReady;
@override@JsonKey() final  bool isPaymentSuccessful;
@override final  String? errorMessage;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentStateCopyWith<_PaymentState> get copyWith => __$PaymentStateCopyWithImpl<_PaymentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentState&&(identical(other.order, order) || other.order == order)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.countdown, countdown) || other.countdown == countdown)&&(identical(other.isPaymentSheetReady, isPaymentSheetReady) || other.isPaymentSheetReady == isPaymentSheetReady)&&(identical(other.isPaymentSuccessful, isPaymentSuccessful) || other.isPaymentSuccessful == isPaymentSuccessful)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,order,isLoading,countdown,isPaymentSheetReady,isPaymentSuccessful,errorMessage);

@override
String toString() {
  return 'PaymentState(order: $order, isLoading: $isLoading, countdown: $countdown, isPaymentSheetReady: $isPaymentSheetReady, isPaymentSuccessful: $isPaymentSuccessful, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PaymentStateCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory _$PaymentStateCopyWith(_PaymentState value, $Res Function(_PaymentState) _then) = __$PaymentStateCopyWithImpl;
@override @useResult
$Res call({
 OrderModel? order, bool isLoading, int countdown, bool isPaymentSheetReady, bool isPaymentSuccessful, String? errorMessage
});


@override $OrderModelCopyWith<$Res>? get order;

}
/// @nodoc
class __$PaymentStateCopyWithImpl<$Res>
    implements _$PaymentStateCopyWith<$Res> {
  __$PaymentStateCopyWithImpl(this._self, this._then);

  final _PaymentState _self;
  final $Res Function(_PaymentState) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? order = freezed,Object? isLoading = null,Object? countdown = null,Object? isPaymentSheetReady = null,Object? isPaymentSuccessful = null,Object? errorMessage = freezed,}) {
  return _then(_PaymentState(
order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderModel?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,countdown: null == countdown ? _self.countdown : countdown // ignore: cast_nullable_to_non_nullable
as int,isPaymentSheetReady: null == isPaymentSheetReady ? _self.isPaymentSheetReady : isPaymentSheetReady // ignore: cast_nullable_to_non_nullable
as bool,isPaymentSuccessful: null == isPaymentSuccessful ? _self.isPaymentSuccessful : isPaymentSuccessful // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderModelCopyWith<$Res>? get order {
    if (_self.order == null) {
    return null;
  }

  return $OrderModelCopyWith<$Res>(_self.order!, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}

// dart format on
