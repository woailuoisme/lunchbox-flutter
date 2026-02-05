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
 String get deviceId;/// 设备信息
 DeviceModel? get device;/// 订单包含的商品列表
 List<CartItemModel> get items;/// 订单总金额
 double get totalAmount;/// 支付金额（可能包含优惠）
 double get paidAmount;/// 订单状态
 OrderStatus get status;/// 支付方式
 PaymentMethod? get paymentMethod;/// 订单创建时间
 DateTime get createdAt;/// 支付时间
 DateTime? get paidAt;/// 订单完成时间
 DateTime? get completedAt;/// 订单取消时间
 DateTime? get cancelledAt;/// 取货码（用于从设备取货）
 String? get pickupCode;/// 订单备注
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.device, device) || other.device == device)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.pickupCode, pickupCode) || other.pickupCode == pickupCode)&&(identical(other.remark, remark) || other.remark == remark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,deviceId,device,const DeepCollectionEquality().hash(items),totalAmount,paidAmount,status,paymentMethod,createdAt,paidAt,completedAt,cancelledAt,pickupCode,remark);

@override
String toString() {
  return 'OrderModel(id: $id, userId: $userId, deviceId: $deviceId, device: $device, items: $items, totalAmount: $totalAmount, paidAmount: $paidAmount, status: $status, paymentMethod: $paymentMethod, createdAt: $createdAt, paidAt: $paidAt, completedAt: $completedAt, cancelledAt: $cancelledAt, pickupCode: $pickupCode, remark: $remark)';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String deviceId, DeviceModel? device, List<CartItemModel> items, double totalAmount, double paidAmount, OrderStatus status, PaymentMethod? paymentMethod, DateTime createdAt, DateTime? paidAt, DateTime? completedAt, DateTime? cancelledAt, String? pickupCode, String? remark
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? deviceId = null,Object? device = freezed,Object? items = null,Object? totalAmount = null,Object? paidAmount = null,Object? status = null,Object? paymentMethod = freezed,Object? createdAt = null,Object? paidAt = freezed,Object? completedAt = freezed,Object? cancelledAt = freezed,Object? pickupCode = freezed,Object? remark = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as DeviceModel?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemModel>,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pickupCode: freezed == pickupCode ? _self.pickupCode : pickupCode // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String deviceId,  DeviceModel? device,  List<CartItemModel> items,  double totalAmount,  double paidAmount,  OrderStatus status,  PaymentMethod? paymentMethod,  DateTime createdAt,  DateTime? paidAt,  DateTime? completedAt,  DateTime? cancelledAt,  String? pickupCode,  String? remark)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.userId,_that.deviceId,_that.device,_that.items,_that.totalAmount,_that.paidAmount,_that.status,_that.paymentMethod,_that.createdAt,_that.paidAt,_that.completedAt,_that.cancelledAt,_that.pickupCode,_that.remark);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String deviceId,  DeviceModel? device,  List<CartItemModel> items,  double totalAmount,  double paidAmount,  OrderStatus status,  PaymentMethod? paymentMethod,  DateTime createdAt,  DateTime? paidAt,  DateTime? completedAt,  DateTime? cancelledAt,  String? pickupCode,  String? remark)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.id,_that.userId,_that.deviceId,_that.device,_that.items,_that.totalAmount,_that.paidAmount,_that.status,_that.paymentMethod,_that.createdAt,_that.paidAt,_that.completedAt,_that.cancelledAt,_that.pickupCode,_that.remark);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String deviceId,  DeviceModel? device,  List<CartItemModel> items,  double totalAmount,  double paidAmount,  OrderStatus status,  PaymentMethod? paymentMethod,  DateTime createdAt,  DateTime? paidAt,  DateTime? completedAt,  DateTime? cancelledAt,  String? pickupCode,  String? remark)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.userId,_that.deviceId,_that.device,_that.items,_that.totalAmount,_that.paidAmount,_that.status,_that.paymentMethod,_that.createdAt,_that.paidAt,_that.completedAt,_that.cancelledAt,_that.pickupCode,_that.remark);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel extends OrderModel {
  const _OrderModel({required this.id, required this.userId, required this.deviceId, this.device, required final  List<CartItemModel> items, required this.totalAmount, this.paidAmount = 0.0, this.status = OrderStatus.pending, this.paymentMethod, required this.createdAt, this.paidAt, this.completedAt, this.cancelledAt, this.pickupCode, this.remark}): _items = items,super._();
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

/// 订单ID
@override final  String id;
/// 用户ID
@override final  String userId;
/// 设备ID
@override final  String deviceId;
/// 设备信息
@override final  DeviceModel? device;
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
/// 支付金额（可能包含优惠）
@override@JsonKey() final  double paidAmount;
/// 订单状态
@override@JsonKey() final  OrderStatus status;
/// 支付方式
@override final  PaymentMethod? paymentMethod;
/// 订单创建时间
@override final  DateTime createdAt;
/// 支付时间
@override final  DateTime? paidAt;
/// 订单完成时间
@override final  DateTime? completedAt;
/// 订单取消时间
@override final  DateTime? cancelledAt;
/// 取货码（用于从设备取货）
@override final  String? pickupCode;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.device, device) || other.device == device)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.pickupCode, pickupCode) || other.pickupCode == pickupCode)&&(identical(other.remark, remark) || other.remark == remark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,deviceId,device,const DeepCollectionEquality().hash(_items),totalAmount,paidAmount,status,paymentMethod,createdAt,paidAt,completedAt,cancelledAt,pickupCode,remark);

@override
String toString() {
  return 'OrderModel(id: $id, userId: $userId, deviceId: $deviceId, device: $device, items: $items, totalAmount: $totalAmount, paidAmount: $paidAmount, status: $status, paymentMethod: $paymentMethod, createdAt: $createdAt, paidAt: $paidAt, completedAt: $completedAt, cancelledAt: $cancelledAt, pickupCode: $pickupCode, remark: $remark)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String deviceId, DeviceModel? device, List<CartItemModel> items, double totalAmount, double paidAmount, OrderStatus status, PaymentMethod? paymentMethod, DateTime createdAt, DateTime? paidAt, DateTime? completedAt, DateTime? cancelledAt, String? pickupCode, String? remark
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? deviceId = null,Object? device = freezed,Object? items = null,Object? totalAmount = null,Object? paidAmount = null,Object? status = null,Object? paymentMethod = freezed,Object? createdAt = null,Object? paidAt = freezed,Object? completedAt = freezed,Object? cancelledAt = freezed,Object? pickupCode = freezed,Object? remark = freezed,}) {
  return _then(_OrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as DeviceModel?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemModel>,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pickupCode: freezed == pickupCode ? _self.pickupCode : pickupCode // ignore: cast_nullable_to_non_nullable
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
