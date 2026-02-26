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
 int get id;/// 设备编号
 String get no;/// 设备名称
 String get name;/// 是否启用
@JsonKey(name: 'is_enabled') bool get isEnabled;/// 距离 (如: "48880.04m")
 String? get distance;/// 距离公里 (如: "48.88km")
@JsonKey(name: 'distance_km') String? get distanceKm;/// 经度
 String get longitude;/// 纬度
 String get latitude;/// 街道地址
@JsonKey(name: 'street_address') String get streetAddress;/// 完整地址
@JsonKey(name: 'full_address') String get fullAddress;/// 营业时间
@JsonKey(name: 'business_hours') String get businessHours;/// 图片URL
@JsonKey(name: 'image_url') String get imageUrl;/// 城市信息
 DeviceCityModel get city;
/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceModelCopyWith<DeviceModel> get copyWith => _$DeviceModelCopyWithImpl<DeviceModel>(this as DeviceModel, _$identity);

  /// Serializes this DeviceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.no, no) || other.no == no)&&(identical(other.name, name) || other.name == name)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.businessHours, businessHours) || other.businessHours == businessHours)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.city, city) || other.city == city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,no,name,isEnabled,distance,distanceKm,longitude,latitude,streetAddress,fullAddress,businessHours,imageUrl,city);

@override
String toString() {
  return 'DeviceModel(id: $id, no: $no, name: $name, isEnabled: $isEnabled, distance: $distance, distanceKm: $distanceKm, longitude: $longitude, latitude: $latitude, streetAddress: $streetAddress, fullAddress: $fullAddress, businessHours: $businessHours, imageUrl: $imageUrl, city: $city)';
}


}

/// @nodoc
abstract mixin class $DeviceModelCopyWith<$Res>  {
  factory $DeviceModelCopyWith(DeviceModel value, $Res Function(DeviceModel) _then) = _$DeviceModelCopyWithImpl;
@useResult
$Res call({
 int id, String no, String name,@JsonKey(name: 'is_enabled') bool isEnabled, String? distance,@JsonKey(name: 'distance_km') String? distanceKm, String longitude, String latitude,@JsonKey(name: 'street_address') String streetAddress,@JsonKey(name: 'full_address') String fullAddress,@JsonKey(name: 'business_hours') String businessHours,@JsonKey(name: 'image_url') String imageUrl, DeviceCityModel city
});


$DeviceCityModelCopyWith<$Res> get city;

}
/// @nodoc
class _$DeviceModelCopyWithImpl<$Res>
    implements $DeviceModelCopyWith<$Res> {
  _$DeviceModelCopyWithImpl(this._self, this._then);

  final DeviceModel _self;
  final $Res Function(DeviceModel) _then;

/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? no = null,Object? name = null,Object? isEnabled = null,Object? distance = freezed,Object? distanceKm = freezed,Object? longitude = null,Object? latitude = null,Object? streetAddress = null,Object? fullAddress = null,Object? businessHours = null,Object? imageUrl = null,Object? city = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,no: null == no ? _self.no : no // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as String?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as String?,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,fullAddress: null == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String,businessHours: null == businessHours ? _self.businessHours : businessHours // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as DeviceCityModel,
  ));
}
/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceCityModelCopyWith<$Res> get city {
  
  return $DeviceCityModelCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String no,  String name, @JsonKey(name: 'is_enabled')  bool isEnabled,  String? distance, @JsonKey(name: 'distance_km')  String? distanceKm,  String longitude,  String latitude, @JsonKey(name: 'street_address')  String streetAddress, @JsonKey(name: 'full_address')  String fullAddress, @JsonKey(name: 'business_hours')  String businessHours, @JsonKey(name: 'image_url')  String imageUrl,  DeviceCityModel city)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceModel() when $default != null:
