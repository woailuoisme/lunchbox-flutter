// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceModel {

/// 设备ID
 String get id;/// 设备名称
 String get name;/// 设备所在城市ID
 String get cityId;/// 设备地址
 String get address;/// 设备经度
 double get longitude;/// 设备纬度
 double get latitude;/// 设备状态：online、offline、maintenance
 String get status;/// 设备距离用户的距离（单位：米）
 double? get distance;/// 设备包含的产品列表
 List<ProductModel>? get products;/// 设备是否支持现金支付
 bool get supportCashPayment;/// 设备是否支持移动支付
 bool get supportMobilePayment;/// 设备最后在线时间
 DateTime? get lastOnlineTime;/// 设备更新时间
 DateTime get updateTime;
/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceModelCopyWith<DeviceModel> get copyWith => _$DeviceModelCopyWithImpl<DeviceModel>(this as DeviceModel, _$identity);

  /// Serializes this DeviceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.address, address) || other.address == address)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.distance, distance) || other.distance == distance)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.supportCashPayment, supportCashPayment) || other.supportCashPayment == supportCashPayment)&&(identical(other.supportMobilePayment, supportMobilePayment) || other.supportMobilePayment == supportMobilePayment)&&(identical(other.lastOnlineTime, lastOnlineTime) || other.lastOnlineTime == lastOnlineTime)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,cityId,address,longitude,latitude,status,distance,const DeepCollectionEquality().hash(products),supportCashPayment,supportMobilePayment,lastOnlineTime,updateTime);

@override
String toString() {
  return 'DeviceModel(id: $id, name: $name, cityId: $cityId, address: $address, longitude: $longitude, latitude: $latitude, status: $status, distance: $distance, products: $products, supportCashPayment: $supportCashPayment, supportMobilePayment: $supportMobilePayment, lastOnlineTime: $lastOnlineTime, updateTime: $updateTime)';
}


}

/// @nodoc
abstract mixin class $DeviceModelCopyWith<$Res>  {
  factory $DeviceModelCopyWith(DeviceModel value, $Res Function(DeviceModel) _then) = _$DeviceModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String cityId, String address, double longitude, double latitude, String status, double? distance, List<ProductModel>? products, bool supportCashPayment, bool supportMobilePayment, DateTime? lastOnlineTime, DateTime updateTime
});




}
/// @nodoc
class _$DeviceModelCopyWithImpl<$Res>
    implements $DeviceModelCopyWith<$Res> {
  _$DeviceModelCopyWithImpl(this._self, this._then);

  final DeviceModel _self;
  final $Res Function(DeviceModel) _then;

/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? cityId = null,Object? address = null,Object? longitude = null,Object? latitude = null,Object? status = null,Object? distance = freezed,Object? products = freezed,Object? supportCashPayment = null,Object? supportMobilePayment = null,Object? lastOnlineTime = freezed,Object? updateTime = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cityId: null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,products: freezed == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>?,supportCashPayment: null == supportCashPayment ? _self.supportCashPayment : supportCashPayment // ignore: cast_nullable_to_non_nullable
as bool,supportMobilePayment: null == supportMobilePayment ? _self.supportMobilePayment : supportMobilePayment // ignore: cast_nullable_to_non_nullable
as bool,lastOnlineTime: freezed == lastOnlineTime ? _self.lastOnlineTime : lastOnlineTime // ignore: cast_nullable_to_non_nullable
as DateTime?,updateTime: null == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceModel].
extension DeviceModelPatterns on DeviceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceModel value)  $default,){
final _that = this;
switch (_that) {
case _DeviceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String cityId,  String address,  double longitude,  double latitude,  String status,  double? distance,  List<ProductModel>? products,  bool supportCashPayment,  bool supportMobilePayment,  DateTime? lastOnlineTime,  DateTime updateTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceModel() when $default != null:
return $default(_that.id,_that.name,_that.cityId,_that.address,_that.longitude,_that.latitude,_that.status,_that.distance,_that.products,_that.supportCashPayment,_that.supportMobilePayment,_that.lastOnlineTime,_that.updateTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String cityId,  String address,  double longitude,  double latitude,  String status,  double? distance,  List<ProductModel>? products,  bool supportCashPayment,  bool supportMobilePayment,  DateTime? lastOnlineTime,  DateTime updateTime)  $default,) {final _that = this;
switch (_that) {
case _DeviceModel():
return $default(_that.id,_that.name,_that.cityId,_that.address,_that.longitude,_that.latitude,_that.status,_that.distance,_that.products,_that.supportCashPayment,_that.supportMobilePayment,_that.lastOnlineTime,_that.updateTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String cityId,  String address,  double longitude,  double latitude,  String status,  double? distance,  List<ProductModel>? products,  bool supportCashPayment,  bool supportMobilePayment,  DateTime? lastOnlineTime,  DateTime updateTime)?  $default,) {final _that = this;
switch (_that) {
case _DeviceModel() when $default != null:
return $default(_that.id,_that.name,_that.cityId,_that.address,_that.longitude,_that.latitude,_that.status,_that.distance,_that.products,_that.supportCashPayment,_that.supportMobilePayment,_that.lastOnlineTime,_that.updateTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceModel extends DeviceModel {
  const _DeviceModel({required this.id, required this.name, required this.cityId, required this.address, required this.longitude, required this.latitude, this.status = 'online', this.distance, final  List<ProductModel>? products, this.supportCashPayment = true, this.supportMobilePayment = true, this.lastOnlineTime, required this.updateTime}): _products = products,super._();
  factory _DeviceModel.fromJson(Map<String, dynamic> json) => _$DeviceModelFromJson(json);

/// 设备ID
@override final  String id;
/// 设备名称
@override final  String name;
/// 设备所在城市ID
@override final  String cityId;
/// 设备地址
@override final  String address;
/// 设备经度
@override final  double longitude;
/// 设备纬度
@override final  double latitude;
/// 设备状态：online、offline、maintenance
@override@JsonKey() final  String status;
/// 设备距离用户的距离（单位：米）
@override final  double? distance;
/// 设备包含的产品列表
 final  List<ProductModel>? _products;
/// 设备包含的产品列表
@override List<ProductModel>? get products {
  final value = _products;
  if (value == null) return null;
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// 设备是否支持现金支付
@override@JsonKey() final  bool supportCashPayment;
/// 设备是否支持移动支付
@override@JsonKey() final  bool supportMobilePayment;
/// 设备最后在线时间
@override final  DateTime? lastOnlineTime;
/// 设备更新时间
@override final  DateTime updateTime;

/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceModelCopyWith<_DeviceModel> get copyWith => __$DeviceModelCopyWithImpl<_DeviceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.address, address) || other.address == address)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.distance, distance) || other.distance == distance)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.supportCashPayment, supportCashPayment) || other.supportCashPayment == supportCashPayment)&&(identical(other.supportMobilePayment, supportMobilePayment) || other.supportMobilePayment == supportMobilePayment)&&(identical(other.lastOnlineTime, lastOnlineTime) || other.lastOnlineTime == lastOnlineTime)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,cityId,address,longitude,latitude,status,distance,const DeepCollectionEquality().hash(_products),supportCashPayment,supportMobilePayment,lastOnlineTime,updateTime);

