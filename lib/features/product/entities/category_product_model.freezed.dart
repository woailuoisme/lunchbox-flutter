// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryProductModel {

/// 分类ID
 int get id;/// 分类名称
 String get name;/// 分类图标/缩略图
 String get thumb;/// 排序权重
 int get order;/// 分类下的产品列表
 List<ProductModel> get products;
/// Create a copy of CategoryProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryProductModelCopyWith<CategoryProductModel> get copyWith => _$CategoryProductModelCopyWithImpl<CategoryProductModel>(this as CategoryProductModel, _$identity);

  /// Serializes this CategoryProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.order, order) || other.order == order)&&const DeepCollectionEquality().equals(other.products, products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,thumb,order,const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'CategoryProductModel(id: $id, name: $name, thumb: $thumb, order: $order, products: $products)';
}


}

/// @nodoc
abstract mixin class $CategoryProductModelCopyWith<$Res>  {
  factory $CategoryProductModelCopyWith(CategoryProductModel value, $Res Function(CategoryProductModel) _then) = _$CategoryProductModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String thumb, int order, List<ProductModel> products
});




}
/// @nodoc
class _$CategoryProductModelCopyWithImpl<$Res>
    implements $CategoryProductModelCopyWith<$Res> {
  _$CategoryProductModelCopyWithImpl(this._self, this._then);

  final CategoryProductModel _self;
  final $Res Function(CategoryProductModel) _then;

/// Create a copy of CategoryProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? thumb = null,Object? order = null,Object? products = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryProductModel].
extension CategoryProductModelPatterns on CategoryProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryProductModel value)  $default,){
final _that = this;
switch (_that) {
case _CategoryProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String thumb,  int order,  List<ProductModel> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryProductModel() when $default != null:
return $default(_that.id,_that.name,_that.thumb,_that.order,_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String thumb,  int order,  List<ProductModel> products)  $default,) {final _that = this;
switch (_that) {
case _CategoryProductModel():
return $default(_that.id,_that.name,_that.thumb,_that.order,_that.products);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String thumb,  int order,  List<ProductModel> products)?  $default,) {final _that = this;
switch (_that) {
case _CategoryProductModel() when $default != null:
return $default(_that.id,_that.name,_that.thumb,_that.order,_that.products);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryProductModel implements CategoryProductModel {
  const _CategoryProductModel({required this.id, required this.name, required this.thumb, required this.order, final  List<ProductModel> products = const []}): _products = products;
  factory _CategoryProductModel.fromJson(Map<String, dynamic> json) => _$CategoryProductModelFromJson(json);

/// 分类ID
@override final  int id;
/// 分类名称
@override final  String name;
/// 分类图标/缩略图
@override final  String thumb;
/// 排序权重
@override final  int order;
/// 分类下的产品列表
 final  List<ProductModel> _products;
/// 分类下的产品列表
@override@JsonKey() List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of CategoryProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryProductModelCopyWith<_CategoryProductModel> get copyWith => __$CategoryProductModelCopyWithImpl<_CategoryProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.order, order) || other.order == order)&&const DeepCollectionEquality().equals(other._products, _products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,thumb,order,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'CategoryProductModel(id: $id, name: $name, thumb: $thumb, order: $order, products: $products)';
}


}

/// @nodoc
abstract mixin class _$CategoryProductModelCopyWith<$Res> implements $CategoryProductModelCopyWith<$Res> {
  factory _$CategoryProductModelCopyWith(_CategoryProductModel value, $Res Function(_CategoryProductModel) _then) = __$CategoryProductModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String thumb, int order, List<ProductModel> products
});




}
/// @nodoc
class __$CategoryProductModelCopyWithImpl<$Res>
    implements _$CategoryProductModelCopyWith<$Res> {
  __$CategoryProductModelCopyWithImpl(this._self, this._then);

  final _CategoryProductModel _self;
  final $Res Function(_CategoryProductModel) _then;

/// Create a copy of CategoryProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? thumb = null,Object? order = null,Object? products = null,}) {
  return _then(_CategoryProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}


}


