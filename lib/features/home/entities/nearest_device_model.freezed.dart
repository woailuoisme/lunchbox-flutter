// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearest_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NearestDeviceModel {

 int get id; String get name; String get distance;@JsonKey(name: 'distance_km') String get distanceKm; String get latitude; String get longitude; NearestCity get city;@JsonKey(name: 'street_address') String get streetAddress;
/// Create a copy of NearestDeviceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearestDeviceModelCopyWith<NearestDeviceModel> get copyWith => _$NearestDeviceModelCopyWithImpl<NearestDeviceModel>(this as NearestDeviceModel, _$identity);

  /// Serializes this NearestDeviceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearestDeviceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.city, city) || other.city == city)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,distance,distanceKm,latitude,longitude,city,streetAddress);

@override
String toString() {
  return 'NearestDeviceModel(id: $id, name: $name, distance: $distance, distanceKm: $distanceKm, latitude: $latitude, longitude: $longitude, city: $city, streetAddress: $streetAddress)';
}


}

/// @nodoc
abstract mixin class $NearestDeviceModelCopyWith<$Res>  {
  factory $NearestDeviceModelCopyWith(NearestDeviceModel value, $Res Function(NearestDeviceModel) _then) = _$NearestDeviceModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String distance,@JsonKey(name: 'distance_km') String distanceKm, String latitude, String longitude, NearestCity city,@JsonKey(name: 'street_address') String streetAddress
});


$NearestCityCopyWith<$Res> get city;

}
/// @nodoc
class _$NearestDeviceModelCopyWithImpl<$Res>
    implements $NearestDeviceModelCopyWith<$Res> {
  _$NearestDeviceModelCopyWithImpl(this._self, this._then);

  final NearestDeviceModel _self;
  final $Res Function(NearestDeviceModel) _then;

/// Create a copy of NearestDeviceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? distance = null,Object? distanceKm = null,Object? latitude = null,Object? longitude = null,Object? city = null,Object? streetAddress = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as String,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as NearestCity,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of NearestDeviceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NearestCityCopyWith<$Res> get city {
  
  return $NearestCityCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}


