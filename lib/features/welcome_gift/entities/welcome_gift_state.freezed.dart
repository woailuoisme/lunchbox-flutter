// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'welcome_gift_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WelcomeGiftState {

/// 可领取礼包列表
 List<WelcomeGiftItemResponse> get availableGifts;/// 已领取礼包记录列表
 List<WelcomeGiftLogResponse> get receivedLogs;/// 是否正在操作（如下单/领取）
 bool get isProcessing;/// 错误消息
 String? get errorMessage;/// 正在处理的礼包ID
 int? get processingId;/// 成功提示消息（如领取成功后弹出）
 String? get successMessage;
/// Create a copy of WelcomeGiftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WelcomeGiftStateCopyWith<WelcomeGiftState> get copyWith => _$WelcomeGiftStateCopyWithImpl<WelcomeGiftState>(this as WelcomeGiftState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeGiftState&&const DeepCollectionEquality().equals(other.availableGifts, availableGifts)&&const DeepCollectionEquality().equals(other.receivedLogs, receivedLogs)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.processingId, processingId) || other.processingId == processingId)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(availableGifts),const DeepCollectionEquality().hash(receivedLogs),isProcessing,errorMessage,processingId,successMessage);

@override
String toString() {
  return 'WelcomeGiftState(availableGifts: $availableGifts, receivedLogs: $receivedLogs, isProcessing: $isProcessing, errorMessage: $errorMessage, processingId: $processingId, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $WelcomeGiftStateCopyWith<$Res>  {
  factory $WelcomeGiftStateCopyWith(WelcomeGiftState value, $Res Function(WelcomeGiftState) _then) = _$WelcomeGiftStateCopyWithImpl;
@useResult
$Res call({
 List<WelcomeGiftItemResponse> availableGifts, List<WelcomeGiftLogResponse> receivedLogs, bool isProcessing, String? errorMessage, int? processingId, String? successMessage
});




}
/// @nodoc
class _$WelcomeGiftStateCopyWithImpl<$Res>
    implements $WelcomeGiftStateCopyWith<$Res> {
  _$WelcomeGiftStateCopyWithImpl(this._self, this._then);

  final WelcomeGiftState _self;
  final $Res Function(WelcomeGiftState) _then;

/// Create a copy of WelcomeGiftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availableGifts = null,Object? receivedLogs = null,Object? isProcessing = null,Object? errorMessage = freezed,Object? processingId = freezed,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
availableGifts: null == availableGifts ? _self.availableGifts : availableGifts // ignore: cast_nullable_to_non_nullable
as List<WelcomeGiftItemResponse>,receivedLogs: null == receivedLogs ? _self.receivedLogs : receivedLogs // ignore: cast_nullable_to_non_nullable
as List<WelcomeGiftLogResponse>,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,processingId: freezed == processingId ? _self.processingId : processingId // ignore: cast_nullable_to_non_nullable
as int?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WelcomeGiftState].
extension WelcomeGiftStatePatterns on WelcomeGiftState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WelcomeGiftState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WelcomeGiftState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WelcomeGiftState value)  $default,){
final _that = this;
switch (_that) {
case _WelcomeGiftState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WelcomeGiftState value)?  $default,){
final _that = this;
switch (_that) {
case _WelcomeGiftState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WelcomeGiftItemResponse> availableGifts,  List<WelcomeGiftLogResponse> receivedLogs,  bool isProcessing,  String? errorMessage,  int? processingId,  String? successMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WelcomeGiftState() when $default != null:
return $default(_that.availableGifts,_that.receivedLogs,_that.isProcessing,_that.errorMessage,_that.processingId,_that.successMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WelcomeGiftItemResponse> availableGifts,  List<WelcomeGiftLogResponse> receivedLogs,  bool isProcessing,  String? errorMessage,  int? processingId,  String? successMessage)  $default,) {final _that = this;
switch (_that) {
case _WelcomeGiftState():
return $default(_that.availableGifts,_that.receivedLogs,_that.isProcessing,_that.errorMessage,_that.processingId,_that.successMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WelcomeGiftItemResponse> availableGifts,  List<WelcomeGiftLogResponse> receivedLogs,  bool isProcessing,  String? errorMessage,  int? processingId,  String? successMessage)?  $default,) {final _that = this;
switch (_that) {
case _WelcomeGiftState() when $default != null:
return $default(_that.availableGifts,_that.receivedLogs,_that.isProcessing,_that.errorMessage,_that.processingId,_that.successMessage);case _:
  return null;

}
}

}

/// @nodoc


class _WelcomeGiftState implements WelcomeGiftState {
  const _WelcomeGiftState({final  List<WelcomeGiftItemResponse> availableGifts = const [], final  List<WelcomeGiftLogResponse> receivedLogs = const [], this.isProcessing = false, this.errorMessage, this.processingId, this.successMessage}): _availableGifts = availableGifts,_receivedLogs = receivedLogs;
  

/// 可领取礼包列表
 final  List<WelcomeGiftItemResponse> _availableGifts;
/// 可领取礼包列表
@override@JsonKey() List<WelcomeGiftItemResponse> get availableGifts {
  if (_availableGifts is EqualUnmodifiableListView) return _availableGifts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableGifts);
}

/// 已领取礼包记录列表
 final  List<WelcomeGiftLogResponse> _receivedLogs;
/// 已领取礼包记录列表
@override@JsonKey() List<WelcomeGiftLogResponse> get receivedLogs {
  if (_receivedLogs is EqualUnmodifiableListView) return _receivedLogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_receivedLogs);
}

