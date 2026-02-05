// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentModel {

/// 支付ID
 String get id;/// 订单ID
 String get orderId;/// 支付方式：wechat、alipay
 String get paymentMethod;/// 支付金额
 double get amount;/// 支付状态
 PaymentStatus get status;/// 支付二维码URL
 String? get qrCodeUrl;/// 支付二维码内容
 String? get qrCodeData;/// 第三方支付交易号
 String? get transactionId;/// 支付创建时间
 DateTime get createdAt;/// 支付完成时间
 DateTime? get paidAt;/// 支付过期时间
 DateTime get expireAt;/// 支付备注
 String? get remark;
/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentModelCopyWith<PaymentModel> get copyWith => _$PaymentModelCopyWithImpl<PaymentModel>(this as PaymentModel, _$identity);

  /// Serializes this PaymentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.qrCodeUrl, qrCodeUrl) || other.qrCodeUrl == qrCodeUrl)&&(identical(other.qrCodeData, qrCodeData) || other.qrCodeData == qrCodeData)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.expireAt, expireAt) || other.expireAt == expireAt)&&(identical(other.remark, remark) || other.remark == remark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,paymentMethod,amount,status,qrCodeUrl,qrCodeData,transactionId,createdAt,paidAt,expireAt,remark);

@override
String toString() {
  return 'PaymentModel(id: $id, orderId: $orderId, paymentMethod: $paymentMethod, amount: $amount, status: $status, qrCodeUrl: $qrCodeUrl, qrCodeData: $qrCodeData, transactionId: $transactionId, createdAt: $createdAt, paidAt: $paidAt, expireAt: $expireAt, remark: $remark)';
}


}

/// @nodoc
abstract mixin class $PaymentModelCopyWith<$Res>  {
  factory $PaymentModelCopyWith(PaymentModel value, $Res Function(PaymentModel) _then) = _$PaymentModelCopyWithImpl;
@useResult
$Res call({
 String id, String orderId, String paymentMethod, double amount, PaymentStatus status, String? qrCodeUrl, String? qrCodeData, String? transactionId, DateTime createdAt, DateTime? paidAt, DateTime expireAt, String? remark
});




}
/// @nodoc
class _$PaymentModelCopyWithImpl<$Res>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._self, this._then);

  final PaymentModel _self;
  final $Res Function(PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = null,Object? paymentMethod = null,Object? amount = null,Object? status = null,Object? qrCodeUrl = freezed,Object? qrCodeData = freezed,Object? transactionId = freezed,Object? createdAt = null,Object? paidAt = freezed,Object? expireAt = null,Object? remark = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,qrCodeUrl: freezed == qrCodeUrl ? _self.qrCodeUrl : qrCodeUrl // ignore: cast_nullable_to_non_nullable
as String?,qrCodeData: freezed == qrCodeData ? _self.qrCodeData : qrCodeData // ignore: cast_nullable_to_non_nullable
as String?,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expireAt: null == expireAt ? _self.expireAt : expireAt // ignore: cast_nullable_to_non_nullable
as DateTime,remark: freezed == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentModel].
extension PaymentModelPatterns on PaymentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderId,  String paymentMethod,  double amount,  PaymentStatus status,  String? qrCodeUrl,  String? qrCodeData,  String? transactionId,  DateTime createdAt,  DateTime? paidAt,  DateTime expireAt,  String? remark)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.id,_that.orderId,_that.paymentMethod,_that.amount,_that.status,_that.qrCodeUrl,_that.qrCodeData,_that.transactionId,_that.createdAt,_that.paidAt,_that.expireAt,_that.remark);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderId,  String paymentMethod,  double amount,  PaymentStatus status,  String? qrCodeUrl,  String? qrCodeData,  String? transactionId,  DateTime createdAt,  DateTime? paidAt,  DateTime expireAt,  String? remark)  $default,) {final _that = this;
switch (_that) {
case _PaymentModel():
return $default(_that.id,_that.orderId,_that.paymentMethod,_that.amount,_that.status,_that.qrCodeUrl,_that.qrCodeData,_that.transactionId,_that.createdAt,_that.paidAt,_that.expireAt,_that.remark);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderId,  String paymentMethod,  double amount,  PaymentStatus status,  String? qrCodeUrl,  String? qrCodeData,  String? transactionId,  DateTime createdAt,  DateTime? paidAt,  DateTime expireAt,  String? remark)?  $default,) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.id,_that.orderId,_that.paymentMethod,_that.amount,_that.status,_that.qrCodeUrl,_that.qrCodeData,_that.transactionId,_that.createdAt,_that.paidAt,_that.expireAt,_that.remark);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentModel extends PaymentModel {
  const _PaymentModel({required this.id, required this.orderId, required this.paymentMethod, required this.amount, this.status = PaymentStatus.pending, this.qrCodeUrl, this.qrCodeData, this.transactionId, required this.createdAt, this.paidAt, required this.expireAt, this.remark}): super._();
  factory _PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);