/// @nodoc
mixin _$ProductModel {

/// 产品ID
 int get id;/// 产品名称
 String get name;/// 产品描述
 String get description;/// 产品价格
@JsonKey(fromJson: _priceFromJson) double get price;/// 产品原价（用于促销显示）
@JsonKey(name: 'original_price', fromJson: _priceFromJson) double? get originalPrice;/// 产品成本价
@JsonKey(name: 'cost_price', fromJson: _priceFromJson) double? get costPrice;/// 净利润
@JsonKey(name: 'net_profit', fromJson: _priceFromJson) double? get netProfit;/// 销量
 int get sales;/// 产品类型/类别
 String get type;/// 每日限购数量
@JsonKey(name: 'daily_limit') int? get dailyLimit;/// 产品图片URL/缩略图
@JsonKey(name: 'thumb') String get imageUrl;/// 库存信息
 ProductInventory? get inventory;/// 创建时间
@JsonKey(name: 'created_at') String? get createdAt;/// 是否为热门
 bool get isHot;/// 是否为促销商品
 bool get isPromotion;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.type, type) || other.type == type)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.inventory, inventory) || other.inventory == inventory)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isHot, isHot) || other.isHot == isHot)&&(identical(other.isPromotion, isPromotion) || other.isPromotion == isPromotion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,originalPrice,costPrice,netProfit,sales,type,dailyLimit,imageUrl,inventory,createdAt,isHot,isPromotion);

@override
String toString() {
  return 'ProductModel(id: $id, name: $name, description: $description, price: $price, originalPrice: $originalPrice, costPrice: $costPrice, netProfit: $netProfit, sales: $sales, type: $type, dailyLimit: $dailyLimit, imageUrl: $imageUrl, inventory: $inventory, createdAt: $createdAt, isHot: $isHot, isPromotion: $isPromotion)';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description,@JsonKey(fromJson: _priceFromJson) double price,@JsonKey(name: 'original_price', fromJson: _priceFromJson) double? originalPrice,@JsonKey(name: 'cost_price', fromJson: _priceFromJson) double? costPrice,@JsonKey(name: 'net_profit', fromJson: _priceFromJson) double? netProfit, int sales, String type,@JsonKey(name: 'daily_limit') int? dailyLimit,@JsonKey(name: 'thumb') String imageUrl, ProductInventory? inventory,@JsonKey(name: 'created_at') String? createdAt, bool isHot, bool isPromotion
});