/// 是否正在操作（如下单/领取）
@override@JsonKey() final  bool isProcessing;
/// 错误消息
@override final  String? errorMessage;
/// 正在处理的礼包ID
@override final  int? processingId;
/// 成功提示消息（如领取成功后弹出）
@override final  String? successMessage;

/// Create a copy of WelcomeGiftState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WelcomeGiftStateCopyWith<_WelcomeGiftState> get copyWith => __$WelcomeGiftStateCopyWithImpl<_WelcomeGiftState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WelcomeGiftState&&const DeepCollectionEquality().equals(other._availableGifts, _availableGifts)&&const DeepCollectionEquality().equals(other._receivedLogs, _receivedLogs)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.processingId, processingId) || other.processingId == processingId)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_availableGifts),const DeepCollectionEquality().hash(_receivedLogs),isProcessing,errorMessage,processingId,successMessage);

@override
String toString() {
  return 'WelcomeGiftState(availableGifts: $availableGifts, receivedLogs: $receivedLogs, isProcessing: $isProcessing, errorMessage: $errorMessage, processingId: $processingId, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$WelcomeGiftStateCopyWith<$Res> implements $WelcomeGiftStateCopyWith<$Res> {
  factory _$WelcomeGiftStateCopyWith(_WelcomeGiftState value, $Res Function(_WelcomeGiftState) _then) = __$WelcomeGiftStateCopyWithImpl;
@override @useResult
$Res call({
 List<WelcomeGiftItemResponse> availableGifts, List<WelcomeGiftLogResponse> receivedLogs, bool isProcessing, String? errorMessage, int? processingId, String? successMessage
});




}
/// @nodoc
class __$WelcomeGiftStateCopyWithImpl<$Res>
    implements _$WelcomeGiftStateCopyWith<$Res> {
  __$WelcomeGiftStateCopyWithImpl(this._self, this._then);

  final _WelcomeGiftState _self;
  final $Res Function(_WelcomeGiftState) _then;

/// Create a copy of WelcomeGiftState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availableGifts = null,Object? receivedLogs = null,Object? isProcessing = null,Object? errorMessage = freezed,Object? processingId = freezed,Object? successMessage = freezed,}) {
  return _then(_WelcomeGiftState(
availableGifts: null == availableGifts ? _self._availableGifts : availableGifts // ignore: cast_nullable_to_non_nullable
as List<WelcomeGiftItemResponse>,receivedLogs: null == receivedLogs ? _self._receivedLogs : receivedLogs // ignore: cast_nullable_to_non_nullable
as List<WelcomeGiftLogResponse>,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,processingId: freezed == processingId ? _self.processingId : processingId // ignore: cast_nullable_to_non_nullable
as int?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
