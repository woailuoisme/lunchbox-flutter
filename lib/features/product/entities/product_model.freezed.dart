// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {

/// 产品ID
 String get id;/// 产品名称
 String get name;/// 产品描述
 String get description;/// 产品价格
 double get price;/// 产品图片URL
 String get imageUrl;/// 产品更新时间
 DateTime get updateTime;/// 产品原价（用于促销显示）
 double? get originalPrice;/// 产品库存
 int get stock;/// 产品类别
 String get category;/// 产品是否在售
 bool get isAvailable;/// 产品是否为热门
 bool get isHot;/// 产品是否为促销商品
 bool get isPromotion;/// 月售数量
 int get monthlySales;/// 产品规格信息
 String? get specifications;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.category, category) || other.category == category)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isHot, isHot) || other.isHot == isHot)&&(identical(other.isPromotion, isPromotion) || other.isPromotion == isPromotion)&&(identical(other.monthlySales, monthlySales) || other.monthlySales == monthlySales)&&(identical(other.specifications, specifications) || other.specifications == specifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,imageUrl,updateTime,originalPrice,stock,category,isAvailable,isHot,isPromotion,monthlySales,specifications);

@override
String toString() {
  return 'ProductModel(id: $id, name: $name, description: $description, price: $price, imageUrl: $imageUrl, updateTime: $updateTime, originalPrice: $originalPrice, stock: $stock, category: $category, isAvailable: $isAvailable, isHot: $isHot, isPromotion: $isPromotion, monthlySales: $monthlySales, specifications: $specifications)';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, double price, String imageUrl, DateTime updateTime, double? originalPrice, int stock, String category, bool isAvailable, bool isHot, bool isPromotion, int monthlySales, String? specifications
});




}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? price = null,Object? imageUrl = null,Object? updateTime = null,Object? originalPrice = freezed,Object? stock = null,Object? category = null,Object? isAvailable = null,Object? isHot = null,Object? isPromotion = null,Object? monthlySales = null,Object? specifications = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,updateTime: null == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as DateTime,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isHot: null == isHot ? _self.isHot : isHot // ignore: cast_nullable_to_non_nullable
as bool,isPromotion: null == isPromotion ? _self.isPromotion : isPromotion // ignore: cast_nullable_to_non_nullable
as bool,monthlySales: null == monthlySales ? _self.monthlySales : monthlySales // ignore: cast_nullable_to_non_nullable
as int,specifications: freezed == specifications ? _self.specifications : specifications // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double price,  String imageUrl,  DateTime updateTime,  double? originalPrice,  int stock,  String category,  bool isAvailable,  bool isHot,  bool isPromotion,  int monthlySales,  String? specifications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.imageUrl,_that.updateTime,_that.originalPrice,_that.stock,_that.category,_that.isAvailable,_that.isHot,_that.isPromotion,_that.monthlySales,_that.specifications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double price,  String imageUrl,  DateTime updateTime,  double? originalPrice,  int stock,  String category,  bool isAvailable,  bool isHot,  bool isPromotion,  int monthlySales,  String? specifications)  $default,) {final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that.id,_that.name,_that.description,_that.price,_that.imageUrl,_that.updateTime,_that.originalPrice,_that.stock,_that.category,_that.isAvailable,_that.isHot,_that.isPromotion,_that.monthlySales,_that.specifications);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  double price,  String imageUrl,  DateTime updateTime,  double? originalPrice,  int stock,  String category,  bool isAvailable,  bool isHot,  bool isPromotion,  int monthlySales,  String? specifications)?  $default,) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.imageUrl,_that.updateTime,_that.originalPrice,_that.stock,_that.category,_that.isAvailable,_that.isHot,_that.isPromotion,_that.monthlySales,_that.specifications);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductModel extends ProductModel {
  const _ProductModel({required this.id, required this.name, required this.description, required this.price, required this.imageUrl, required this.updateTime, this.originalPrice, this.stock = 0, this.category = 'food', this.isAvailable = true, this.isHot = false, this.isPromotion = false, this.monthlySales = 0, this.specifications}): super._();
  factory _ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

/// 产品ID
@override final  String id;
/// 产品名称
@override final  String name;
/// 产品描述
@override final  String description;
/// 产品价格
@override final  double price;
/// 产品图片URL
@override final  String imageUrl;
/// 产品更新时间
@override final  DateTime updateTime;
/// 产品原价（用于促销显示）
@override final  double? originalPrice;
/// 产品库存
@override@JsonKey() final  int stock;
/// 产品类别
@override@JsonKey() final  String category;
/// 产品是否在售
@override@JsonKey() final  bool isAvailable;
/// 产品是否为热门
@override@JsonKey() final  bool isHot;
/// 产品是否为促销商品
@override@JsonKey() final  bool isPromotion;
/// 月售数量
@override@JsonKey() final  int monthlySales;
/// 产品规格信息
@override final  String? specifications;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductModelCopyWith<_ProductModel> get copyWith => __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.category, category) || other.category == category)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isHot, isHot) || other.isHot == isHot)&&(identical(other.isPromotion, isPromotion) || other.isPromotion == isPromotion)&&(identical(other.monthlySales, monthlySales) || other.monthlySales == monthlySales)&&(identical(other.specifications, specifications) || other.specifications == specifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,imageUrl,updateTime,originalPrice,stock,category,isAvailable,isHot,isPromotion,monthlySales,specifications);

@override
String toString() {
  return 'ProductModel(id: $id, name: $name, description: $description, price: $price, imageUrl: $imageUrl, updateTime: $updateTime, originalPrice: $originalPrice, stock: $stock, category: $category, isAvailable: $isAvailable, isHot: $isHot, isPromotion: $isPromotion, monthlySales: $monthlySales, specifications: $specifications)';
}


}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(_ProductModel value, $Res Function(_ProductModel) _then) = __$ProductModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, double price, String imageUrl, DateTime updateTime, double? originalPrice, int stock, String category, bool isAvailable, bool isHot, bool isPromotion, int monthlySales, String? specifications
});




}
/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? price = null,Object? imageUrl = null,Object? updateTime = null,Object? originalPrice = freezed,Object? stock = null,Object? category = null,Object? isAvailable = null,Object? isHot = null,Object? isPromotion = null,Object? monthlySales = null,Object? specifications = freezed,}) {
  return _then(_ProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,updateTime: null == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as DateTime,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isHot: null == isHot ? _self.isHot : isHot // ignore: cast_nullable_to_non_nullable
as bool,isPromotion: null == isPromotion ? _self.isPromotion : isPromotion // ignore: cast_nullable_to_non_nullable
as bool,monthlySales: null == monthlySales ? _self.monthlySales : monthlySales // ignore: cast_nullable_to_non_nullable
as int,specifications: freezed == specifications ? _self.specifications : specifications // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
