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

/// Unique device identifier
 String get id;/// Device name
 String get name;/// ID of the city where the device is located
@JsonKey(name: 'city_id') String get cityId;/// Current operational status (as string for JSON)
 String get status;/// Geographic location of the device
 LocationModel get location;/// List of product IDs available in this device
@JsonKey(name: 'product_ids') List<String> get productIds;/// Timestamp of the last update (as ISO 8601 string)
@JsonKey(name: 'last_updated') String get lastUpdated;/// Distance from user (optional, from API)
 double? get distance;/// Formatted distance text (optional, from API)
@JsonKey(name: 'distance_text') String? get distanceText;
/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceModelCopyWith<DeviceModel> get copyWith => _$DeviceModelCopyWithImpl<DeviceModel>(this as DeviceModel, _$identity);

  /// Serializes this DeviceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.status, status) || other.status == status)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.productIds, productIds)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.distanceText, distanceText) || other.distanceText == distanceText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,cityId,status,location,const DeepCollectionEquality().hash(productIds),lastUpdated,distance,distanceText);

@override
String toString() {
  return 'DeviceModel(id: $id, name: $name, cityId: $cityId, status: $status, location: $location, productIds: $productIds, lastUpdated: $lastUpdated, distance: $distance, distanceText: $distanceText)';
}


}

/// @nodoc
abstract mixin class $DeviceModelCopyWith<$Res>  {
  factory $DeviceModelCopyWith(DeviceModel value, $Res Function(DeviceModel) _then) = _$DeviceModelCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'city_id') String cityId, String status, LocationModel location,@JsonKey(name: 'product_ids') List<String> productIds,@JsonKey(name: 'last_updated') String lastUpdated, double? distance,@JsonKey(name: 'distance_text') String? distanceText
});


$LocationModelCopyWith<$Res> get location;

}
/// @nodoc
class _$DeviceModelCopyWithImpl<$Res>
    implements $DeviceModelCopyWith<$Res> {
  _$DeviceModelCopyWithImpl(this._self, this._then);

  final DeviceModel _self;
  final $Res Function(DeviceModel) _then;

/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? cityId = null,Object? status = null,Object? location = null,Object? productIds = null,Object? lastUpdated = null,Object? distance = freezed,Object? distanceText = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cityId: null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationModel,productIds: null == productIds ? _self.productIds : productIds // ignore: cast_nullable_to_non_nullable
as List<String>,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,distanceText: freezed == distanceText ? _self.distanceText : distanceText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationModelCopyWith<$Res> get location {
  
  return $LocationModelCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'city_id')  String cityId,  String status,  LocationModel location, @JsonKey(name: 'product_ids')  List<String> productIds, @JsonKey(name: 'last_updated')  String lastUpdated,  double? distance, @JsonKey(name: 'distance_text')  String? distanceText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceModel() when $default != null:
return $default(_that.id,_that.name,_that.cityId,_that.status,_that.location,_that.productIds,_that.lastUpdated,_that.distance,_that.distanceText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'city_id')  String cityId,  String status,  LocationModel location, @JsonKey(name: 'product_ids')  List<String> productIds, @JsonKey(name: 'last_updated')  String lastUpdated,  double? distance, @JsonKey(name: 'distance_text')  String? distanceText)  $default,) {final _that = this;
switch (_that) {
case _DeviceModel():
return $default(_that.id,_that.name,_that.cityId,_that.status,_that.location,_that.productIds,_that.lastUpdated,_that.distance,_that.distanceText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'city_id')  String cityId,  String status,  LocationModel location, @JsonKey(name: 'product_ids')  List<String> productIds, @JsonKey(name: 'last_updated')  String lastUpdated,  double? distance, @JsonKey(name: 'distance_text')  String? distanceText)?  $default,) {final _that = this;
switch (_that) {
case _DeviceModel() when $default != null:
return $default(_that.id,_that.name,_that.cityId,_that.status,_that.location,_that.productIds,_that.lastUpdated,_that.distance,_that.distanceText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceModel extends DeviceModel {
  const _DeviceModel({required this.id, required this.name, @JsonKey(name: 'city_id') required this.cityId, required this.status, required this.location, @JsonKey(name: 'product_ids') required final  List<String> productIds, @JsonKey(name: 'last_updated') required this.lastUpdated, this.distance, @JsonKey(name: 'distance_text') this.distanceText}): _productIds = productIds,super._();
  factory _DeviceModel.fromJson(Map<String, dynamic> json) => _$DeviceModelFromJson(json);

/// Unique device identifier
@override final  String id;
/// Device name
@override final  String name;
/// ID of the city where the device is located
@override@JsonKey(name: 'city_id') final  String cityId;
/// Current operational status (as string for JSON)
@override final  String status;
/// Geographic location of the device
@override final  LocationModel location;
/// List of product IDs available in this device
 final  List<String> _productIds;
/// List of product IDs available in this device
@override@JsonKey(name: 'product_ids') List<String> get productIds {
  if (_productIds is EqualUnmodifiableListView) return _productIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productIds);
}

/// Timestamp of the last update (as ISO 8601 string)
@override@JsonKey(name: 'last_updated') final  String lastUpdated;
/// Distance from user (optional, from API)
@override final  double? distance;
/// Formatted distance text (optional, from API)
@override@JsonKey(name: 'distance_text') final  String? distanceText;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.status, status) || other.status == status)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._productIds, _productIds)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.distanceText, distanceText) || other.distanceText == distanceText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,cityId,status,location,const DeepCollectionEquality().hash(_productIds),lastUpdated,distance,distanceText);

@override
String toString() {
  return 'DeviceModel(id: $id, name: $name, cityId: $cityId, status: $status, location: $location, productIds: $productIds, lastUpdated: $lastUpdated, distance: $distance, distanceText: $distanceText)';
}


}

/// @nodoc
abstract mixin class _$DeviceModelCopyWith<$Res> implements $DeviceModelCopyWith<$Res> {
  factory _$DeviceModelCopyWith(_DeviceModel value, $Res Function(_DeviceModel) _then) = __$DeviceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'city_id') String cityId, String status, LocationModel location,@JsonKey(name: 'product_ids') List<String> productIds,@JsonKey(name: 'last_updated') String lastUpdated, double? distance,@JsonKey(name: 'distance_text') String? distanceText
});


@override $LocationModelCopyWith<$Res> get location;

}
/// @nodoc
class __$DeviceModelCopyWithImpl<$Res>
    implements _$DeviceModelCopyWith<$Res> {
  __$DeviceModelCopyWithImpl(this._self, this._then);

  final _DeviceModel _self;
  final $Res Function(_DeviceModel) _then;

/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? cityId = null,Object? status = null,Object? location = null,Object? productIds = null,Object? lastUpdated = null,Object? distance = freezed,Object? distanceText = freezed,}) {
  return _then(_DeviceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cityId: null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationModel,productIds: null == productIds ? _self._productIds : productIds // ignore: cast_nullable_to_non_nullable
as List<String>,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,distanceText: freezed == distanceText ? _self.distanceText : distanceText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationModelCopyWith<$Res> get location {
  
  return $LocationModelCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