$ProductInventoryCopyWith<$Res>? get inventory;

}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? price = null,Object? originalPrice = freezed,Object? costPrice = freezed,Object? netProfit = freezed,Object? sales = null,Object? type = null,Object? dailyLimit = freezed,Object? imageUrl = null,Object? inventory = freezed,Object? createdAt = freezed,Object? isHot = null,Object? isPromotion = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,netProfit: freezed == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double?,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,dailyLimit: freezed == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,inventory: freezed == inventory ? _self.inventory : inventory // ignore: cast_nullable_to_non_nullable
as ProductInventory?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,isHot: null == isHot ? _self.isHot : isHot // ignore: cast_nullable_to_non_nullable
as bool,isPromotion: null == isPromotion ? _self.isPromotion : isPromotion // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductInventoryCopyWith<$Res>? get inventory {
    if (_self.inventory == null) {
    return null;
  }

  return $ProductInventoryCopyWith<$Res>(_self.inventory!, (value) {
    return _then(_self.copyWith(inventory: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description, @JsonKey(fromJson: _priceFromJson)  double price, @JsonKey(name: 'original_price', fromJson: _priceFromJson)  double? originalPrice, @JsonKey(name: 'cost_price', fromJson: _priceFromJson)  double? costPrice, @JsonKey(name: 'net_profit', fromJson: _priceFromJson)  double? netProfit,  int sales,  String type, @JsonKey(name: 'daily_limit')  int? dailyLimit, @JsonKey(name: 'thumb')  String imageUrl,  ProductInventory? inventory, @JsonKey(name: 'created_at')  String? createdAt,  bool isHot,  bool isPromotion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.originalPrice,_that.costPrice,_that.netProfit,_that.sales,_that.type,_that.dailyLimit,_that.imageUrl,_that.inventory,_that.createdAt,_that.isHot,_that.isPromotion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description, @JsonKey(fromJson: _priceFromJson)  double price, @JsonKey(name: 'original_price', fromJson: _priceFromJson)  double? originalPrice, @JsonKey(name: 'cost_price', fromJson: _priceFromJson)  double? costPrice, @JsonKey(name: 'net_profit', fromJson: _priceFromJson)  double? netProfit,  int sales,  String type, @JsonKey(name: 'daily_limit')  int? dailyLimit, @JsonKey(name: 'thumb')  String imageUrl,  ProductInventory? inventory, @JsonKey(name: 'created_at')  String? createdAt,  bool isHot,  bool isPromotion)  $default,) {final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that.id,_that.name,_that.description,_that.price,_that.originalPrice,_that.costPrice,_that.netProfit,_that.sales,_that.type,_that.dailyLimit,_that.imageUrl,_that.inventory,_that.createdAt,_that.isHot,_that.isPromotion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description, @JsonKey(fromJson: _priceFromJson)  double price, @JsonKey(name: 'original_price', fromJson: _priceFromJson)  double? originalPrice, @JsonKey(name: 'cost_price', fromJson: _priceFromJson)  double? costPrice, @JsonKey(name: 'net_profit', fromJson: _priceFromJson)  double? netProfit,  int sales,  String type, @JsonKey(name: 'daily_limit')  int? dailyLimit, @JsonKey(name: 'thumb')  String imageUrl,  ProductInventory? inventory, @JsonKey(name: 'created_at')  String? createdAt,  bool isHot,  bool isPromotion)?  $default,) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.originalPrice,_that.costPrice,_that.netProfit,_that.sales,_that.type,_that.dailyLimit,_that.imageUrl,_that.inventory,_that.createdAt,_that.isHot,_that.isPromotion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductModel extends ProductModel {
  const _ProductModel({required this.id, required this.name, required this.description, @JsonKey(fromJson: _priceFromJson) required this.price, @JsonKey(name: 'original_price', fromJson: _priceFromJson) this.originalPrice, @JsonKey(name: 'cost_price', fromJson: _priceFromJson) this.costPrice, @JsonKey(name: 'net_profit', fromJson: _priceFromJson) this.netProfit, this.sales = 0, required this.type, @JsonKey(name: 'daily_limit') this.dailyLimit, @JsonKey(name: 'thumb') required this.imageUrl, this.inventory, @JsonKey(name: 'created_at') this.createdAt, this.isHot = false, this.isPromotion = false}): super._();
  factory _ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

/// 产品ID
@override final  int id;
/// 产品名称
@override final  String name;
/// 产品描述
@override final  String description;
/// 产品价格
@override@JsonKey(fromJson: _priceFromJson) final  double price;
/// 产品原价（用于促销显示）
@override@JsonKey(name: 'original_price', fromJson: _priceFromJson) final  double? originalPrice;
/// 产品成本价
@override@JsonKey(name: 'cost_price', fromJson: _priceFromJson) final  double? costPrice;
/// 净利润
@override@JsonKey(name: 'net_profit', fromJson: _priceFromJson) final  double? netProfit;
/// 销量
@override@JsonKey() final  int sales;
/// 产品类型/类别
@override final  String type;
/// 每日限购数量
@override@JsonKey(name: 'daily_limit') final  int? dailyLimit;
/// 产品图片URL/缩略图
@override@JsonKey(name: 'thumb') final  String imageUrl;
/// 库存信息
@override final  ProductInventory? inventory;
/// 创建时间
@override@JsonKey(name: 'created_at') final  String? createdAt;
/// 是否为热门
@override@JsonKey() final  bool isHot;
/// 是否为促销商品
@override@JsonKey() final  bool isPromotion;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.type, type) || other.type == type)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.inventory, inventory) || other.inventory == inventory)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isHot, isHot) || other.isHot == isHot)&&(identical(other.isPromotion, isPromotion) || other.isPromotion == isPromotion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,originalPrice,costPrice,netProfit,sales,type,dailyLimit,imageUrl,inventory,createdAt,isHot,isPromotion);

@override
String toString() {
  return 'ProductModel(id: $id, name: $name, description: $description, price: $price, originalPrice: $originalPrice, costPrice: $costPrice, netProfit: $netProfit, sales: $sales, type: $type, dailyLimit: $dailyLimit, imageUrl: $imageUrl, inventory: $inventory, createdAt: $createdAt, isHot: $isHot, isPromotion: $isPromotion)';
}


}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(_ProductModel value, $Res Function(_ProductModel) _then) = __$ProductModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description,@JsonKey(fromJson: _priceFromJson) double price,@JsonKey(name: 'original_price', fromJson: _priceFromJson) double? originalPrice,@JsonKey(name: 'cost_price', fromJson: _priceFromJson) double? costPrice,@JsonKey(name: 'net_profit', fromJson: _priceFromJson) double? netProfit, int sales, String type,@JsonKey(name: 'daily_limit') int? dailyLimit,@JsonKey(name: 'thumb') String imageUrl, ProductInventory? inventory,@JsonKey(name: 'created_at') String? createdAt, bool isHot, bool isPromotion
});


