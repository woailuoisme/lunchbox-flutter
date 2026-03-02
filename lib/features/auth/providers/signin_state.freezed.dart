// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignInState {

 String get username; String get password; String get phoneNumber; String get verificationCode; SignInType get signInType; bool get isCodeSent; int get countdown; SignInStatus get status; String? get errorMessage;
/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInStateCopyWith<SignInState> get copyWith => _$SignInStateCopyWithImpl<SignInState>(this as SignInState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInState&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.verificationCode, verificationCode) || other.verificationCode == verificationCode)&&(identical(other.signInType, signInType) || other.signInType == signInType)&&(identical(other.isCodeSent, isCodeSent) || other.isCodeSent == isCodeSent)&&(identical(other.countdown, countdown) || other.countdown == countdown)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,username,password,phoneNumber,verificationCode,signInType,isCodeSent,countdown,status,errorMessage);

@override
String toString() {
  return 'SignInState(username: $username, password: $password, phoneNumber: $phoneNumber, verificationCode: $verificationCode, signInType: $signInType, isCodeSent: $isCodeSent, countdown: $countdown, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SignInStateCopyWith<$Res>  {
  factory $SignInStateCopyWith(SignInState value, $Res Function(SignInState) _then) = _$SignInStateCopyWithImpl;
@useResult
$Res call({
 String username, String password, String phoneNumber, String verificationCode, SignInType signInType, bool isCodeSent, int countdown, SignInStatus status, String? errorMessage
});




}
/// @nodoc
class _$SignInStateCopyWithImpl<$Res>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._self, this._then);

  final SignInState _self;
  final $Res Function(SignInState) _then;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? password = null,Object? phoneNumber = null,Object? verificationCode = null,Object? signInType = null,Object? isCodeSent = null,Object? countdown = null,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,verificationCode: null == verificationCode ? _self.verificationCode : verificationCode // ignore: cast_nullable_to_non_nullable
as String,signInType: null == signInType ? _self.signInType : signInType // ignore: cast_nullable_to_non_nullable
as SignInType,isCodeSent: null == isCodeSent ? _self.isCodeSent : isCodeSent // ignore: cast_nullable_to_non_nullable
as bool,countdown: null == countdown ? _self.countdown : countdown // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SignInStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignInState].
extension SignInStatePatterns on SignInState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignInState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignInState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignInState value)  $default,){
final _that = this;
switch (_that) {
case _SignInState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignInState value)?  $default,){
final _that = this;
switch (_that) {
case _SignInState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  String password,  String phoneNumber,  String verificationCode,  SignInType signInType,  bool isCodeSent,  int countdown,  SignInStatus status,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignInState() when $default != null:
return $default(_that.username,_that.password,_that.phoneNumber,_that.verificationCode,_that.signInType,_that.isCodeSent,_that.countdown,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  String password,  String phoneNumber,  String verificationCode,  SignInType signInType,  bool isCodeSent,  int countdown,  SignInStatus status,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SignInState():
return $default(_that.username,_that.password,_that.phoneNumber,_that.verificationCode,_that.signInType,_that.isCodeSent,_that.countdown,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  String password,  String phoneNumber,  String verificationCode,  SignInType signInType,  bool isCodeSent,  int countdown,  SignInStatus status,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SignInState() when $default != null:
return $default(_that.username,_that.password,_that.phoneNumber,_that.verificationCode,_that.signInType,_that.isCodeSent,_that.countdown,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SignInState implements SignInState {
  const _SignInState({this.username = '', this.password = '', this.phoneNumber = '', this.verificationCode = '', this.signInType = SignInType.password, this.isCodeSent = false, this.countdown = 0, this.status = SignInStatus.initial, this.errorMessage});
  

@override@JsonKey() final  String username;
@override@JsonKey() final  String password;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String verificationCode;
@override@JsonKey() final  SignInType signInType;
@override@JsonKey() final  bool isCodeSent;
@override@JsonKey() final  int countdown;
@override@JsonKey() final  SignInStatus status;
@override final  String? errorMessage;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignInStateCopyWith<_SignInState> get copyWith => __$SignInStateCopyWithImpl<_SignInState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInState&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.verificationCode, verificationCode) || other.verificationCode == verificationCode)&&(identical(other.signInType, signInType) || other.signInType == signInType)&&(identical(other.isCodeSent, isCodeSent) || other.isCodeSent == isCodeSent)&&(identical(other.countdown, countdown) || other.countdown == countdown)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,username,password,phoneNumber,verificationCode,signInType,isCodeSent,countdown,status,errorMessage);

@override
String toString() {
  return 'SignInState(username: $username, password: $password, phoneNumber: $phoneNumber, verificationCode: $verificationCode, signInType: $signInType, isCodeSent: $isCodeSent, countdown: $countdown, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SignInStateCopyWith<$Res> implements $SignInStateCopyWith<$Res> {
  factory _$SignInStateCopyWith(_SignInState value, $Res Function(_SignInState) _then) = __$SignInStateCopyWithImpl;
@override @useResult
$Res call({
 String username, String password, String phoneNumber, String verificationCode, SignInType signInType, bool isCodeSent, int countdown, SignInStatus status, String? errorMessage
});




}
/// @nodoc
class __$SignInStateCopyWithImpl<$Res>
    implements _$SignInStateCopyWith<$Res> {
  __$SignInStateCopyWithImpl(this._self, this._then);

  final _SignInState _self;
  final $Res Function(_SignInState) _then;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,Object? phoneNumber = null,Object? verificationCode = null,Object? signInType = null,Object? isCodeSent = null,Object? countdown = null,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_SignInState(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,verificationCode: null == verificationCode ? _self.verificationCode : verificationCode // ignore: cast_nullable_to_non_nullable
as String,signInType: null == signInType ? _self.signInType : signInType // ignore: cast_nullable_to_non_nullable
as SignInType,isCodeSent: null == isCodeSent ? _self.isCodeSent : isCodeSent // ignore: cast_nullable_to_non_nullable
as bool,countdown: null == countdown ? _self.countdown : countdown // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SignInStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
