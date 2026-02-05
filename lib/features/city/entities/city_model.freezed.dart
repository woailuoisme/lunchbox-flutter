// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CityModel {

/// Unique identifier for the city
 String get id;/// Name of the city
 String get name;/// City code (e.g., "BJ" for Beijing)
 String get code;/// Pin yin for the city name
 String get pinyin;/// Initial letter of the city name
 String get initial;/// City latitude
 double get latitude;/// City longitude
 double get longitude;/// Whether this is a hot city
 bool get isHot;/// Number of devices in this city
@JsonKey(name: 'device_count') int get deviceCount;
/// Create a copy of CityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityModelCopyWith<CityModel> get copyWith => _$CityModelCopyWithImpl<CityModel>(this as CityModel, _$identity);

  /// Serializes this CityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.pinyin, pinyin) || other.pinyin == pinyin)&&(identical(other.initial, initial) || other.initial == initial)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.isHot, isHot) || other.isHot == isHot)&&(identical(other.deviceCount, deviceCount) || other.deviceCount == deviceCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,pinyin,initial,latitude,longitude,isHot,deviceCount);

@override
String toString() {
  return 'CityModel(id: $id, name: $name, code: $code, pinyin: $pinyin, initial: $initial, latitude: $latitude, longitude: $longitude, isHot: $isHot, deviceCount: $deviceCount)';
}


}

/// @nodoc
abstract mixin class $CityModelCopyWith<$Res>  {
  factory $CityModelCopyWith(CityModel value, $Res Function(CityModel) _then) = _$CityModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String code, String pinyin, String initial, double latitude, double longitude, bool isHot,@JsonKey(name: 'device_count') int deviceCount
});




}
/// @nodoc
class _$CityModelCopyWithImpl<$Res>
    implements $CityModelCopyWith<$Res> {
  _$CityModelCopyWithImpl(this._self, this._then);

  final CityModel _self;
  final $Res Function(CityModel) _then;

/// Create a copy of CityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = null,Object? pinyin = null,Object? initial = null,Object? latitude = null,Object? longitude = null,Object? isHot = null,Object? deviceCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,pinyin: null == pinyin ? _self.pinyin : pinyin // ignore: cast_nullable_to_non_nullable
as String,initial: null == initial ? _self.initial : initial // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,isHot: null == isHot ? _self.isHot : isHot // ignore: cast_nullable_to_non_nullable
as bool,deviceCount: null == deviceCount ? _self.deviceCount : deviceCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CityModel].
extension CityModelPatterns on CityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CityModel value)  $default,){
final _that = this;
switch (_that) {
case _CityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CityModel value)?  $default,){
final _that = this;
switch (_that) {
case _CityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String code,  String pinyin,  String initial,  double latitude,  double longitude,  bool isHot, @JsonKey(name: 'device_count')  int deviceCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CityModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.pinyin,_that.initial,_that.latitude,_that.longitude,_that.isHot,_that.deviceCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String code,  String pinyin,  String initial,  double latitude,  double longitude,  bool isHot, @JsonKey(name: 'device_count')  int deviceCount)  $default,) {final _that = this;
switch (_that) {
case _CityModel():
return $default(_that.id,_that.name,_that.code,_that.pinyin,_that.initial,_that.latitude,_that.longitude,_that.isHot,_that.deviceCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String code,  String pinyin,  String initial,  double latitude,  double longitude,  bool isHot, @JsonKey(name: 'device_count')  int deviceCount)?  $default,) {final _that = this;
switch (_that) {
case _CityModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.pinyin,_that.initial,_that.latitude,_that.longitude,_that.isHot,_that.deviceCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CityModel extends CityModel {
  const _CityModel({required this.id, required this.name, required this.code, this.pinyin = '', this.initial = '', this.latitude = 0.0, this.longitude = 0.0, this.isHot = false, @JsonKey(name: 'device_count') this.deviceCount = 0}): super._();
  factory _CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);

/// Unique identifier for the city
@override final  String id;
/// Name of the city
@override final  String name;
/// City code (e.g., "BJ" for Beijing)
@override final  String code;
/// Pin yin for the city name
@override@JsonKey() final  String pinyin;
/// Initial letter of the city name
@override@JsonKey() final  String initial;
/// City latitude
@override@JsonKey() final  double latitude;
/// City longitude
@override@JsonKey() final  double longitude;
/// Whether this is a hot city
@override@JsonKey() final  bool isHot;
/// Number of devices in this city
@override@JsonKey(name: 'device_count') final  int deviceCount;

/// Create a copy of CityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityModelCopyWith<_CityModel> get copyWith => __$CityModelCopyWithImpl<_CityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.pinyin, pinyin) || other.pinyin == pinyin)&&(identical(other.initial, initial) || other.initial == initial)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.isHot, isHot) || other.isHot == isHot)&&(identical(other.deviceCount, deviceCount) || other.deviceCount == deviceCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,pinyin,initial,latitude,longitude,isHot,deviceCount);

@override
String toString() {
  return 'CityModel(id: $id, name: $name, code: $code, pinyin: $pinyin, initial: $initial, latitude: $latitude, longitude: $longitude, isHot: $isHot, deviceCount: $deviceCount)';
}


}

/// @nodoc
abstract mixin class _$CityModelCopyWith<$Res> implements $CityModelCopyWith<$Res> {
  factory _$CityModelCopyWith(_CityModel value, $Res Function(_CityModel) _then) = __$CityModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String code, String pinyin, String initial, double latitude, double longitude, bool isHot,@JsonKey(name: 'device_count') int deviceCount
});




}
/// @nodoc
class __$CityModelCopyWithImpl<$Res>
    implements _$CityModelCopyWith<$Res> {
  __$CityModelCopyWithImpl(this._self, this._then);

  final _CityModel _self;
  final $Res Function(_CityModel) _then;

/// Create a copy of CityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = null,Object? pinyin = null,Object? initial = null,Object? latitude = null,Object? longitude = null,Object? isHot = null,Object? deviceCount = null,}) {
  return _then(_CityModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,pinyin: null == pinyin ? _self.pinyin : pinyin // ignore: cast_nullable_to_non_nullable
as String,initial: null == initial ? _self.initial : initial // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,isHot: null == isHot ? _self.isHot : isHot // ignore: cast_nullable_to_non_nullable
as bool,deviceCount: null == deviceCount ? _self.deviceCount : deviceCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