@override
String toString() {
  return 'DeviceModel(id: $id, name: $name, cityId: $cityId, address: $address, longitude: $longitude, latitude: $latitude, status: $status, distance: $distance, products: $products, supportCashPayment: $supportCashPayment, supportMobilePayment: $supportMobilePayment, lastOnlineTime: $lastOnlineTime, updateTime: $updateTime)';
}


}

/// @nodoc
abstract mixin class _$DeviceModelCopyWith<$Res> implements $DeviceModelCopyWith<$Res> {
  factory _$DeviceModelCopyWith(_DeviceModel value, $Res Function(_DeviceModel) _then) = __$DeviceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String cityId, String address, double longitude, double latitude, String status, double? distance, List<ProductModel>? products, bool supportCashPayment, bool supportMobilePayment, DateTime? lastOnlineTime, DateTime updateTime
});




}
/// @nodoc
class __$DeviceModelCopyWithImpl<$Res>
    implements _$DeviceModelCopyWith<$Res> {
  __$DeviceModelCopyWithImpl(this._self, this._then);

  final _DeviceModel _self;
  final $Res Function(_DeviceModel) _then;

/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? cityId = null,Object? address = null,Object? longitude = null,Object? latitude = null,Object? status = null,Object? distance = freezed,Object? products = freezed,Object? supportCashPayment = null,Object? supportMobilePayment = null,Object? lastOnlineTime = freezed,Object? updateTime = null,}) {
  return _then(_DeviceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cityId: null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,products: freezed == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>?,supportCashPayment: null == supportCashPayment ? _self.supportCashPayment : supportCashPayment // ignore: cast_nullable_to_non_nullable
as bool,supportMobilePayment: null == supportMobilePayment ? _self.supportMobilePayment : supportMobilePayment // ignore: cast_nullable_to_non_nullable
as bool,lastOnlineTime: freezed == lastOnlineTime ? _self.lastOnlineTime : lastOnlineTime // ignore: cast_nullable_to_non_nullable
as DateTime?,updateTime: null == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
