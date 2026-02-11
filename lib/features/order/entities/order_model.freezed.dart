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
mixin _$OrderModel {

/// 订单ID
 String get id;/// 用户ID
 String get userId;/// 设备ID
 String get deviceId;/// 订单包含的商品列表
 List<CartItemModel> get items;/// 订单总金额
 double get totalAmount;/// 订单创建时间
 DateTime get createdAt;/// 设备信息
 DeviceModel? get device;/// 支付金额（可能包含优惠）
 double get paidAmount;/// 订单状态
 OrderStatus get status;/// 支付方式
 PaymentMethod? get paymentMethod;/// 支付时间
 DateTime? get paidAt;/// 订单完成时间
 DateTime? get completedAt;/// 订单取消时间
 DateTime? get cancelledAt;/// 取货码（用于从设备取货）
 String? get pickupCode;/// 取餐提示（如：请前往1号窗口取餐）
 String? get pickupHint;/// 堂食码
 String? get diningCode;/// 门店名称
 String? get storeName;/// 门店地址
 String? get storeAddress;/// 门店电话
 String? get storePhone;/// 二维码数据
 String? get qrCodeData;/// 订单备注
 String? get remark;
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderModelCopyWith<OrderModel> get copyWith => _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.device, device) || other.device == device)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.pickupCode, pickupCode) || other.pickupCode == pickupCode)&&(identical(other.pickupHint, pickupHint) || other.pickupHint == pickupHint)&&(identical(other.diningCode, diningCode) || other.diningCode == diningCode)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.storeAddress, storeAddress) || other.storeAddress == storeAddress)&&(identical(other.storePhone, storePhone) || other.storePhone == storePhone)&&(identical(other.qrCodeData, qrCodeData) || other.qrCodeData == qrCodeData)&&(identical(other.remark, remark) || other.remark == remark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,deviceId,const DeepCollectionEquality().hash(items),totalAmount,createdAt,device,paidAmount,status,paymentMethod,paidAt,completedAt,cancelledAt,pickupCode,pickupHint,diningCode,storeName,storeAddress,storePhone,qrCodeData,remark]);

@override
String toString() {
  return 'OrderModel(id: $id, userId: $userId, deviceId: $deviceId, items: $items, totalAmount: $totalAmount, createdAt: $createdAt, device: $device, paidAmount: $paidAmount, status: $status, paymentMethod: $paymentMethod, paidAt: $paidAt, completedAt: $completedAt, cancelledAt: $cancelledAt, pickupCode: $pickupCode, pickupHint: $pickupHint, diningCode: $diningCode, storeName: $storeName, storeAddress: $storeAddress, storePhone: $storePhone, qrCodeData: $qrCodeData, remark: $remark)';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String deviceId, List<CartItemModel> items, double totalAmount, DateTime createdAt, DeviceModel? device, double paidAmount, OrderStatus status, PaymentMethod? paymentMethod, DateTime? paidAt, DateTime? completedAt, DateTime? cancelledAt, String? pickupCode, String? pickupHint, String? diningCode, String? storeName, String? storeAddress, String? storePhone, String? qrCodeData, String? remark
});