/// Adds pattern-matching-related methods to [NearestDeviceModel].
extension NearestDeviceModelPatterns on NearestDeviceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearestDeviceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearestDeviceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearestDeviceModel value)  $default,){
final _that = this;
switch (_that) {
case _NearestDeviceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearestDeviceModel value)?  $default,){
final _that = this;
switch (_that) {
case _NearestDeviceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String distance, @JsonKey(name: 'distance_km')  String distanceKm,  String latitude,  String longitude,  NearestCity city, @JsonKey(name: 'street_address')  String streetAddress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearestDeviceModel() when $default != null:
return $default(_that.id,_that.name,_that.distance,_that.distanceKm,_that.latitude,_that.longitude,_that.city,_that.streetAddress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String distance, @JsonKey(name: 'distance_km')  String distanceKm,  String latitude,  String longitude,  NearestCity city, @JsonKey(name: 'street_address')  String streetAddress)  $default,) {final _that = this;
switch (_that) {
case _NearestDeviceModel():
return $default(_that.id,_that.name,_that.distance,_that.distanceKm,_that.latitude,_that.longitude,_that.city,_that.streetAddress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String distance, @JsonKey(name: 'distance_km')  String distanceKm,  String latitude,  String longitude,  NearestCity city, @JsonKey(name: 'street_address')  String streetAddress)?  $default,) {final _that = this;
switch (_that) {
case _NearestDeviceModel() when $default != null:
return $default(_that.id,_that.name,_that.distance,_that.distanceKm,_that.latitude,_that.longitude,_that.city,_that.streetAddress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NearestDeviceModel implements NearestDeviceModel {
  const _NearestDeviceModel({required this.id, required this.name, required this.distance, @JsonKey(name: 'distance_km') required this.distanceKm, required this.latitude, required this.longitude, required this.city, @JsonKey(name: 'street_address') required this.streetAddress});
  factory _NearestDeviceModel.fromJson(Map<String, dynamic> json) => _$NearestDeviceModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String distance;
@override@JsonKey(name: 'distance_km') final  String distanceKm;
@override final  String latitude;
@override final  String longitude;
@override final  NearestCity city;
@override@JsonKey(name: 'street_address') final  String streetAddress;

/// Create a copy of NearestDeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearestDeviceModelCopyWith<_NearestDeviceModel> get copyWith => __$NearestDeviceModelCopyWithImpl<_NearestDeviceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearestDeviceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearestDeviceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.city, city) || other.city == city)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,distance,distanceKm,latitude,longitude,city,streetAddress);

@override
String toString() {
  return 'NearestDeviceModel(id: $id, name: $name, distance: $distance, distanceKm: $distanceKm, latitude: $latitude, longitude: $longitude, city: $city, streetAddress: $streetAddress)';
}


}

/// @nodoc
abstract mixin class _$NearestDeviceModelCopyWith<$Res> implements $NearestDeviceModelCopyWith<$Res> {
  factory _$NearestDeviceModelCopyWith(_NearestDeviceModel value, $Res Function(_NearestDeviceModel) _then) = __$NearestDeviceModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String distance,@JsonKey(name: 'distance_km') String distanceKm, String latitude, String longitude, NearestCity city,@JsonKey(name: 'street_address') String streetAddress
});


@override $NearestCityCopyWith<$Res> get city;

}
/// @nodoc
class __$NearestDeviceModelCopyWithImpl<$Res>
    implements _$NearestDeviceModelCopyWith<$Res> {
  __$NearestDeviceModelCopyWithImpl(this._self, this._then);

  final _NearestDeviceModel _self;
  final $Res Function(_NearestDeviceModel) _then;

/// Create a copy of NearestDeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? distance = null,Object? distanceKm = null,Object? latitude = null,Object? longitude = null,Object? city = null,Object? streetAddress = null,}) {
  return _then(_NearestDeviceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as String,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as NearestCity,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of NearestDeviceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NearestCityCopyWith<$Res> get city {
  
  return $NearestCityCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}


/// @nodoc
mixin _$NearestCity {

 String get name; String get code;
/// Create a copy of NearestCity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearestCityCopyWith<NearestCity> get copyWith => _$NearestCityCopyWithImpl<NearestCity>(this as NearestCity, _$identity);

  /// Serializes this NearestCity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearestCity&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'NearestCity(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class $NearestCityCopyWith<$Res>  {
  factory $NearestCityCopyWith(NearestCity value, $Res Function(NearestCity) _then) = _$NearestCityCopyWithImpl;
@useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class _$NearestCityCopyWithImpl<$Res>
    implements $NearestCityCopyWith<$Res> {
  _$NearestCityCopyWithImpl(this._self, this._then);

  final NearestCity _self;
  final $Res Function(NearestCity) _then;

/// Create a copy of NearestCity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NearestCity].
extension NearestCityPatterns on NearestCity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearestCity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearestCity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearestCity value)  $default,){
final _that = this;
switch (_that) {
case _NearestCity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearestCity value)?  $default,){
final _that = this;
switch (_that) {
case _NearestCity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearestCity() when $default != null:
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code)  $default,) {final _that = this;
switch (_that) {
case _NearestCity():
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code)?  $default,) {final _that = this;
switch (_that) {
case _NearestCity() when $default != null:
return $default(_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NearestCity implements NearestCity {
  const _NearestCity({required this.name, required this.code});
  factory _NearestCity.fromJson(Map<String, dynamic> json) => _$NearestCityFromJson(json);

@override final  String name;
@override final  String code;

/// Create a copy of NearestCity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearestCityCopyWith<_NearestCity> get copyWith => __$NearestCityCopyWithImpl<_NearestCity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearestCityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearestCity&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'NearestCity(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$NearestCityCopyWith<$Res> implements $NearestCityCopyWith<$Res> {
  factory _$NearestCityCopyWith(_NearestCity value, $Res Function(_NearestCity) _then) = __$NearestCityCopyWithImpl;
@override @useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class __$NearestCityCopyWithImpl<$Res>
    implements _$NearestCityCopyWith<$Res> {
  __$NearestCityCopyWithImpl(this._self, this._then);

  final _NearestCity _self;
  final $Res Function(_NearestCity) _then;

/// Create a copy of NearestCity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,}) {
  return _then(_NearestCity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
