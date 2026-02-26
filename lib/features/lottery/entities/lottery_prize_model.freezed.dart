// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lottery_prize_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LotteryPrizeModel {

/// 奖品ID
 String get id;/// 奖品名称
 String get name;/// 奖品图片
 String get image;/// 奖品类型 (coupon: 优惠券, point: 积分, physical: 实物, none: 未中奖)
 String get type;/// 奖品价值 (金额或积分数)
 double get value;/// 奖品描述
 String get description;
/// Create a copy of LotteryPrizeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LotteryPrizeModelCopyWith<LotteryPrizeModel> get copyWith => _$LotteryPrizeModelCopyWithImpl<LotteryPrizeModel>(this as LotteryPrizeModel, _$identity);

  /// Serializes this LotteryPrizeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LotteryPrizeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,type,value,description);

@override
String toString() {
  return 'LotteryPrizeModel(id: $id, name: $name, image: $image, type: $type, value: $value, description: $description)';
}


}

/// @nodoc
abstract mixin class $LotteryPrizeModelCopyWith<$Res>  {
  factory $LotteryPrizeModelCopyWith(LotteryPrizeModel value, $Res Function(LotteryPrizeModel) _then) = _$LotteryPrizeModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String image, String type, double value, String description
});




}
/// @nodoc
class _$LotteryPrizeModelCopyWithImpl<$Res>
    implements $LotteryPrizeModelCopyWith<$Res> {
  _$LotteryPrizeModelCopyWithImpl(this._self, this._then);

  final LotteryPrizeModel _self;
  final $Res Function(LotteryPrizeModel) _then;

/// Create a copy of LotteryPrizeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? image = null,Object? type = null,Object? value = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LotteryPrizeModel].
extension LotteryPrizeModelPatterns on LotteryPrizeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LotteryPrizeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LotteryPrizeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LotteryPrizeModel value)  $default,){
final _that = this;
switch (_that) {
case _LotteryPrizeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LotteryPrizeModel value)?  $default,){
final _that = this;
switch (_that) {
case _LotteryPrizeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String image,  String type,  double value,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LotteryPrizeModel() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.type,_that.value,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String image,  String type,  double value,  String description)  $default,) {final _that = this;
switch (_that) {
case _LotteryPrizeModel():
return $default(_that.id,_that.name,_that.image,_that.type,_that.value,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String image,  String type,  double value,  String description)?  $default,) {final _that = this;
switch (_that) {
case _LotteryPrizeModel() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.type,_that.value,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LotteryPrizeModel implements LotteryPrizeModel {
  const _LotteryPrizeModel({required this.id, required this.name, this.image = '', required this.type, this.value = 0, this.description = ''});
  factory _LotteryPrizeModel.fromJson(Map<String, dynamic> json) => _$LotteryPrizeModelFromJson(json);

/// 奖品ID
@override final  String id;
/// 奖品名称
@override final  String name;
/// 奖品图片
@override@JsonKey() final  String image;
/// 奖品类型 (coupon: 优惠券, point: 积分, physical: 实物, none: 未中奖)
@override final  String type;
/// 奖品价值 (金额或积分数)
@override@JsonKey() final  double value;
/// 奖品描述
@override@JsonKey() final  String description;

/// Create a copy of LotteryPrizeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LotteryPrizeModelCopyWith<_LotteryPrizeModel> get copyWith => __$LotteryPrizeModelCopyWithImpl<_LotteryPrizeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LotteryPrizeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LotteryPrizeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,type,value,description);

@override
String toString() {
  return 'LotteryPrizeModel(id: $id, name: $name, image: $image, type: $type, value: $value, description: $description)';
}


}

/// @nodoc
abstract mixin class _$LotteryPrizeModelCopyWith<$Res> implements $LotteryPrizeModelCopyWith<$Res> {
  factory _$LotteryPrizeModelCopyWith(_LotteryPrizeModel value, $Res Function(_LotteryPrizeModel) _then) = __$LotteryPrizeModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String image, String type, double value, String description
});




}
/// @nodoc
class __$LotteryPrizeModelCopyWithImpl<$Res>
    implements _$LotteryPrizeModelCopyWith<$Res> {
  __$LotteryPrizeModelCopyWithImpl(this._self, this._then);

  final _LotteryPrizeModel _self;
  final $Res Function(_LotteryPrizeModel) _then;

/// Create a copy of LotteryPrizeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? image = null,Object? type = null,Object? value = null,Object? description = null,}) {
  return _then(_LotteryPrizeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