$DeviceModelCopyWith<$Res>? get device;

}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? deviceId = null,Object? items = null,Object? totalAmount = null,Object? createdAt = null,Object? device = freezed,Object? paidAmount = null,Object? status = null,Object? paymentMethod = freezed,Object? paidAt = freezed,Object? completedAt = freezed,Object? cancelledAt = freezed,Object? pickupCode = freezed,Object? pickupHint = freezed,Object? diningCode = freezed,Object? storeName = freezed,Object? storeAddress = freezed,Object? storePhone = freezed,Object? qrCodeData = freezed,Object? remark = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemModel>,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as DeviceModel?,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pickupCode: freezed == pickupCode ? _self.pickupCode : pickupCode // ignore: cast_nullable_to_non_nullable
as String?,pickupHint: freezed == pickupHint ? _self.pickupHint : pickupHint // ignore: cast_nullable_to_non_nullable
as String?,diningCode: freezed == diningCode ? _self.diningCode : diningCode // ignore: cast_nullable_to_non_nullable
as String?,storeName: freezed == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String?,storeAddress: freezed == storeAddress ? _self.storeAddress : storeAddress // ignore: cast_nullable_to_non_nullable
as String?,storePhone: freezed == storePhone ? _self.storePhone : storePhone // ignore: cast_nullable_to_non_nullable
as String?,qrCodeData: freezed == qrCodeData ? _self.qrCodeData : qrCodeData // ignore: cast_nullable_to_non_nullable
as String?,remark: freezed == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceModelCopyWith<$Res>? get device {
    if (_self.device == null) {
    return null;
  }

  return $DeviceModelCopyWith<$Res>(_self.device!, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String deviceId,  List<CartItemModel> items,  double totalAmount,  DateTime createdAt,  DeviceModel? device,  double paidAmount,  OrderStatus status,  PaymentMethod? paymentMethod,  DateTime? paidAt,  DateTime? completedAt,  DateTime? cancelledAt,  String? pickupCode,  String? pickupHint,  String? diningCode,  String? storeName,  String? storeAddress,  String? storePhone,  String? qrCodeData,  String? remark)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.userId,_that.deviceId,_that.items,_that.totalAmount,_that.createdAt,_that.device,_that.paidAmount,_that.status,_that.paymentMethod,_that.paidAt,_that.completedAt,_that.cancelledAt,_that.pickupCode,_that.pickupHint,_that.diningCode,_that.storeName,_that.storeAddress,_that.storePhone,_that.qrCodeData,_that.remark);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String deviceId,  List<CartItemModel> items,  double totalAmount,  DateTime createdAt,  DeviceModel? device,  double paidAmount,  OrderStatus status,  PaymentMethod? paymentMethod,  DateTime? paidAt,  DateTime? completedAt,  DateTime? cancelledAt,  String? pickupCode,  String? pickupHint,  String? diningCode,  String? storeName,  String? storeAddress,  String? storePhone,  String? qrCodeData,  String? remark)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.id,_that.userId,_that.deviceId,_that.items,_that.totalAmount,_that.createdAt,_that.device,_that.paidAmount,_that.status,_that.paymentMethod,_that.paidAt,_that.completedAt,_that.cancelledAt,_that.pickupCode,_that.pickupHint,_that.diningCode,_that.storeName,_that.storeAddress,_that.storePhone,_that.qrCodeData,_that.remark);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String deviceId,  List<CartItemModel> items,  double totalAmount,  DateTime createdAt,  DeviceModel? device,  double paidAmount,  OrderStatus status,  PaymentMethod? paymentMethod,  DateTime? paidAt,  DateTime? completedAt,  DateTime? cancelledAt,  String? pickupCode,  String? pickupHint,  String? diningCode,  String? storeName,  String? storeAddress,  String? storePhone,  String? qrCodeData,  String? remark)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.userId,_that.deviceId,_that.items,_that.totalAmount,_that.createdAt,_that.device,_that.paidAmount,_that.status,_that.paymentMethod,_that.paidAt,_that.completedAt,_that.cancelledAt,_that.pickupCode,_that.pickupHint,_that.diningCode,_that.storeName,_that.storeAddress,_that.storePhone,_that.qrCodeData,_that.remark);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel extends OrderModel {
  const _OrderModel({required this.id, required this.userId, required this.deviceId, required final  List<CartItemModel> items, required this.totalAmount, required this.createdAt, this.device, this.paidAmount = 0.0, this.status = OrderStatus.pending, this.paymentMethod, this.paidAt, this.completedAt, this.cancelledAt, this.pickupCode, this.pickupHint, this.diningCode, this.storeName, this.storeAddress, this.storePhone, this.qrCodeData, this.remark}): _items = items,super._();
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

/// 订单ID
@override final  String id;
/// 用户ID
@override final  String userId;
/// 设备ID
@override final  String deviceId;
/// 订单包含的商品列表
 final  List<CartItemModel> _items;
/// 订单包含的商品列表
@override List<CartItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

/// 订单总金额
@override final  double totalAmount;
/// 订单创建时间
@override final  DateTime createdAt;
/// 设备信息
@override final  DeviceModel? device;
/// 支付金额（可能包含优惠）
@override@JsonKey() final  double paidAmount;
/// 订单状态
@override@JsonKey() final  OrderStatus status;
/// 支付方式
@override final  PaymentMethod? paymentMethod;
/// 支付时间
@override final  DateTime? paidAt;
/// 订单完成时间
@override final  DateTime? completedAt;
/// 订单取消时间
@override final  DateTime? cancelledAt;
/// 取货码（用于从设备取货）
@override final  String? pickupCode;
/// 取餐提示（如：请前往1号窗口取餐）
@override final  String? pickupHint;
/// 堂食码
@override final  String? diningCode;
/// 门店名称
@override final  String? storeName;
/// 门店地址
@override final  String? storeAddress;
/// 门店电话
@override final  String? storePhone;
/// 二维码数据
@override final  String? qrCodeData;
/// 订单备注
@override final  String? remark;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.device, device) || other.device == device)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.pickupCode, pickupCode) || other.pickupCode == pickupCode)&&(identical(other.pickupHint, pickupHint) || other.pickupHint == pickupHint)&&(identical(other.diningCode, diningCode) || other.diningCode == diningCode)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.storeAddress, storeAddress) || other.storeAddress == storeAddress)&&(identical(other.storePhone, storePhone) || other.storePhone == storePhone)&&(identical(other.qrCodeData, qrCodeData) || other.qrCodeData == qrCodeData)&&(identical(other.remark, remark) || other.remark == remark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,deviceId,const DeepCollectionEquality().hash(_items),totalAmount,createdAt,device,paidAmount,status,paymentMethod,paidAt,completedAt,cancelledAt,pickupCode,pickupHint,diningCode,storeName,storeAddress,storePhone,qrCodeData,remark]);