return $default(_that.id,_that.no,_that.name,_that.isEnabled,_that.distance,_that.distanceKm,_that.longitude,_that.latitude,_that.streetAddress,_that.fullAddress,_that.businessHours,_that.imageUrl,_that.city);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String no,  String name, @JsonKey(name: 'is_enabled')  bool isEnabled,  String? distance, @JsonKey(name: 'distance_km')  String? distanceKm,  String longitude,  String latitude, @JsonKey(name: 'street_address')  String streetAddress, @JsonKey(name: 'full_address')  String fullAddress, @JsonKey(name: 'business_hours')  String businessHours, @JsonKey(name: 'image_url')  String imageUrl,  DeviceCityModel city)  $default,) {final _that = this;
switch (_that) {
case _DeviceModel():
return $default(_that.id,_that.no,_that.name,_that.isEnabled,_that.distance,_that.distanceKm,_that.longitude,_that.latitude,_that.streetAddress,_that.fullAddress,_that.businessHours,_that.imageUrl,_that.city);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String no,  String name, @JsonKey(name: 'is_enabled')  bool isEnabled,  String? distance, @JsonKey(name: 'distance_km')  String? distanceKm,  String longitude,  String latitude, @JsonKey(name: 'street_address')  String streetAddress, @JsonKey(name: 'full_address')  String fullAddress, @JsonKey(name: 'business_hours')  String businessHours, @JsonKey(name: 'image_url')  String imageUrl,  DeviceCityModel city)?  $default,) {final _that = this;
switch (_that) {
case _DeviceModel() when $default != null:
return $default(_that.id,_that.no,_that.name,_that.isEnabled,_that.distance,_that.distanceKm,_that.longitude,_that.latitude,_that.streetAddress,_that.fullAddress,_that.businessHours,_that.imageUrl,_that.city);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceModel implements DeviceModel {
  const _DeviceModel({required this.id, required this.no, required this.name, @JsonKey(name: 'is_enabled') required this.isEnabled, this.distance, @JsonKey(name: 'distance_km') this.distanceKm, required this.longitude, required this.latitude, @JsonKey(name: 'street_address') required this.streetAddress, @JsonKey(name: 'full_address') required this.fullAddress, @JsonKey(name: 'business_hours') required this.businessHours, @JsonKey(name: 'image_url') required this.imageUrl, required this.city});
  factory _DeviceModel.fromJson(Map<String, dynamic> json) => _$DeviceModelFromJson(json);

/// 设备ID
@override final  int id;
/// 设备编号
@override final  String no;
/// 设备名称
@override final  String name;
/// 是否启用
@override@JsonKey(name: 'is_enabled') final  bool isEnabled;
/// 距离 (如: "48880.04m")
@override final  String? distance;
/// 距离公里 (如: "48.88km")
@override@JsonKey(name: 'distance_km') final  String? distanceKm;
/// 经度
@override final  String longitude;
/// 纬度
@override final  String latitude;
/// 街道地址
@override@JsonKey(name: 'street_address') final  String streetAddress;
/// 完整地址
@override@JsonKey(name: 'full_address') final  String fullAddress;
/// 营业时间
@override@JsonKey(name: 'business_hours') final  String businessHours;
/// 图片URL
@override@JsonKey(name: 'image_url') final  String imageUrl;
/// 城市信息
@override final  DeviceCityModel city;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.no, no) || other.no == no)&&(identical(other.name, name) || other.name == name)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.businessHours, businessHours) || other.businessHours == businessHours)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.city, city) || other.city == city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,no,name,isEnabled,distance,distanceKm,longitude,latitude,streetAddress,fullAddress,businessHours,imageUrl,city);

@override
String toString() {
  return 'DeviceModel(id: $id, no: $no, name: $name, isEnabled: $isEnabled, distance: $distance, distanceKm: $distanceKm, longitude: $longitude, latitude: $latitude, streetAddress: $streetAddress, fullAddress: $fullAddress, businessHours: $businessHours, imageUrl: $imageUrl, city: $city)';
}


}