/// 支付ID
@override final  String id;
/// 订单ID
@override final  String orderId;
/// 支付方式：wechat、alipay
@override final  String paymentMethod;
/// 支付金额
@override final  double amount;
/// 支付状态
@override@JsonKey() final  PaymentStatus status;
/// 支付二维码URL
@override final  String? qrCodeUrl;
/// 支付二维码内容
@override final  String? qrCodeData;
/// 第三方支付交易号
@override final  String? transactionId;
/// 支付创建时间
@override final  DateTime createdAt;
/// 支付完成时间
@override final  DateTime? paidAt;
/// 支付过期时间
@override final  DateTime expireAt;
/// 支付备注
@override final  String? remark;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentModelCopyWith<_PaymentModel> get copyWith => __$PaymentModelCopyWithImpl<_PaymentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.qrCodeUrl, qrCodeUrl) || other.qrCodeUrl == qrCodeUrl)&&(identical(other.qrCodeData, qrCodeData) || other.qrCodeData == qrCodeData)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.expireAt, expireAt) || other.expireAt == expireAt)&&(identical(other.remark, remark) || other.remark == remark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,paymentMethod,amount,status,qrCodeUrl,qrCodeData,transactionId,createdAt,paidAt,expireAt,remark);

@override
String toString() {
  return 'PaymentModel(id: $id, orderId: $orderId, paymentMethod: $paymentMethod, amount: $amount, status: $status, qrCodeUrl: $qrCodeUrl, qrCodeData: $qrCodeData, transactionId: $transactionId, createdAt: $createdAt, paidAt: $paidAt, expireAt: $expireAt, remark: $remark)';
}


}

/// @nodoc
abstract mixin class _$PaymentModelCopyWith<$Res> implements $PaymentModelCopyWith<$Res> {
  factory _$PaymentModelCopyWith(_PaymentModel value, $Res Function(_PaymentModel) _then) = __$PaymentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderId, String paymentMethod, double amount, PaymentStatus status, String? qrCodeUrl, String? qrCodeData, String? transactionId, DateTime createdAt, DateTime? paidAt, DateTime expireAt, String? remark
});




}
/// @nodoc
class __$PaymentModelCopyWithImpl<$Res>
    implements _$PaymentModelCopyWith<$Res> {
  __$PaymentModelCopyWithImpl(this._self, this._then);

  final _PaymentModel _self;
  final $Res Function(_PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = null,Object? paymentMethod = null,Object? amount = null,Object? status = null,Object? qrCodeUrl = freezed,Object? qrCodeData = freezed,Object? transactionId = freezed,Object? createdAt = null,Object? paidAt = freezed,Object? expireAt = null,Object? remark = freezed,}) {
  return _then(_PaymentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,qrCodeUrl: freezed == qrCodeUrl ? _self.qrCodeUrl : qrCodeUrl // ignore: cast_nullable_to_non_nullable
as String?,qrCodeData: freezed == qrCodeData ? _self.qrCodeData : qrCodeData // ignore: cast_nullable_to_non_nullable
as String?,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expireAt: null == expireAt ? _self.expireAt : expireAt // ignore: cast_nullable_to_non_nullable
as DateTime,remark: freezed == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