@override
String toString() {
  return 'OrderModel(id: $id, userId: $userId, deviceId: $deviceId, items: $items, totalAmount: $totalAmount, createdAt: $createdAt, device: $device, paidAmount: $paidAmount, status: $status, paymentMethod: $paymentMethod, paidAt: $paidAt, completedAt: $completedAt, cancelledAt: $cancelledAt, pickupCode: $pickupCode, pickupHint: $pickupHint, diningCode: $diningCode, storeName: $storeName, storeAddress: $storeAddress, storePhone: $storePhone, qrCodeData: $qrCodeData, remark: $remark)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String deviceId, List<CartItemModel> items, double totalAmount, DateTime createdAt, DeviceModel? device, double paidAmount, OrderStatus status, PaymentMethod? paymentMethod, DateTime? paidAt, DateTime? completedAt, DateTime? cancelledAt, String? pickupCode, String? pickupHint, String? diningCode, String? storeName, String? storeAddress, String? storePhone, String? qrCodeData, String? remark
});


@override $DeviceModelCopyWith<$Res>? get device;

}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? deviceId = null,Object? items = null,Object? totalAmount = null,Object? createdAt = null,Object? device = freezed,Object? paidAmount = null,Object? status = null,Object? paymentMethod = freezed,Object? paidAt = freezed,Object? completedAt = freezed,Object? cancelledAt = freezed,Object? pickupCode = freezed,Object? pickupHint = freezed,Object? diningCode = freezed,Object? storeName = freezed,Object? storeAddress = freezed,Object? storePhone = freezed,Object? qrCodeData = freezed,Object? remark = freezed,}) {
  return _then(_OrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemModel>,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as DeviceModel?,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pickupCode: freezed == pickupCode ? _self.pickupCode : pickupCode // ignore: cast_nullable_to_non_nullable
as String?,pickupHint: freezed == pickupHint ? _self.pickupHint : pickupHint // ignore: cast_nullable_to_non_nullable
as String?,diningCode: freezed == diningCode ? _self.diningCode : diningCode // ignore: cast_nullable_to_non_nullable
as String?,storeName: freezed == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String?,storeAddress: freezed == storeAddress ? _self.storeAddress : storeAddress // ignore: cast_nullable_to_non_nullable
as String?,storePhone: freezed == storePhone ? _self.storePhone : storePhone // ignore: cast_nullable_to_non_nullable
as String?,qrCodeData: freezed == qrCodeData ? _self.qrCodeData : qrCodeData // ignore: cast_nullable_to_non_nullable
as String?,remark: freezed == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceModelCopyWith<$Res>? get device {
    if (_self.device == null) {
    return null;
  }

  return $DeviceModelCopyWith<$Res>(_self.device!, (value) {
    return _then(_self.copyWith(device: value));
  });
}
}

// dart format on
