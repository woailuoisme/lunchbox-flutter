// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommunityModel {

/// 社群ID
 int get id;/// 社群名称
 String get name;/// 社群封面图
 String? get thumb;/// 社群描述
 String? get description;/// 纬度
 String get latitude;/// 经度
 String get longitude;/// 距离（单位：m）
 String get distance;/// 距离（单位：km）
@JsonKey(name: 'distance_km') String get distanceKm;/// 创建时间
@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of CommunityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityModelCopyWith<CommunityModel> get copyWith => _$CommunityModelCopyWithImpl<CommunityModel>(this as CommunityModel, _$identity);

  /// Serializes this CommunityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,thumb,description,latitude,longitude,distance,distanceKm,createdAt);

@override
String toString() {
  return 'CommunityModel(id: $id, name: $name, thumb: $thumb, description: $description, latitude: $latitude, longitude: $longitude, distance: $distance, distanceKm: $distanceKm, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CommunityModelCopyWith<$Res>  {
  factory $CommunityModelCopyWith(CommunityModel value, $Res Function(CommunityModel) _then) = _$CommunityModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? thumb, String? description, String latitude, String longitude, String distance,@JsonKey(name: 'distance_km') String distanceKm,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$CommunityModelCopyWithImpl<$Res>
    implements $CommunityModelCopyWith<$Res> {
  _$CommunityModelCopyWithImpl(this._self, this._then);

  final CommunityModel _self;
  final $Res Function(CommunityModel) _then;

/// Create a copy of CommunityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? thumb = freezed,Object? description = freezed,Object? latitude = null,Object? longitude = null,Object? distance = null,Object? distanceKm = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumb: freezed == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as String,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CommunityModel].
extension CommunityModelPatterns on CommunityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityModel value)  $default,){
final _that = this;
switch (_that) {
case _CommunityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityModel value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? thumb,  String? description,  String latitude,  String longitude,  String distance, @JsonKey(name: 'distance_km')  String distanceKm, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityModel() when $default != null:
return $default(_that.id,_that.name,_that.thumb,_that.description,_that.latitude,_that.longitude,_that.distance,_that.distanceKm,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? thumb,  String? description,  String latitude,  String longitude,  String distance, @JsonKey(name: 'distance_km')  String distanceKm, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _CommunityModel():
return $default(_that.id,_that.name,_that.thumb,_that.description,_that.latitude,_that.longitude,_that.distance,_that.distanceKm,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? thumb,  String? description,  String latitude,  String longitude,  String distance, @JsonKey(name: 'distance_km')  String distanceKm, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CommunityModel() when $default != null:
return $default(_that.id,_that.name,_that.thumb,_that.description,_that.latitude,_that.longitude,_that.distance,_that.distanceKm,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommunityModel implements CommunityModel {
  const _CommunityModel({required this.id, required this.name, this.thumb, this.description, required this.latitude, required this.longitude, required this.distance, @JsonKey(name: 'distance_km') required this.distanceKm, @JsonKey(name: 'created_at') required this.createdAt});
  factory _CommunityModel.fromJson(Map<String, dynamic> json) => _$CommunityModelFromJson(json);

/// 社群ID
@override final  int id;
/// 社群名称
@override final  String name;
/// 社群封面图
@override final  String? thumb;
/// 社群描述
@override final  String? description;
/// 纬度
@override final  String latitude;
/// 经度
@override final  String longitude;
/// 距离（单位：m）
@override final  String distance;
/// 距离（单位：km）
@override@JsonKey(name: 'distance_km') final  String distanceKm;
/// 创建时间
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of CommunityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityModelCopyWith<_CommunityModel> get copyWith => __$CommunityModelCopyWithImpl<_CommunityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommunityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,thumb,description,latitude,longitude,distance,distanceKm,createdAt);

@override
String toString() {
  return 'CommunityModel(id: $id, name: $name, thumb: $thumb, description: $description, latitude: $latitude, longitude: $longitude, distance: $distance, distanceKm: $distanceKm, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CommunityModelCopyWith<$Res> implements $CommunityModelCopyWith<$Res> {
  factory _$CommunityModelCopyWith(_CommunityModel value, $Res Function(_CommunityModel) _then) = __$CommunityModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? thumb, String? description, String latitude, String longitude, String distance,@JsonKey(name: 'distance_km') String distanceKm,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$CommunityModelCopyWithImpl<$Res>
    implements _$CommunityModelCopyWith<$Res> {
  __$CommunityModelCopyWithImpl(this._self, this._then);

  final _CommunityModel _self;
  final $Res Function(_CommunityModel) _then;

/// Create a copy of CommunityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? thumb = freezed,Object? description = freezed,Object? latitude = null,Object? longitude = null,Object? distance = null,Object? distanceKm = null,Object? createdAt = null,}) {
  return _then(_CommunityModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumb: freezed == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as String,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
