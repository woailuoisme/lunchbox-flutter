// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'points_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PointsRecordModel {

/// 记录ID
 String get id;/// 标题/描述
 String get title;/// 变动积分 (正数表示获取，负数表示消耗)
 int get points;/// 记录日期
 String get date;/// 记录类型 (gain: 获取, use: 消耗)
 String get type;
/// Create a copy of PointsRecordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PointsRecordModelCopyWith<PointsRecordModel> get copyWith => _$PointsRecordModelCopyWithImpl<PointsRecordModel>(this as PointsRecordModel, _$identity);

  /// Serializes this PointsRecordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PointsRecordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.points, points) || other.points == points)&&(identical(other.date, date) || other.date == date)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,points,date,type);

@override
String toString() {
  return 'PointsRecordModel(id: $id, title: $title, points: $points, date: $date, type: $type)';
}


}

/// @nodoc
abstract mixin class $PointsRecordModelCopyWith<$Res>  {
  factory $PointsRecordModelCopyWith(PointsRecordModel value, $Res Function(PointsRecordModel) _then) = _$PointsRecordModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, int points, String date, String type
});




}
/// @nodoc
class _$PointsRecordModelCopyWithImpl<$Res>
    implements $PointsRecordModelCopyWith<$Res> {
  _$PointsRecordModelCopyWithImpl(this._self, this._then);

  final PointsRecordModel _self;
  final $Res Function(PointsRecordModel) _then;

/// Create a copy of PointsRecordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? points = null,Object? date = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PointsRecordModel].
extension PointsRecordModelPatterns on PointsRecordModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PointsRecordModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PointsRecordModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PointsRecordModel value)  $default,){
final _that = this;
switch (_that) {
case _PointsRecordModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PointsRecordModel value)?  $default,){
final _that = this;
switch (_that) {
case _PointsRecordModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  int points,  String date,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PointsRecordModel() when $default != null:
return $default(_that.id,_that.title,_that.points,_that.date,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  int points,  String date,  String type)  $default,) {final _that = this;
switch (_that) {
case _PointsRecordModel():
return $default(_that.id,_that.title,_that.points,_that.date,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  int points,  String date,  String type)?  $default,) {final _that = this;
switch (_that) {
case _PointsRecordModel() when $default != null:
return $default(_that.id,_that.title,_that.points,_that.date,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PointsRecordModel implements PointsRecordModel {
  const _PointsRecordModel({required this.id, required this.title, required this.points, required this.date, required this.type});
  factory _PointsRecordModel.fromJson(Map<String, dynamic> json) => _$PointsRecordModelFromJson(json);

/// 记录ID
@override final  String id;
/// 标题/描述
@override final  String title;
/// 变动积分 (正数表示获取，负数表示消耗)
@override final  int points;
/// 记录日期
@override final  String date;
/// 记录类型 (gain: 获取, use: 消耗)
@override final  String type;

/// Create a copy of PointsRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PointsRecordModelCopyWith<_PointsRecordModel> get copyWith => __$PointsRecordModelCopyWithImpl<_PointsRecordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PointsRecordModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PointsRecordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.points, points) || other.points == points)&&(identical(other.date, date) || other.date == date)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,points,date,type);

@override
String toString() {
  return 'PointsRecordModel(id: $id, title: $title, points: $points, date: $date, type: $type)';
}


}

/// @nodoc
abstract mixin class _$PointsRecordModelCopyWith<$Res> implements $PointsRecordModelCopyWith<$Res> {
  factory _$PointsRecordModelCopyWith(_PointsRecordModel value, $Res Function(_PointsRecordModel) _then) = __$PointsRecordModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, int points, String date, String type
});




}
/// @nodoc
class __$PointsRecordModelCopyWithImpl<$Res>
    implements _$PointsRecordModelCopyWith<$Res> {
  __$PointsRecordModelCopyWithImpl(this._self, this._then);

  final _PointsRecordModel _self;
  final $Res Function(_PointsRecordModel) _then;

/// Create a copy of PointsRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? points = null,Object? date = null,Object? type = null,}) {
  return _then(_PointsRecordModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
