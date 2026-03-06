// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setup_payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SetupPaymentState {

 bool get isLoading; bool get isSheetReady; bool get isSuccess; String? get clientSecret; String? get errorMessage;
/// Create a copy of SetupPaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetupPaymentStateCopyWith<SetupPaymentState> get copyWith => _$SetupPaymentStateCopyWithImpl<SetupPaymentState>(this as SetupPaymentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetupPaymentState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSheetReady, isSheetReady) || other.isSheetReady == isSheetReady)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSheetReady,isSuccess,clientSecret,errorMessage);

@override
String toString() {
  return 'SetupPaymentState(isLoading: $isLoading, isSheetReady: $isSheetReady, isSuccess: $isSuccess, clientSecret: $clientSecret, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SetupPaymentStateCopyWith<$Res>  {
  factory $SetupPaymentStateCopyWith(SetupPaymentState value, $Res Function(SetupPaymentState) _then) = _$SetupPaymentStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSheetReady, bool isSuccess, String? clientSecret, String? errorMessage
});




}
/// @nodoc
class _$SetupPaymentStateCopyWithImpl<$Res>
    implements $SetupPaymentStateCopyWith<$Res> {
  _$SetupPaymentStateCopyWithImpl(this._self, this._then);

  final SetupPaymentState _self;
  final $Res Function(SetupPaymentState) _then;

/// Create a copy of SetupPaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSheetReady = null,Object? isSuccess = null,Object? clientSecret = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSheetReady: null == isSheetReady ? _self.isSheetReady : isSheetReady // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,clientSecret: freezed == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SetupPaymentState].
extension SetupPaymentStatePatterns on SetupPaymentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SetupPaymentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetupPaymentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SetupPaymentState value)  $default,){
final _that = this;
switch (_that) {
case _SetupPaymentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SetupPaymentState value)?  $default,){
final _that = this;
switch (_that) {
case _SetupPaymentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isSheetReady,  bool isSuccess,  String? clientSecret,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetupPaymentState() when $default != null:
return $default(_that.isLoading,_that.isSheetReady,_that.isSuccess,_that.clientSecret,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isSheetReady,  bool isSuccess,  String? clientSecret,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SetupPaymentState():
return $default(_that.isLoading,_that.isSheetReady,_that.isSuccess,_that.clientSecret,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isSheetReady,  bool isSuccess,  String? clientSecret,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SetupPaymentState() when $default != null:
return $default(_that.isLoading,_that.isSheetReady,_that.isSuccess,_that.clientSecret,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SetupPaymentState implements SetupPaymentState {
  const _SetupPaymentState({this.isLoading = false, this.isSheetReady = false, this.isSuccess = false, this.clientSecret, this.errorMessage});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSheetReady;
@override@JsonKey() final  bool isSuccess;
@override final  String? clientSecret;
@override final  String? errorMessage;

/// Create a copy of SetupPaymentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetupPaymentStateCopyWith<_SetupPaymentState> get copyWith => __$SetupPaymentStateCopyWithImpl<_SetupPaymentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetupPaymentState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSheetReady, isSheetReady) || other.isSheetReady == isSheetReady)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSheetReady,isSuccess,clientSecret,errorMessage);

@override
String toString() {
  return 'SetupPaymentState(isLoading: $isLoading, isSheetReady: $isSheetReady, isSuccess: $isSuccess, clientSecret: $clientSecret, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SetupPaymentStateCopyWith<$Res> implements $SetupPaymentStateCopyWith<$Res> {
  factory _$SetupPaymentStateCopyWith(_SetupPaymentState value, $Res Function(_SetupPaymentState) _then) = __$SetupPaymentStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSheetReady, bool isSuccess, String? clientSecret, String? errorMessage
});




}
/// @nodoc
class __$SetupPaymentStateCopyWithImpl<$Res>
    implements _$SetupPaymentStateCopyWith<$Res> {
  __$SetupPaymentStateCopyWithImpl(this._self, this._then);

  final _SetupPaymentState _self;
  final $Res Function(_SetupPaymentState) _then;

/// Create a copy of SetupPaymentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSheetReady = null,Object? isSuccess = null,Object? clientSecret = freezed,Object? errorMessage = freezed,}) {
  return _then(_SetupPaymentState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSheetReady: null == isSheetReady ? _self.isSheetReady : isSheetReady // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,clientSecret: freezed == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