/// @nodoc
abstract mixin class _$DeviceModelCopyWith<$Res> implements $DeviceModelCopyWith<$Res> {
  factory _$DeviceModelCopyWith(_DeviceModel value, $Res Function(_DeviceModel) _then) = __$DeviceModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String no, String name,@JsonKey(name: 'is_enabled') bool isEnabled, String? distance,@JsonKey(name: 'distance_km') String? distanceKm, String longitude, String latitude,@JsonKey(name: 'street_address') String streetAddress,@JsonKey(name: 'full_address') String fullAddress,@JsonKey(name: 'business_hours') String businessHours,@JsonKey(name: 'image_url') String imageUrl, DeviceCityModel city
});


@override $DeviceCityModelCopyWith<$Res> get city;

}
/// @nodoc
class __$DeviceModelCopyWithImpl<$Res>
    implements _$DeviceModelCopyWith<$Res> {
  __$DeviceModelCopyWithImpl(this._self, this._then);

  final _DeviceModel _self;
  final $Res Function(_DeviceModel) _then;

/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? no = null,Object? name = null,Object? isEnabled = null,Object? distance = freezed,Object? distanceKm = freezed,Object? longitude = null,Object? latitude = null,Object? streetAddress = null,Object? fullAddress = null,Object? businessHours = null,Object? imageUrl = null,Object? city = null,}) {
  return _then(_DeviceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,no: null == no ? _self.no : no // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as String?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as String?,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,fullAddress: null == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String,businessHours: null == businessHours ? _self.businessHours : businessHours // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as DeviceCityModel,
  ));
}

/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceCityModelCopyWith<$Res> get city {
  
  return $DeviceCityModelCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}


/// @nodoc
mixin _$DeviceCityModel {

/// 城市ID/代码
 String get id;/// 城市名称
 String get name;
/// Create a copy of DeviceCityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceCityModelCopyWith<DeviceCityModel> get copyWith => _$DeviceCityModelCopyWithImpl<DeviceCityModel>(this as DeviceCityModel, _$identity);

  /// Serializes this DeviceCityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceCityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'DeviceCityModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $DeviceCityModelCopyWith<$Res>  {
  factory $DeviceCityModelCopyWith(DeviceCityModel value, $Res Function(DeviceCityModel) _then) = _$DeviceCityModelCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$DeviceCityModelCopyWithImpl<$Res>
    implements $DeviceCityModelCopyWith<$Res> {
  _$DeviceCityModelCopyWithImpl(this._self, this._then);

  final DeviceCityModel _self;
  final $Res Function(DeviceCityModel) _then;

/// Create a copy of DeviceCityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceCityModel].
extension DeviceCityModelPatterns on DeviceCityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceCityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceCityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceCityModel value)  $default,){
final _that = this;
switch (_that) {
case _DeviceCityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceCityModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceCityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceCityModel() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _DeviceCityModel():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _DeviceCityModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceCityModel implements DeviceCityModel {
  const _DeviceCityModel({required this.id, required this.name});
  factory _DeviceCityModel.fromJson(Map<String, dynamic> json) => _$DeviceCityModelFromJson(json);

/// 城市ID/代码
@override final  String id;
/// 城市名称
@override final  String name;

/// Create a copy of DeviceCityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceCityModelCopyWith<_DeviceCityModel> get copyWith => __$DeviceCityModelCopyWithImpl<_DeviceCityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceCityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceCityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'DeviceCityModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$DeviceCityModelCopyWith<$Res> implements $DeviceCityModelCopyWith<$Res> {
  factory _$DeviceCityModelCopyWith(_DeviceCityModel value, $Res Function(_DeviceCityModel) _then) = __$DeviceCityModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$DeviceCityModelCopyWithImpl<$Res>
    implements _$DeviceCityModelCopyWith<$Res> {
  __$DeviceCityModelCopyWithImpl(this._self, this._then);

  final _DeviceCityModel _self;
  final $Res Function(_DeviceCityModel) _then;

/// Create a copy of DeviceCityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_DeviceCityModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
