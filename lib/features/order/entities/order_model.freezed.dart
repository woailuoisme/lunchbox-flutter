// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderUserModel {

 int get id; String get nickname; String get telephone;
/// Create a copy of OrderUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderUserModelCopyWith<OrderUserModel> get copyWith => _$OrderUserModelCopyWithImpl<OrderUserModel>(this as OrderUserModel, _$identity);

  /// Serializes this OrderUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.telephone, telephone) || other.telephone == telephone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nickname,telephone);

@override
String toString() {
  return 'OrderUserModel(id: $id, nickname: $nickname, telephone: $telephone)';
}


}

/// @nodoc
abstract mixin class $OrderUserModelCopyWith<$Res>  {
  factory $OrderUserModelCopyWith(OrderUserModel value, $Res Function(OrderUserModel) _then) = _$OrderUserModelCopyWithImpl;
@useResult
$Res call({
 int id, String nickname, String telephone
});




}
/// @nodoc
class _$OrderUserModelCopyWithImpl<$Res>
    implements $OrderUserModelCopyWith<$Res> {
  _$OrderUserModelCopyWithImpl(this._self, this._then);

  final OrderUserModel _self;
  final $Res Function(OrderUserModel) _then;

/// Create a copy of OrderUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nickname = null,Object? telephone = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,telephone: null == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderUserModel].
extension OrderUserModelPatterns on OrderUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderUserModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String nickname,  String telephone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderUserModel() when $default != null:
return $default(_that.id,_that.nickname,_that.telephone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String nickname,  String telephone)  $default,) {final _that = this;
switch (_that) {
case _OrderUserModel():
return $default(_that.id,_that.nickname,_that.telephone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String nickname,  String telephone)?  $default,) {final _that = this;
switch (_that) {
case _OrderUserModel() when $default != null:
return $default(_that.id,_that.nickname,_that.telephone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderUserModel implements OrderUserModel {
  const _OrderUserModel({required this.id, required this.nickname, required this.telephone});
  factory _OrderUserModel.fromJson(Map<String, dynamic> json) => _$OrderUserModelFromJson(json);

@override final  int id;
@override final  String nickname;
@override final  String telephone;

/// Create a copy of OrderUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderUserModelCopyWith<_OrderUserModel> get copyWith => __$OrderUserModelCopyWithImpl<_OrderUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.telephone, telephone) || other.telephone == telephone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nickname,telephone);

@override
String toString() {
  return 'OrderUserModel(id: $id, nickname: $nickname, telephone: $telephone)';
}


}

/// @nodoc
abstract mixin class _$OrderUserModelCopyWith<$Res> implements $OrderUserModelCopyWith<$Res> {
  factory _$OrderUserModelCopyWith(_OrderUserModel value, $Res Function(_OrderUserModel) _then) = __$OrderUserModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String nickname, String telephone
});




}
/// @nodoc
class __$OrderUserModelCopyWithImpl<$Res>
    implements _$OrderUserModelCopyWith<$Res> {
  __$OrderUserModelCopyWithImpl(this._self, this._then);

  final _OrderUserModel _self;
  final $Res Function(_OrderUserModel) _then;

/// Create a copy of OrderUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nickname = null,Object? telephone = null,}) {
  return _then(_OrderUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,telephone: null == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OrderDeviceModel {

 int get id; String get sn;
/// Create a copy of OrderDeviceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDeviceModelCopyWith<OrderDeviceModel> get copyWith => _$OrderDeviceModelCopyWithImpl<OrderDeviceModel>(this as OrderDeviceModel, _$identity);

  /// Serializes this OrderDeviceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDeviceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sn, sn) || other.sn == sn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sn);

@override
String toString() {
  return 'OrderDeviceModel(id: $id, sn: $sn)';
}


}

/// @nodoc
abstract mixin class $OrderDeviceModelCopyWith<$Res>  {
  factory $OrderDeviceModelCopyWith(OrderDeviceModel value, $Res Function(OrderDeviceModel) _then) = _$OrderDeviceModelCopyWithImpl;
@useResult
$Res call({
 int id, String sn
});




}
/// @nodoc
class _$OrderDeviceModelCopyWithImpl<$Res>
    implements $OrderDeviceModelCopyWith<$Res> {
  _$OrderDeviceModelCopyWithImpl(this._self, this._then);

  final OrderDeviceModel _self;
  final $Res Function(OrderDeviceModel) _then;

/// Create a copy of OrderDeviceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sn = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sn: null == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDeviceModel].
extension OrderDeviceModelPatterns on OrderDeviceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDeviceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDeviceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDeviceModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderDeviceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDeviceModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDeviceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String sn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDeviceModel() when $default != null:
return $default(_that.id,_that.sn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String sn)  $default,) {final _that = this;
switch (_that) {
case _OrderDeviceModel():
return $default(_that.id,_that.sn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String sn)?  $default,) {final _that = this;
switch (_that) {
case _OrderDeviceModel() when $default != null:
return $default(_that.id,_that.sn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDeviceModel implements OrderDeviceModel {
  const _OrderDeviceModel({required this.id, required this.sn});
  factory _OrderDeviceModel.fromJson(Map<String, dynamic> json) => _$OrderDeviceModelFromJson(json);

@override final  int id;
@override final  String sn;

/// Create a copy of OrderDeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDeviceModelCopyWith<_OrderDeviceModel> get copyWith => __$OrderDeviceModelCopyWithImpl<_OrderDeviceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDeviceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDeviceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sn, sn) || other.sn == sn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sn);

@override
String toString() {
  return 'OrderDeviceModel(id: $id, sn: $sn)';
}


}

/// @nodoc
abstract mixin class _$OrderDeviceModelCopyWith<$Res> implements $OrderDeviceModelCopyWith<$Res> {
  factory _$OrderDeviceModelCopyWith(_OrderDeviceModel value, $Res Function(_OrderDeviceModel) _then) = __$OrderDeviceModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String sn
});




}
/// @nodoc
class __$OrderDeviceModelCopyWithImpl<$Res>
    implements _$OrderDeviceModelCopyWith<$Res> {
  __$OrderDeviceModelCopyWithImpl(this._self, this._then);

  final _OrderDeviceModel _self;
  final $Res Function(_OrderDeviceModel) _then;

/// Create a copy of OrderDeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sn = null,}) {
  return _then(_OrderDeviceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sn: null == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OrderModel {

/// 订单ID
 int get id;/// 用户信息
 OrderUserModel get user;/// 订单流水号
 String get sn;/// 设备信息
 OrderDeviceModel? get device;/// 订单金额状态 (String)
@JsonKey(name: 'order_status') String get orderStatusAmount;/// 标称金额
@JsonKey(name: 'nominal_amount') String get nominalAmount;/// 支付金额
@JsonKey(name: 'pay_amount') String get payAmount;/// 优惠金额
@JsonKey(name: 'coupon_amount') String get couponAmount;/// 支付流水号
@JsonKey(name: 'pay_sn') String? get paySn;/// 外部支付流水号
@JsonKey(name: 'pay_external_sn') String? get payExternalSn;/// 支付方式
@JsonKey(name: 'pay_type') PaymentMethod? get payType;/// 支付状态
@JsonKey(name: 'pay_status') PayStatus? get payStatus;/// 用户评论数
@JsonKey(name: 'user_comments_count') int get userCommentsCount;/// 用户是否已评价
@JsonKey(name: 'user_has_comments') bool get userHasComments;/// 订单状态
 OrderStatus get status;/// 取餐二维码图片 (Base64 or URL)
@JsonKey(name: 'qr_code_image') String? get qrCodeImage;/// 订单创建时间
@JsonKey(name: 'created_at') String get createdAt;/// 订单包含的商品列表
 List<OrderProductModel> get products;
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderModelCopyWith<OrderModel> get copyWith => _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.sn, sn) || other.sn == sn)&&(identical(other.device, device) || other.device == device)&&(identical(other.orderStatusAmount, orderStatusAmount) || other.orderStatusAmount == orderStatusAmount)&&(identical(other.nominalAmount, nominalAmount) || other.nominalAmount == nominalAmount)&&(identical(other.payAmount, payAmount) || other.payAmount == payAmount)&&(identical(other.couponAmount, couponAmount) || other.couponAmount == couponAmount)&&(identical(other.paySn, paySn) || other.paySn == paySn)&&(identical(other.payExternalSn, payExternalSn) || other.payExternalSn == payExternalSn)&&(identical(other.payType, payType) || other.payType == payType)&&(identical(other.payStatus, payStatus) || other.payStatus == payStatus)&&(identical(other.userCommentsCount, userCommentsCount) || other.userCommentsCount == userCommentsCount)&&(identical(other.userHasComments, userHasComments) || other.userHasComments == userHasComments)&&(identical(other.status, status) || other.status == status)&&(identical(other.qrCodeImage, qrCodeImage) || other.qrCodeImage == qrCodeImage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.products, products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,sn,device,orderStatusAmount,nominalAmount,payAmount,couponAmount,paySn,payExternalSn,payType,payStatus,userCommentsCount,userHasComments,status,qrCodeImage,createdAt,const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'OrderModel(id: $id, user: $user, sn: $sn, device: $device, orderStatusAmount: $orderStatusAmount, nominalAmount: $nominalAmount, payAmount: $payAmount, couponAmount: $couponAmount, paySn: $paySn, payExternalSn: $payExternalSn, payType: $payType, payStatus: $payStatus, userCommentsCount: $userCommentsCount, userHasComments: $userHasComments, status: $status, qrCodeImage: $qrCodeImage, createdAt: $createdAt, products: $products)';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
 int id, OrderUserModel user, String sn, OrderDeviceModel? device,@JsonKey(name: 'order_status') String orderStatusAmount,@JsonKey(name: 'nominal_amount') String nominalAmount,@JsonKey(name: 'pay_amount') String payAmount,@JsonKey(name: 'coupon_amount') String couponAmount,@JsonKey(name: 'pay_sn') String? paySn,@JsonKey(name: 'pay_external_sn') String? payExternalSn,@JsonKey(name: 'pay_type') PaymentMethod? payType,@JsonKey(name: 'pay_status') PayStatus? payStatus,@JsonKey(name: 'user_comments_count') int userCommentsCount,@JsonKey(name: 'user_has_comments') bool userHasComments, OrderStatus status,@JsonKey(name: 'qr_code_image') String? qrCodeImage,@JsonKey(name: 'created_at') String createdAt, List<OrderProductModel> products
});


$OrderUserModelCopyWith<$Res> get user;$OrderDeviceModelCopyWith<$Res>? get device;

}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? user = null,Object? sn = null,Object? device = freezed,Object? orderStatusAmount = null,Object? nominalAmount = null,Object? payAmount = null,Object? couponAmount = null,Object? paySn = freezed,Object? payExternalSn = freezed,Object? payType = freezed,Object? payStatus = freezed,Object? userCommentsCount = null,Object? userHasComments = null,Object? status = null,Object? qrCodeImage = freezed,Object? createdAt = null,Object? products = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as OrderUserModel,sn: null == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as String,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as OrderDeviceModel?,orderStatusAmount: null == orderStatusAmount ? _self.orderStatusAmount : orderStatusAmount // ignore: cast_nullable_to_non_nullable
as String,nominalAmount: null == nominalAmount ? _self.nominalAmount : nominalAmount // ignore: cast_nullable_to_non_nullable
as String,payAmount: null == payAmount ? _self.payAmount : payAmount // ignore: cast_nullable_to_non_nullable
as String,couponAmount: null == couponAmount ? _self.couponAmount : couponAmount // ignore: cast_nullable_to_non_nullable
as String,paySn: freezed == paySn ? _self.paySn : paySn // ignore: cast_nullable_to_non_nullable
as String?,payExternalSn: freezed == payExternalSn ? _self.payExternalSn : payExternalSn // ignore: cast_nullable_to_non_nullable
as String?,payType: freezed == payType ? _self.payType : payType // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,payStatus: freezed == payStatus ? _self.payStatus : payStatus // ignore: cast_nullable_to_non_nullable
as PayStatus?,userCommentsCount: null == userCommentsCount ? _self.userCommentsCount : userCommentsCount // ignore: cast_nullable_to_non_nullable
as int,userHasComments: null == userHasComments ? _self.userHasComments : userHasComments // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,qrCodeImage: freezed == qrCodeImage ? _self.qrCodeImage : qrCodeImage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<OrderProductModel>,
  ));
}
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderUserModelCopyWith<$Res> get user {
  
  return $OrderUserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDeviceModelCopyWith<$Res>? get device {
    if (_self.device == null) {
    return null;
  }

  return $OrderDeviceModelCopyWith<$Res>(_self.device!, (value) {
    return _then(_self.copyWith(device: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  OrderUserModel user,  String sn,  OrderDeviceModel? device, @JsonKey(name: 'order_status')  String orderStatusAmount, @JsonKey(name: 'nominal_amount')  String nominalAmount, @JsonKey(name: 'pay_amount')  String payAmount, @JsonKey(name: 'coupon_amount')  String couponAmount, @JsonKey(name: 'pay_sn')  String? paySn, @JsonKey(name: 'pay_external_sn')  String? payExternalSn, @JsonKey(name: 'pay_type')  PaymentMethod? payType, @JsonKey(name: 'pay_status')  PayStatus? payStatus, @JsonKey(name: 'user_comments_count')  int userCommentsCount, @JsonKey(name: 'user_has_comments')  bool userHasComments,  OrderStatus status, @JsonKey(name: 'qr_code_image')  String? qrCodeImage, @JsonKey(name: 'created_at')  String createdAt,  List<OrderProductModel> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.user,_that.sn,_that.device,_that.orderStatusAmount,_that.nominalAmount,_that.payAmount,_that.couponAmount,_that.paySn,_that.payExternalSn,_that.payType,_that.payStatus,_that.userCommentsCount,_that.userHasComments,_that.status,_that.qrCodeImage,_that.createdAt,_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  OrderUserModel user,  String sn,  OrderDeviceModel? device, @JsonKey(name: 'order_status')  String orderStatusAmount, @JsonKey(name: 'nominal_amount')  String nominalAmount, @JsonKey(name: 'pay_amount')  String payAmount, @JsonKey(name: 'coupon_amount')  String couponAmount, @JsonKey(name: 'pay_sn')  String? paySn, @JsonKey(name: 'pay_external_sn')  String? payExternalSn, @JsonKey(name: 'pay_type')  PaymentMethod? payType, @JsonKey(name: 'pay_status')  PayStatus? payStatus, @JsonKey(name: 'user_comments_count')  int userCommentsCount, @JsonKey(name: 'user_has_comments')  bool userHasComments,  OrderStatus status, @JsonKey(name: 'qr_code_image')  String? qrCodeImage, @JsonKey(name: 'created_at')  String createdAt,  List<OrderProductModel> products)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.id,_that.user,_that.sn,_that.device,_that.orderStatusAmount,_that.nominalAmount,_that.payAmount,_that.couponAmount,_that.paySn,_that.payExternalSn,_that.payType,_that.payStatus,_that.userCommentsCount,_that.userHasComments,_that.status,_that.qrCodeImage,_that.createdAt,_that.products);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  OrderUserModel user,  String sn,  OrderDeviceModel? device, @JsonKey(name: 'order_status')  String orderStatusAmount, @JsonKey(name: 'nominal_amount')  String nominalAmount, @JsonKey(name: 'pay_amount')  String payAmount, @JsonKey(name: 'coupon_amount')  String couponAmount, @JsonKey(name: 'pay_sn')  String? paySn, @JsonKey(name: 'pay_external_sn')  String? payExternalSn, @JsonKey(name: 'pay_type')  PaymentMethod? payType, @JsonKey(name: 'pay_status')  PayStatus? payStatus, @JsonKey(name: 'user_comments_count')  int userCommentsCount, @JsonKey(name: 'user_has_comments')  bool userHasComments,  OrderStatus status, @JsonKey(name: 'qr_code_image')  String? qrCodeImage, @JsonKey(name: 'created_at')  String createdAt,  List<OrderProductModel> products)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.user,_that.sn,_that.device,_that.orderStatusAmount,_that.nominalAmount,_that.payAmount,_that.couponAmount,_that.paySn,_that.payExternalSn,_that.payType,_that.payStatus,_that.userCommentsCount,_that.userHasComments,_that.status,_that.qrCodeImage,_that.createdAt,_that.products);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel extends OrderModel {
  const _OrderModel({required this.id, required this.user, required this.sn, this.device, @JsonKey(name: 'order_status') required this.orderStatusAmount, @JsonKey(name: 'nominal_amount') required this.nominalAmount, @JsonKey(name: 'pay_amount') required this.payAmount, @JsonKey(name: 'coupon_amount') required this.couponAmount, @JsonKey(name: 'pay_sn') this.paySn, @JsonKey(name: 'pay_external_sn') this.payExternalSn, @JsonKey(name: 'pay_type') this.payType, @JsonKey(name: 'pay_status') this.payStatus, @JsonKey(name: 'user_comments_count') required this.userCommentsCount, @JsonKey(name: 'user_has_comments') required this.userHasComments, required this.status, @JsonKey(name: 'qr_code_image') this.qrCodeImage, @JsonKey(name: 'created_at') required this.createdAt, required final  List<OrderProductModel> products}): _products = products,super._();
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

/// 订单ID
@override final  int id;
/// 用户信息
@override final  OrderUserModel user;
/// 订单流水号
@override final  String sn;
/// 设备信息
@override final  OrderDeviceModel? device;
/// 订单金额状态 (String)
@override@JsonKey(name: 'order_status') final  String orderStatusAmount;
/// 标称金额
@override@JsonKey(name: 'nominal_amount') final  String nominalAmount;
/// 支付金额
@override@JsonKey(name: 'pay_amount') final  String payAmount;
/// 优惠金额
@override@JsonKey(name: 'coupon_amount') final  String couponAmount;
/// 支付流水号
@override@JsonKey(name: 'pay_sn') final  String? paySn;
/// 外部支付流水号
@override@JsonKey(name: 'pay_external_sn') final  String? payExternalSn;
/// 支付方式
@override@JsonKey(name: 'pay_type') final  PaymentMethod? payType;
/// 支付状态
@override@JsonKey(name: 'pay_status') final  PayStatus? payStatus;
/// 用户评论数
@override@JsonKey(name: 'user_comments_count') final  int userCommentsCount;
/// 用户是否已评价
@override@JsonKey(name: 'user_has_comments') final  bool userHasComments;
/// 订单状态
@override final  OrderStatus status;
/// 取餐二维码图片 (Base64 or URL)
@override@JsonKey(name: 'qr_code_image') final  String? qrCodeImage;
/// 订单创建时间
@override@JsonKey(name: 'created_at') final  String createdAt;
/// 订单包含的商品列表
 final  List<OrderProductModel> _products;
/// 订单包含的商品列表
@override List<OrderProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderModelCopyWith<_OrderModel> get copyWith => __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.sn, sn) || other.sn == sn)&&(identical(other.device, device) || other.device == device)&&(identical(other.orderStatusAmount, orderStatusAmount) || other.orderStatusAmount == orderStatusAmount)&&(identical(other.nominalAmount, nominalAmount) || other.nominalAmount == nominalAmount)&&(identical(other.payAmount, payAmount) || other.payAmount == payAmount)&&(identical(other.couponAmount, couponAmount) || other.couponAmount == couponAmount)&&(identical(other.paySn, paySn) || other.paySn == paySn)&&(identical(other.payExternalSn, payExternalSn) || other.payExternalSn == payExternalSn)&&(identical(other.payType, payType) || other.payType == payType)&&(identical(other.payStatus, payStatus) || other.payStatus == payStatus)&&(identical(other.userCommentsCount, userCommentsCount) || other.userCommentsCount == userCommentsCount)&&(identical(other.userHasComments, userHasComments) || other.userHasComments == userHasComments)&&(identical(other.status, status) || other.status == status)&&(identical(other.qrCodeImage, qrCodeImage) || other.qrCodeImage == qrCodeImage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._products, _products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,sn,device,orderStatusAmount,nominalAmount,payAmount,couponAmount,paySn,payExternalSn,payType,payStatus,userCommentsCount,userHasComments,status,qrCodeImage,createdAt,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'OrderModel(id: $id, user: $user, sn: $sn, device: $device, orderStatusAmount: $orderStatusAmount, nominalAmount: $nominalAmount, payAmount: $payAmount, couponAmount: $couponAmount, paySn: $paySn, payExternalSn: $payExternalSn, payType: $payType, payStatus: $payStatus, userCommentsCount: $userCommentsCount, userHasComments: $userHasComments, status: $status, qrCodeImage: $qrCodeImage, createdAt: $createdAt, products: $products)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
 int id, OrderUserModel user, String sn, OrderDeviceModel? device,@JsonKey(name: 'order_status') String orderStatusAmount,@JsonKey(name: 'nominal_amount') String nominalAmount,@JsonKey(name: 'pay_amount') String payAmount,@JsonKey(name: 'coupon_amount') String couponAmount,@JsonKey(name: 'pay_sn') String? paySn,@JsonKey(name: 'pay_external_sn') String? payExternalSn,@JsonKey(name: 'pay_type') PaymentMethod? payType,@JsonKey(name: 'pay_status') PayStatus? payStatus,@JsonKey(name: 'user_comments_count') int userCommentsCount,@JsonKey(name: 'user_has_comments') bool userHasComments, OrderStatus status,@JsonKey(name: 'qr_code_image') String? qrCodeImage,@JsonKey(name: 'created_at') String createdAt, List<OrderProductModel> products
});


@override $OrderUserModelCopyWith<$Res> get user;@override $OrderDeviceModelCopyWith<$Res>? get device;

}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? user = null,Object? sn = null,Object? device = freezed,Object? orderStatusAmount = null,Object? nominalAmount = null,Object? payAmount = null,Object? couponAmount = null,Object? paySn = freezed,Object? payExternalSn = freezed,Object? payType = freezed,Object? payStatus = freezed,Object? userCommentsCount = null,Object? userHasComments = null,Object? status = null,Object? qrCodeImage = freezed,Object? createdAt = null,Object? products = null,}) {
  return _then(_OrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as OrderUserModel,sn: null == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as String,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as OrderDeviceModel?,orderStatusAmount: null == orderStatusAmount ? _self.orderStatusAmount : orderStatusAmount // ignore: cast_nullable_to_non_nullable
as String,nominalAmount: null == nominalAmount ? _self.nominalAmount : nominalAmount // ignore: cast_nullable_to_non_nullable
as String,payAmount: null == payAmount ? _self.payAmount : payAmount // ignore: cast_nullable_to_non_nullable
as String,couponAmount: null == couponAmount ? _self.couponAmount : couponAmount // ignore: cast_nullable_to_non_nullable
as String,paySn: freezed == paySn ? _self.paySn : paySn // ignore: cast_nullable_to_non_nullable
as String?,payExternalSn: freezed == payExternalSn ? _self.payExternalSn : payExternalSn // ignore: cast_nullable_to_non_nullable
as String?,payType: freezed == payType ? _self.payType : payType // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,payStatus: freezed == payStatus ? _self.payStatus : payStatus // ignore: cast_nullable_to_non_nullable
as PayStatus?,userCommentsCount: null == userCommentsCount ? _self.userCommentsCount : userCommentsCount // ignore: cast_nullable_to_non_nullable
as int,userHasComments: null == userHasComments ? _self.userHasComments : userHasComments // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,qrCodeImage: freezed == qrCodeImage ? _self.qrCodeImage : qrCodeImage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<OrderProductModel>,
  ));
}

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderUserModelCopyWith<$Res> get user {
  
  return $OrderUserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDeviceModelCopyWith<$Res>? get device {
    if (_self.device == null) {
    return null;
  }

  return $OrderDeviceModelCopyWith<$Res>(_self.device!, (value) {
    return _then(_self.copyWith(device: value));
  });
}
}

// dart format on
