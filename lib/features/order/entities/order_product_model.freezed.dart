// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderProductModel {

/// 产品ID
 int get id;/// 产品名称
 String get name;/// 产品分类
 String get category;/// 产品缩略图
 String get thumb;/// 产品描述
 String get description;/// 销售价格 (API 返回的是 String)
@JsonKey(name: 'sale_price') String get salePrice;/// 购买数量
 int get quantity;
/// Create a copy of OrderProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderProductModelCopyWith<OrderProductModel> get copyWith => _$OrderProductModelCopyWithImpl<OrderProductModel>(this as OrderProductModel, _$identity);

  /// Serializes this OrderProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.description, description) || other.description == description)&&(identical(other.salePrice, salePrice) || other.salePrice == salePrice)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,thumb,description,salePrice,quantity);

@override
String toString() {
  return 'OrderProductModel(id: $id, name: $name, category: $category, thumb: $thumb, description: $description, salePrice: $salePrice, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $OrderProductModelCopyWith<$Res>  {
  factory $OrderProductModelCopyWith(OrderProductModel value, $Res Function(OrderProductModel) _then) = _$OrderProductModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String category, String thumb, String description,@JsonKey(name: 'sale_price') String salePrice, int quantity
});




}
/// @nodoc
class _$OrderProductModelCopyWithImpl<$Res>
    implements $OrderProductModelCopyWith<$Res> {
  _$OrderProductModelCopyWithImpl(this._self, this._then);

  final OrderProductModel _self;
  final $Res Function(OrderProductModel) _then;

/// Create a copy of OrderProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? thumb = null,Object? description = null,Object? salePrice = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,salePrice: null == salePrice ? _self.salePrice : salePrice // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderProductModel].
extension OrderProductModelPatterns on OrderProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderProductModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String category,  String thumb,  String description, @JsonKey(name: 'sale_price')  String salePrice,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderProductModel() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.thumb,_that.description,_that.salePrice,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String category,  String thumb,  String description, @JsonKey(name: 'sale_price')  String salePrice,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _OrderProductModel():
return $default(_that.id,_that.name,_that.category,_that.thumb,_that.description,_that.salePrice,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String category,  String thumb,  String description, @JsonKey(name: 'sale_price')  String salePrice,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _OrderProductModel() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.thumb,_that.description,_that.salePrice,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderProductModel extends OrderProductModel {
  const _OrderProductModel({required this.id, this.name = '', this.category = '', this.thumb = '', this.description = '', @JsonKey(name: 'sale_price') this.salePrice = '', this.quantity = 0}): super._();
  factory _OrderProductModel.fromJson(Map<String, dynamic> json) => _$OrderProductModelFromJson(json);

/// 产品ID
@override final  int id;
/// 产品名称
@override@JsonKey() final  String name;
/// 产品分类
@override@JsonKey() final  String category;
/// 产品缩略图
@override@JsonKey() final  String thumb;
/// 产品描述
@override@JsonKey() final  String description;
/// 销售价格 (API 返回的是 String)
@override@JsonKey(name: 'sale_price') final  String salePrice;
/// 购买数量
@override@JsonKey() final  int quantity;

/// Create a copy of OrderProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderProductModelCopyWith<_OrderProductModel> get copyWith => __$OrderProductModelCopyWithImpl<_OrderProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.description, description) || other.description == description)&&(identical(other.salePrice, salePrice) || other.salePrice == salePrice)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,thumb,description,salePrice,quantity);

@override
String toString() {
  return 'OrderProductModel(id: $id, name: $name, category: $category, thumb: $thumb, description: $description, salePrice: $salePrice, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$OrderProductModelCopyWith<$Res> implements $OrderProductModelCopyWith<$Res> {
  factory _$OrderProductModelCopyWith(_OrderProductModel value, $Res Function(_OrderProductModel) _then) = __$OrderProductModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String category, String thumb, String description,@JsonKey(name: 'sale_price') String salePrice, int quantity
});




}
/// @nodoc
class __$OrderProductModelCopyWithImpl<$Res>
    implements _$OrderProductModelCopyWith<$Res> {
  __$OrderProductModelCopyWithImpl(this._self, this._then);

  final _OrderProductModel _self;
  final $Res Function(_OrderProductModel) _then;

/// Create a copy of OrderProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? thumb = null,Object? description = null,Object? salePrice = null,Object? quantity = null,}) {
  return _then(_OrderProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,salePrice: null == salePrice ? _self.salePrice : salePrice // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
