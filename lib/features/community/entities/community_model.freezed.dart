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
 String get id;/// 社群名称
 String get name;/// 社群描述
 String get description;/// 社群封面图
 String get coverUrl;/// 社群二维码链接
 String get qrCodeUrl;/// 成员数量
 int get memberCount;/// 是否推荐
 bool get isRecommended;
/// Create a copy of CommunityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityModelCopyWith<CommunityModel> get copyWith => _$CommunityModelCopyWithImpl<CommunityModel>(this as CommunityModel, _$identity);

  /// Serializes this CommunityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.qrCodeUrl, qrCodeUrl) || other.qrCodeUrl == qrCodeUrl)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount)&&(identical(other.isRecommended, isRecommended) || other.isRecommended == isRecommended));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,coverUrl,qrCodeUrl,memberCount,isRecommended);

@override
String toString() {
  return 'CommunityModel(id: $id, name: $name, description: $description, coverUrl: $coverUrl, qrCodeUrl: $qrCodeUrl, memberCount: $memberCount, isRecommended: $isRecommended)';
}


}

/// @nodoc
abstract mixin class $CommunityModelCopyWith<$Res>  {
  factory $CommunityModelCopyWith(CommunityModel value, $Res Function(CommunityModel) _then) = _$CommunityModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String coverUrl, String qrCodeUrl, int memberCount, bool isRecommended
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? coverUrl = null,Object? qrCodeUrl = null,Object? memberCount = null,Object? isRecommended = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,qrCodeUrl: null == qrCodeUrl ? _self.qrCodeUrl : qrCodeUrl // ignore: cast_nullable_to_non_nullable
as String,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,isRecommended: null == isRecommended ? _self.isRecommended : isRecommended // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String coverUrl,  String qrCodeUrl,  int memberCount,  bool isRecommended)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.coverUrl,_that.qrCodeUrl,_that.memberCount,_that.isRecommended);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String coverUrl,  String qrCodeUrl,  int memberCount,  bool isRecommended)  $default,) {final _that = this;
switch (_that) {
case _CommunityModel():
return $default(_that.id,_that.name,_that.description,_that.coverUrl,_that.qrCodeUrl,_that.memberCount,_that.isRecommended);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String coverUrl,  String qrCodeUrl,  int memberCount,  bool isRecommended)?  $default,) {final _that = this;
switch (_that) {
case _CommunityModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.coverUrl,_that.qrCodeUrl,_that.memberCount,_that.isRecommended);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommunityModel implements CommunityModel {
  const _CommunityModel({required this.id, required this.name, required this.description, required this.coverUrl, required this.qrCodeUrl, this.memberCount = 0, this.isRecommended = false});
  factory _CommunityModel.fromJson(Map<String, dynamic> json) => _$CommunityModelFromJson(json);

/// 社群ID
@override final  String id;
/// 社群名称
@override final  String name;
/// 社群描述
@override final  String description;
/// 社群封面图
@override final  String coverUrl;
/// 社群二维码链接
@override final  String qrCodeUrl;
/// 成员数量
@override@JsonKey() final  int memberCount;
/// 是否推荐
@override@JsonKey() final  bool isRecommended;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.qrCodeUrl, qrCodeUrl) || other.qrCodeUrl == qrCodeUrl)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount)&&(identical(other.isRecommended, isRecommended) || other.isRecommended == isRecommended));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,coverUrl,qrCodeUrl,memberCount,isRecommended);

@override
String toString() {
  return 'CommunityModel(id: $id, name: $name, description: $description, coverUrl: $coverUrl, qrCodeUrl: $qrCodeUrl, memberCount: $memberCount, isRecommended: $isRecommended)';
}


}

/// @nodoc
abstract mixin class _$CommunityModelCopyWith<$Res> implements $CommunityModelCopyWith<$Res> {
  factory _$CommunityModelCopyWith(_CommunityModel value, $Res Function(_CommunityModel) _then) = __$CommunityModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String coverUrl, String qrCodeUrl, int memberCount, bool isRecommended
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? coverUrl = null,Object? qrCodeUrl = null,Object? memberCount = null,Object? isRecommended = null,}) {
  return _then(_CommunityModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,qrCodeUrl: null == qrCodeUrl ? _self.qrCodeUrl : qrCodeUrl // ignore: cast_nullable_to_non_nullable
as String,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,isRecommended: null == isRecommended ? _self.isRecommended : isRecommended // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
