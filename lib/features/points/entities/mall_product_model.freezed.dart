// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mall_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MallProductModel {

/// 商品ID
 String get id;/// 商品标题
 String get title;/// 价值金额
@JsonKey(name: 'amount_value') int get amountValue;/// 兑换所需积分
@JsonKey(name: 'points_cost') int get pointsCost;/// 商品类型
 String get type;/// 是否热门
@JsonKey(name: 'is_hot') bool get isHot;/// 商品图片
 String get image;
/// Create a copy of MallProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MallProductModelCopyWith<MallProductModel> get copyWith => _$MallProductModelCopyWithImpl<MallProductModel>(this as MallProductModel, _$identity);

  /// Serializes this MallProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MallProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amountValue, amountValue) || other.amountValue == amountValue)&&(identical(other.pointsCost, pointsCost) || other.pointsCost == pointsCost)&&(identical(other.type, type) || other.type == type)&&(identical(other.isHot, isHot) || other.isHot == isHot)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amountValue,pointsCost,type,isHot,image);

@override
String toString() {
  return 'MallProductModel(id: $id, title: $title, amountValue: $amountValue, pointsCost: $pointsCost, type: $type, isHot: $isHot, image: $image)';
}


}

/// @nodoc
abstract mixin class $MallProductModelCopyWith<$Res>  {
  factory $MallProductModelCopyWith(MallProductModel value, $Res Function(MallProductModel) _then) = _$MallProductModelCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'amount_value') int amountValue,@JsonKey(name: 'points_cost') int pointsCost, String type,@JsonKey(name: 'is_hot') bool isHot, String image
});




}
/// @nodoc
class _$MallProductModelCopyWithImpl<$Res>
    implements $MallProductModelCopyWith<$Res> {
  _$MallProductModelCopyWithImpl(this._self, this._then);

  final MallProductModel _self;
  final $Res Function(MallProductModel) _then;

/// Create a copy of MallProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? amountValue = null,Object? pointsCost = null,Object? type = null,Object? isHot = null,Object? image = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amountValue: null == amountValue ? _self.amountValue : amountValue // ignore: cast_nullable_to_non_nullable
as int,pointsCost: null == pointsCost ? _self.pointsCost : pointsCost // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isHot: null == isHot ? _self.isHot : isHot // ignore: cast_nullable_to_non_nullable
as bool,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MallProductModel].
extension MallProductModelPatterns on MallProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MallProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MallProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MallProductModel value)  $default,){
final _that = this;
switch (_that) {
case _MallProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MallProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _MallProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'amount_value')  int amountValue, @JsonKey(name: 'points_cost')  int pointsCost,  String type, @JsonKey(name: 'is_hot')  bool isHot,  String image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MallProductModel() when $default != null:
return $default(_that.id,_that.title,_that.amountValue,_that.pointsCost,_that.type,_that.isHot,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'amount_value')  int amountValue, @JsonKey(name: 'points_cost')  int pointsCost,  String type, @JsonKey(name: 'is_hot')  bool isHot,  String image)  $default,) {final _that = this;
switch (_that) {
case _MallProductModel():
return $default(_that.id,_that.title,_that.amountValue,_that.pointsCost,_that.type,_that.isHot,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'amount_value')  int amountValue, @JsonKey(name: 'points_cost')  int pointsCost,  String type, @JsonKey(name: 'is_hot')  bool isHot,  String image)?  $default,) {final _that = this;
switch (_that) {
case _MallProductModel() when $default != null:
return $default(_that.id,_that.title,_that.amountValue,_that.pointsCost,_that.type,_that.isHot,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MallProductModel implements MallProductModel {
  const _MallProductModel({required this.id, required this.title, @JsonKey(name: 'amount_value') required this.amountValue, @JsonKey(name: 'points_cost') required this.pointsCost, required this.type, @JsonKey(name: 'is_hot') this.isHot = false, this.image = ''});
  factory _MallProductModel.fromJson(Map<String, dynamic> json) => _$MallProductModelFromJson(json);

/// 商品ID
@override final  String id;
/// 商品标题
@override final  String title;
/// 价值金额
@override@JsonKey(name: 'amount_value') final  int amountValue;
/// 兑换所需积分
@override@JsonKey(name: 'points_cost') final  int pointsCost;
/// 商品类型
@override final  String type;
/// 是否热门
@override@JsonKey(name: 'is_hot') final  bool isHot;
/// 商品图片
@override@JsonKey() final  String image;

/// Create a copy of MallProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MallProductModelCopyWith<_MallProductModel> get copyWith => __$MallProductModelCopyWithImpl<_MallProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MallProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MallProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amountValue, amountValue) || other.amountValue == amountValue)&&(identical(other.pointsCost, pointsCost) || other.pointsCost == pointsCost)&&(identical(other.type, type) || other.type == type)&&(identical(other.isHot, isHot) || other.isHot == isHot)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amountValue,pointsCost,type,isHot,image);

@override
String toString() {
  return 'MallProductModel(id: $id, title: $title, amountValue: $amountValue, pointsCost: $pointsCost, type: $type, isHot: $isHot, image: $image)';
}


}

/// @nodoc
abstract mixin class _$MallProductModelCopyWith<$Res> implements $MallProductModelCopyWith<$Res> {
  factory _$MallProductModelCopyWith(_MallProductModel value, $Res Function(_MallProductModel) _then) = __$MallProductModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'amount_value') int amountValue,@JsonKey(name: 'points_cost') int pointsCost, String type,@JsonKey(name: 'is_hot') bool isHot, String image
});




}
/// @nodoc
class __$MallProductModelCopyWithImpl<$Res>
    implements _$MallProductModelCopyWith<$Res> {
  __$MallProductModelCopyWithImpl(this._self, this._then);

  final _MallProductModel _self;
  final $Res Function(_MallProductModel) _then;

/// Create a copy of MallProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? amountValue = null,Object? pointsCost = null,Object? type = null,Object? isHot = null,Object? image = null,}) {
  return _then(_MallProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amountValue: null == amountValue ? _self.amountValue : amountValue // ignore: cast_nullable_to_non_nullable
as int,pointsCost: null == pointsCost ? _self.pointsCost : pointsCost // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isHot: null == isHot ? _self.isHot : isHot // ignore: cast_nullable_to_non_nullable
as bool,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
