// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'points_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PointsMallState {

/// 余额类商品列表
 List<MallProductResponse> get balanceProducts;/// 优惠券类商品列表
 List<MallProductResponse> get couponProducts;/// 当前用户积分余额
 int get balance;/// 是否正在兑换
 bool get isRedeeming;/// 正在兑换的商品 ID
 int? get redeemingId;/// 错误消息
 String? get errorMessage;/// 成功消息
 String? get successMessage;
/// Create a copy of PointsMallState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PointsMallStateCopyWith<PointsMallState> get copyWith => _$PointsMallStateCopyWithImpl<PointsMallState>(this as PointsMallState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PointsMallState&&const DeepCollectionEquality().equals(other.balanceProducts, balanceProducts)&&const DeepCollectionEquality().equals(other.couponProducts, couponProducts)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.isRedeeming, isRedeeming) || other.isRedeeming == isRedeeming)&&(identical(other.redeemingId, redeemingId) || other.redeemingId == redeemingId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(balanceProducts),const DeepCollectionEquality().hash(couponProducts),balance,isRedeeming,redeemingId,errorMessage,successMessage);

@override
String toString() {
  return 'PointsMallState(balanceProducts: $balanceProducts, couponProducts: $couponProducts, balance: $balance, isRedeeming: $isRedeeming, redeemingId: $redeemingId, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $PointsMallStateCopyWith<$Res>  {
  factory $PointsMallStateCopyWith(PointsMallState value, $Res Function(PointsMallState) _then) = _$PointsMallStateCopyWithImpl;
@useResult
$Res call({
 List<MallProductResponse> balanceProducts, List<MallProductResponse> couponProducts, int balance, bool isRedeeming, int? redeemingId, String? errorMessage, String? successMessage
});




}
/// @nodoc
class _$PointsMallStateCopyWithImpl<$Res>
    implements $PointsMallStateCopyWith<$Res> {
  _$PointsMallStateCopyWithImpl(this._self, this._then);

  final PointsMallState _self;
  final $Res Function(PointsMallState) _then;

/// Create a copy of PointsMallState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? balanceProducts = null,Object? couponProducts = null,Object? balance = null,Object? isRedeeming = null,Object? redeemingId = freezed,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
balanceProducts: null == balanceProducts ? _self.balanceProducts : balanceProducts // ignore: cast_nullable_to_non_nullable
as List<MallProductResponse>,couponProducts: null == couponProducts ? _self.couponProducts : couponProducts // ignore: cast_nullable_to_non_nullable
as List<MallProductResponse>,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,isRedeeming: null == isRedeeming ? _self.isRedeeming : isRedeeming // ignore: cast_nullable_to_non_nullable
as bool,redeemingId: freezed == redeemingId ? _self.redeemingId : redeemingId // ignore: cast_nullable_to_non_nullable
as int?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PointsMallState].
extension PointsMallStatePatterns on PointsMallState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PointsMallState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PointsMallState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PointsMallState value)  $default,){
final _that = this;
switch (_that) {
case _PointsMallState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PointsMallState value)?  $default,){
final _that = this;
switch (_that) {
case _PointsMallState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MallProductResponse> balanceProducts,  List<MallProductResponse> couponProducts,  int balance,  bool isRedeeming,  int? redeemingId,  String? errorMessage,  String? successMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PointsMallState() when $default != null:
return $default(_that.balanceProducts,_that.couponProducts,_that.balance,_that.isRedeeming,_that.redeemingId,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MallProductResponse> balanceProducts,  List<MallProductResponse> couponProducts,  int balance,  bool isRedeeming,  int? redeemingId,  String? errorMessage,  String? successMessage)  $default,) {final _that = this;
switch (_that) {
case _PointsMallState():
return $default(_that.balanceProducts,_that.couponProducts,_that.balance,_that.isRedeeming,_that.redeemingId,_that.errorMessage,_that.successMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MallProductResponse> balanceProducts,  List<MallProductResponse> couponProducts,  int balance,  bool isRedeeming,  int? redeemingId,  String? errorMessage,  String? successMessage)?  $default,) {final _that = this;
switch (_that) {
case _PointsMallState() when $default != null:
return $default(_that.balanceProducts,_that.couponProducts,_that.balance,_that.isRedeeming,_that.redeemingId,_that.errorMessage,_that.successMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PointsMallState implements PointsMallState {
  const _PointsMallState({final  List<MallProductResponse> balanceProducts = const [], final  List<MallProductResponse> couponProducts = const [], this.balance = 0, this.isRedeeming = false, this.redeemingId, this.errorMessage, this.successMessage}): _balanceProducts = balanceProducts,_couponProducts = couponProducts;
  

/// 余额类商品列表
 final  List<MallProductResponse> _balanceProducts;
/// 余额类商品列表
@override@JsonKey() List<MallProductResponse> get balanceProducts {
  if (_balanceProducts is EqualUnmodifiableListView) return _balanceProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_balanceProducts);
}

/// 优惠券类商品列表
 final  List<MallProductResponse> _couponProducts;
/// 优惠券类商品列表
@override@JsonKey() List<MallProductResponse> get couponProducts {
  if (_couponProducts is EqualUnmodifiableListView) return _couponProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_couponProducts);
}

/// 当前用户积分余额
@override@JsonKey() final  int balance;
/// 是否正在兑换
@override@JsonKey() final  bool isRedeeming;
/// 正在兑换的商品 ID
@override final  int? redeemingId;
/// 错误消息
@override final  String? errorMessage;
/// 成功消息
@override final  String? successMessage;

/// Create a copy of PointsMallState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PointsMallStateCopyWith<_PointsMallState> get copyWith => __$PointsMallStateCopyWithImpl<_PointsMallState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PointsMallState&&const DeepCollectionEquality().equals(other._balanceProducts, _balanceProducts)&&const DeepCollectionEquality().equals(other._couponProducts, _couponProducts)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.isRedeeming, isRedeeming) || other.isRedeeming == isRedeeming)&&(identical(other.redeemingId, redeemingId) || other.redeemingId == redeemingId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_balanceProducts),const DeepCollectionEquality().hash(_couponProducts),balance,isRedeeming,redeemingId,errorMessage,successMessage);

@override
String toString() {
  return 'PointsMallState(balanceProducts: $balanceProducts, couponProducts: $couponProducts, balance: $balance, isRedeeming: $isRedeeming, redeemingId: $redeemingId, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$PointsMallStateCopyWith<$Res> implements $PointsMallStateCopyWith<$Res> {
  factory _$PointsMallStateCopyWith(_PointsMallState value, $Res Function(_PointsMallState) _then) = __$PointsMallStateCopyWithImpl;
@override @useResult
$Res call({
 List<MallProductResponse> balanceProducts, List<MallProductResponse> couponProducts, int balance, bool isRedeeming, int? redeemingId, String? errorMessage, String? successMessage
});




}
/// @nodoc
class __$PointsMallStateCopyWithImpl<$Res>
    implements _$PointsMallStateCopyWith<$Res> {
  __$PointsMallStateCopyWithImpl(this._self, this._then);

  final _PointsMallState _self;
  final $Res Function(_PointsMallState) _then;

/// Create a copy of PointsMallState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? balanceProducts = null,Object? couponProducts = null,Object? balance = null,Object? isRedeeming = null,Object? redeemingId = freezed,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_PointsMallState(
balanceProducts: null == balanceProducts ? _self._balanceProducts : balanceProducts // ignore: cast_nullable_to_non_nullable
as List<MallProductResponse>,couponProducts: null == couponProducts ? _self._couponProducts : couponProducts // ignore: cast_nullable_to_non_nullable
as List<MallProductResponse>,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,isRedeeming: null == isRedeeming ? _self.isRedeeming : isRedeeming // ignore: cast_nullable_to_non_nullable
as bool,redeemingId: freezed == redeemingId ? _self.redeemingId : redeemingId // ignore: cast_nullable_to_non_nullable
as int?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