@override $ProductInventoryCopyWith<$Res>? get inventory;

}
/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? price = null,Object? originalPrice = freezed,Object? costPrice = freezed,Object? netProfit = freezed,Object? sales = null,Object? type = null,Object? dailyLimit = freezed,Object? imageUrl = null,Object? inventory = freezed,Object? createdAt = freezed,Object? isHot = null,Object? isPromotion = null,}) {
  return _then(_ProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,netProfit: freezed == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double?,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,dailyLimit: freezed == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,inventory: freezed == inventory ? _self.inventory : inventory // ignore: cast_nullable_to_non_nullable
as ProductInventory?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,isHot: null == isHot ? _self.isHot : isHot // ignore: cast_nullable_to_non_nullable
as bool,isPromotion: null == isPromotion ? _self.isPromotion : isPromotion // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductInventoryCopyWith<$Res>? get inventory {
    if (_self.inventory == null) {
    return null;
  }

  return $ProductInventoryCopyWith<$Res>(_self.inventory!, (value) {
    return _then(_self.copyWith(inventory: value));
  });
}
}


/// @nodoc
mixin _$ProductInventory {

/// 设备编号
 String get no;/// 产品库存数量
@JsonKey(name: 'product_count') int get productCount;
/// Create a copy of ProductInventory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductInventoryCopyWith<ProductInventory> get copyWith => _$ProductInventoryCopyWithImpl<ProductInventory>(this as ProductInventory, _$identity);

  /// Serializes this ProductInventory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductInventory&&(identical(other.no, no) || other.no == no)&&(identical(other.productCount, productCount) || other.productCount == productCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,no,productCount);

@override
String toString() {
  return 'ProductInventory(no: $no, productCount: $productCount)';
}


}

/// @nodoc
abstract mixin class $ProductInventoryCopyWith<$Res>  {
  factory $ProductInventoryCopyWith(ProductInventory value, $Res Function(ProductInventory) _then) = _$ProductInventoryCopyWithImpl;
@useResult
$Res call({
 String no,@JsonKey(name: 'product_count') int productCount
});




}
/// @nodoc
class _$ProductInventoryCopyWithImpl<$Res>
    implements $ProductInventoryCopyWith<$Res> {
  _$ProductInventoryCopyWithImpl(this._self, this._then);

  final ProductInventory _self;
  final $Res Function(ProductInventory) _then;

/// Create a copy of ProductInventory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? no = null,Object? productCount = null,}) {
  return _then(_self.copyWith(
no: null == no ? _self.no : no // ignore: cast_nullable_to_non_nullable
as String,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductInventory].
extension ProductInventoryPatterns on ProductInventory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductInventory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductInventory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductInventory value)  $default,){
final _that = this;
switch (_that) {
case _ProductInventory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductInventory value)?  $default,){
final _that = this;
switch (_that) {
case _ProductInventory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String no, @JsonKey(name: 'product_count')  int productCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductInventory() when $default != null:
return $default(_that.no,_that.productCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String no, @JsonKey(name: 'product_count')  int productCount)  $default,) {final _that = this;
switch (_that) {
case _ProductInventory():
return $default(_that.no,_that.productCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String no, @JsonKey(name: 'product_count')  int productCount)?  $default,) {final _that = this;
switch (_that) {
case _ProductInventory() when $default != null:
return $default(_that.no,_that.productCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductInventory implements ProductInventory {
  const _ProductInventory({required this.no, @JsonKey(name: 'product_count') required this.productCount});
  factory _ProductInventory.fromJson(Map<String, dynamic> json) => _$ProductInventoryFromJson(json);

/// 设备编号
@override final  String no;
/// 产品库存数量
@override@JsonKey(name: 'product_count') final  int productCount;

/// Create a copy of ProductInventory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductInventoryCopyWith<_ProductInventory> get copyWith => __$ProductInventoryCopyWithImpl<_ProductInventory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductInventoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductInventory&&(identical(other.no, no) || other.no == no)&&(identical(other.productCount, productCount) || other.productCount == productCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,no,productCount);

@override
String toString() {
  return 'ProductInventory(no: $no, productCount: $productCount)';
}


}

/// @nodoc
abstract mixin class _$ProductInventoryCopyWith<$Res> implements $ProductInventoryCopyWith<$Res> {
  factory _$ProductInventoryCopyWith(_ProductInventory value, $Res Function(_ProductInventory) _then) = __$ProductInventoryCopyWithImpl;
@override @useResult
$Res call({
 String no,@JsonKey(name: 'product_count') int productCount
});




}
/// @nodoc
class __$ProductInventoryCopyWithImpl<$Res>
    implements _$ProductInventoryCopyWith<$Res> {
  __$ProductInventoryCopyWithImpl(this._self, this._then);

  final _ProductInventory _self;
  final $Res Function(_ProductInventory) _then;

/// Create a copy of ProductInventory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? no = null,Object? productCount = null,}) {
  return _then(_ProductInventory(
no: null == no ? _self.no : no // ignore: cast_nullable_to_non_nullable
as String,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
