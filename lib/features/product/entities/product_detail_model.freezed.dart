// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductDetailModel {

/// 商品ID
 int get id;/// 商品名称
 String get name;/// 商品简述
 String get description;/// 商品主图
@JsonKey(name: 'thumb') String get imageUrl;/// 商品详情 HTML 内容
 String get content;/// 商品价格
@JsonKey(fromJson: _priceFromJson) double get price;/// 商品原价
@JsonKey(name: 'original_price', fromJson: _priceFromJson) double? get originalPrice;/// 成本价
@JsonKey(name: 'cost_price', fromJson: _priceFromJson) double? get costPrice;/// 净利润
@JsonKey(name: 'net_profit', fromJson: _priceFromJson) double? get netProfit;/// 保质期 (天)
@JsonKey(name: 'shelf_life') int? get shelfLife;/// 销量
 int get sales;/// 加热时间 (秒)
@JsonKey(name: 'heating_time') int? get heatingTime;/// 商品类型
 String get type;/// 酱料ID
@JsonKey(name: 'sauce_id') int? get sauceId;/// 重量
 int? get weigh;/// 每日限购
@JsonKey(name: 'daily_limit') int? get dailyLimit;/// 规格
 String? get spec;/// 供应链
@JsonKey(name: 'supply_chain') String? get supplyChain;/// 是否上架
@JsonKey(name: 'is_enabled') bool get isEnabled;/// 限时折扣
@JsonKey(name: 'time_discount') String? get timeDiscount;/// 分类信息
 ProductDetailCategory? get category;/// 评价列表
 List<ProductDetailComment> get comments;/// 媒体资源
 List<ProductDetailMedia> get media;/// 创建时间
@JsonKey(name: 'created_at') String? get createdAt;/// 更新时间
@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of ProductDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailModelCopyWith<ProductDetailModel> get copyWith => _$ProductDetailModelCopyWithImpl<ProductDetailModel>(this as ProductDetailModel, _$identity);

  /// Serializes this ProductDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.content, content) || other.content == content)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit)&&(identical(other.shelfLife, shelfLife) || other.shelfLife == shelfLife)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.heatingTime, heatingTime) || other.heatingTime == heatingTime)&&(identical(other.type, type) || other.type == type)&&(identical(other.sauceId, sauceId) || other.sauceId == sauceId)&&(identical(other.weigh, weigh) || other.weigh == weigh)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.spec, spec) || other.spec == spec)&&(identical(other.supplyChain, supplyChain) || other.supplyChain == supplyChain)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.timeDiscount, timeDiscount) || other.timeDiscount == timeDiscount)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.comments, comments)&&const DeepCollectionEquality().equals(other.media, media)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,description,imageUrl,content,price,originalPrice,costPrice,netProfit,shelfLife,sales,heatingTime,type,sauceId,weigh,dailyLimit,spec,supplyChain,isEnabled,timeDiscount,category,const DeepCollectionEquality().hash(comments),const DeepCollectionEquality().hash(media),createdAt,updatedAt]);

@override
String toString() {
  return 'ProductDetailModel(id: $id, name: $name, description: $description, imageUrl: $imageUrl, content: $content, price: $price, originalPrice: $originalPrice, costPrice: $costPrice, netProfit: $netProfit, shelfLife: $shelfLife, sales: $sales, heatingTime: $heatingTime, type: $type, sauceId: $sauceId, weigh: $weigh, dailyLimit: $dailyLimit, spec: $spec, supplyChain: $supplyChain, isEnabled: $isEnabled, timeDiscount: $timeDiscount, category: $category, comments: $comments, media: $media, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProductDetailModelCopyWith<$Res>  {
  factory $ProductDetailModelCopyWith(ProductDetailModel value, $Res Function(ProductDetailModel) _then) = _$ProductDetailModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description,@JsonKey(name: 'thumb') String imageUrl, String content,@JsonKey(fromJson: _priceFromJson) double price,@JsonKey(name: 'original_price', fromJson: _priceFromJson) double? originalPrice,@JsonKey(name: 'cost_price', fromJson: _priceFromJson) double? costPrice,@JsonKey(name: 'net_profit', fromJson: _priceFromJson) double? netProfit,@JsonKey(name: 'shelf_life') int? shelfLife, int sales,@JsonKey(name: 'heating_time') int? heatingTime, String type,@JsonKey(name: 'sauce_id') int? sauceId, int? weigh,@JsonKey(name: 'daily_limit') int? dailyLimit, String? spec,@JsonKey(name: 'supply_chain') String? supplyChain,@JsonKey(name: 'is_enabled') bool isEnabled,@JsonKey(name: 'time_discount') String? timeDiscount, ProductDetailCategory? category, List<ProductDetailComment> comments, List<ProductDetailMedia> media,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});


$ProductDetailCategoryCopyWith<$Res>? get category;

}
/// @nodoc
class _$ProductDetailModelCopyWithImpl<$Res>
    implements $ProductDetailModelCopyWith<$Res> {
  _$ProductDetailModelCopyWithImpl(this._self, this._then);

  final ProductDetailModel _self;
  final $Res Function(ProductDetailModel) _then;

/// Create a copy of ProductDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? imageUrl = null,Object? content = null,Object? price = null,Object? originalPrice = freezed,Object? costPrice = freezed,Object? netProfit = freezed,Object? shelfLife = freezed,Object? sales = null,Object? heatingTime = freezed,Object? type = null,Object? sauceId = freezed,Object? weigh = freezed,Object? dailyLimit = freezed,Object? spec = freezed,Object? supplyChain = freezed,Object? isEnabled = null,Object? timeDiscount = freezed,Object? category = freezed,Object? comments = null,Object? media = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,netProfit: freezed == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double?,shelfLife: freezed == shelfLife ? _self.shelfLife : shelfLife // ignore: cast_nullable_to_non_nullable
as int?,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as int,heatingTime: freezed == heatingTime ? _self.heatingTime : heatingTime // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,sauceId: freezed == sauceId ? _self.sauceId : sauceId // ignore: cast_nullable_to_non_nullable
as int?,weigh: freezed == weigh ? _self.weigh : weigh // ignore: cast_nullable_to_non_nullable
as int?,dailyLimit: freezed == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as int?,spec: freezed == spec ? _self.spec : spec // ignore: cast_nullable_to_non_nullable
as String?,supplyChain: freezed == supplyChain ? _self.supplyChain : supplyChain // ignore: cast_nullable_to_non_nullable
as String?,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,timeDiscount: freezed == timeDiscount ? _self.timeDiscount : timeDiscount // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ProductDetailCategory?,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<ProductDetailComment>,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<ProductDetailMedia>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ProductDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductDetailCategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $ProductDetailCategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductDetailModel].
extension ProductDetailModelPatterns on ProductDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetailModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description, @JsonKey(name: 'thumb')  String imageUrl,  String content, @JsonKey(fromJson: _priceFromJson)  double price, @JsonKey(name: 'original_price', fromJson: _priceFromJson)  double? originalPrice, @JsonKey(name: 'cost_price', fromJson: _priceFromJson)  double? costPrice, @JsonKey(name: 'net_profit', fromJson: _priceFromJson)  double? netProfit, @JsonKey(name: 'shelf_life')  int? shelfLife,  int sales, @JsonKey(name: 'heating_time')  int? heatingTime,  String type, @JsonKey(name: 'sauce_id')  int? sauceId,  int? weigh, @JsonKey(name: 'daily_limit')  int? dailyLimit,  String? spec, @JsonKey(name: 'supply_chain')  String? supplyChain, @JsonKey(name: 'is_enabled')  bool isEnabled, @JsonKey(name: 'time_discount')  String? timeDiscount,  ProductDetailCategory? category,  List<ProductDetailComment> comments,  List<ProductDetailMedia> media, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.content,_that.price,_that.originalPrice,_that.costPrice,_that.netProfit,_that.shelfLife,_that.sales,_that.heatingTime,_that.type,_that.sauceId,_that.weigh,_that.dailyLimit,_that.spec,_that.supplyChain,_that.isEnabled,_that.timeDiscount,_that.category,_that.comments,_that.media,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description, @JsonKey(name: 'thumb')  String imageUrl,  String content, @JsonKey(fromJson: _priceFromJson)  double price, @JsonKey(name: 'original_price', fromJson: _priceFromJson)  double? originalPrice, @JsonKey(name: 'cost_price', fromJson: _priceFromJson)  double? costPrice, @JsonKey(name: 'net_profit', fromJson: _priceFromJson)  double? netProfit, @JsonKey(name: 'shelf_life')  int? shelfLife,  int sales, @JsonKey(name: 'heating_time')  int? heatingTime,  String type, @JsonKey(name: 'sauce_id')  int? sauceId,  int? weigh, @JsonKey(name: 'daily_limit')  int? dailyLimit,  String? spec, @JsonKey(name: 'supply_chain')  String? supplyChain, @JsonKey(name: 'is_enabled')  bool isEnabled, @JsonKey(name: 'time_discount')  String? timeDiscount,  ProductDetailCategory? category,  List<ProductDetailComment> comments,  List<ProductDetailMedia> media, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProductDetailModel():
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.content,_that.price,_that.originalPrice,_that.costPrice,_that.netProfit,_that.shelfLife,_that.sales,_that.heatingTime,_that.type,_that.sauceId,_that.weigh,_that.dailyLimit,_that.spec,_that.supplyChain,_that.isEnabled,_that.timeDiscount,_that.category,_that.comments,_that.media,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description, @JsonKey(name: 'thumb')  String imageUrl,  String content, @JsonKey(fromJson: _priceFromJson)  double price, @JsonKey(name: 'original_price', fromJson: _priceFromJson)  double? originalPrice, @JsonKey(name: 'cost_price', fromJson: _priceFromJson)  double? costPrice, @JsonKey(name: 'net_profit', fromJson: _priceFromJson)  double? netProfit, @JsonKey(name: 'shelf_life')  int? shelfLife,  int sales, @JsonKey(name: 'heating_time')  int? heatingTime,  String type, @JsonKey(name: 'sauce_id')  int? sauceId,  int? weigh, @JsonKey(name: 'daily_limit')  int? dailyLimit,  String? spec, @JsonKey(name: 'supply_chain')  String? supplyChain, @JsonKey(name: 'is_enabled')  bool isEnabled, @JsonKey(name: 'time_discount')  String? timeDiscount,  ProductDetailCategory? category,  List<ProductDetailComment> comments,  List<ProductDetailMedia> media, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.content,_that.price,_that.originalPrice,_that.costPrice,_that.netProfit,_that.shelfLife,_that.sales,_that.heatingTime,_that.type,_that.sauceId,_that.weigh,_that.dailyLimit,_that.spec,_that.supplyChain,_that.isEnabled,_that.timeDiscount,_that.category,_that.comments,_that.media,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductDetailModel extends ProductDetailModel {
  const _ProductDetailModel({required this.id, this.name = '', this.description = '', @JsonKey(name: 'thumb') this.imageUrl = '', this.content = '', @JsonKey(fromJson: _priceFromJson) this.price = 0.0, @JsonKey(name: 'original_price', fromJson: _priceFromJson) this.originalPrice = 0.0, @JsonKey(name: 'cost_price', fromJson: _priceFromJson) this.costPrice = 0.0, @JsonKey(name: 'net_profit', fromJson: _priceFromJson) this.netProfit = 0.0, @JsonKey(name: 'shelf_life') this.shelfLife = 0, this.sales = 0, @JsonKey(name: 'heating_time') this.heatingTime = 0, this.type = 'food', @JsonKey(name: 'sauce_id') this.sauceId = 0, this.weigh = 0, @JsonKey(name: 'daily_limit') this.dailyLimit = 0, this.spec = '', @JsonKey(name: 'supply_chain') this.supplyChain = '', @JsonKey(name: 'is_enabled') this.isEnabled = true, @JsonKey(name: 'time_discount') this.timeDiscount = '', this.category, final  List<ProductDetailComment> comments = const [], final  List<ProductDetailMedia> media = const [], @JsonKey(name: 'created_at') this.createdAt = '', @JsonKey(name: 'updated_at') this.updatedAt = ''}): _comments = comments,_media = media,super._();
  factory _ProductDetailModel.fromJson(Map<String, dynamic> json) => _$ProductDetailModelFromJson(json);

/// 商品ID
@override final  int id;
/// 商品名称
@override@JsonKey() final  String name;
/// 商品简述
@override@JsonKey() final  String description;
/// 商品主图
@override@JsonKey(name: 'thumb') final  String imageUrl;
/// 商品详情 HTML 内容
@override@JsonKey() final  String content;
/// 商品价格
@override@JsonKey(fromJson: _priceFromJson) final  double price;
/// 商品原价
@override@JsonKey(name: 'original_price', fromJson: _priceFromJson) final  double? originalPrice;
/// 成本价
@override@JsonKey(name: 'cost_price', fromJson: _priceFromJson) final  double? costPrice;
/// 净利润
@override@JsonKey(name: 'net_profit', fromJson: _priceFromJson) final  double? netProfit;
/// 保质期 (天)
@override@JsonKey(name: 'shelf_life') final  int? shelfLife;
/// 销量
@override@JsonKey() final  int sales;
/// 加热时间 (秒)
@override@JsonKey(name: 'heating_time') final  int? heatingTime;
/// 商品类型
@override@JsonKey() final  String type;
/// 酱料ID
@override@JsonKey(name: 'sauce_id') final  int? sauceId;
/// 重量
@override@JsonKey() final  int? weigh;
/// 每日限购
@override@JsonKey(name: 'daily_limit') final  int? dailyLimit;
/// 规格
@override@JsonKey() final  String? spec;
/// 供应链
@override@JsonKey(name: 'supply_chain') final  String? supplyChain;
/// 是否上架
@override@JsonKey(name: 'is_enabled') final  bool isEnabled;
/// 限时折扣
@override@JsonKey(name: 'time_discount') final  String? timeDiscount;
/// 分类信息
@override final  ProductDetailCategory? category;
/// 评价列表
 final  List<ProductDetailComment> _comments;
/// 评价列表
@override@JsonKey() List<ProductDetailComment> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}

/// 媒体资源
 final  List<ProductDetailMedia> _media;
/// 媒体资源
@override@JsonKey() List<ProductDetailMedia> get media {
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_media);
}

/// 创建时间
@override@JsonKey(name: 'created_at') final  String? createdAt;
/// 更新时间
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of ProductDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailModelCopyWith<_ProductDetailModel> get copyWith => __$ProductDetailModelCopyWithImpl<_ProductDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.content, content) || other.content == content)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit)&&(identical(other.shelfLife, shelfLife) || other.shelfLife == shelfLife)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.heatingTime, heatingTime) || other.heatingTime == heatingTime)&&(identical(other.type, type) || other.type == type)&&(identical(other.sauceId, sauceId) || other.sauceId == sauceId)&&(identical(other.weigh, weigh) || other.weigh == weigh)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.spec, spec) || other.spec == spec)&&(identical(other.supplyChain, supplyChain) || other.supplyChain == supplyChain)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.timeDiscount, timeDiscount) || other.timeDiscount == timeDiscount)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._comments, _comments)&&const DeepCollectionEquality().equals(other._media, _media)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,description,imageUrl,content,price,originalPrice,costPrice,netProfit,shelfLife,sales,heatingTime,type,sauceId,weigh,dailyLimit,spec,supplyChain,isEnabled,timeDiscount,category,const DeepCollectionEquality().hash(_comments),const DeepCollectionEquality().hash(_media),createdAt,updatedAt]);

@override
String toString() {
  return 'ProductDetailModel(id: $id, name: $name, description: $description, imageUrl: $imageUrl, content: $content, price: $price, originalPrice: $originalPrice, costPrice: $costPrice, netProfit: $netProfit, shelfLife: $shelfLife, sales: $sales, heatingTime: $heatingTime, type: $type, sauceId: $sauceId, weigh: $weigh, dailyLimit: $dailyLimit, spec: $spec, supplyChain: $supplyChain, isEnabled: $isEnabled, timeDiscount: $timeDiscount, category: $category, comments: $comments, media: $media, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailModelCopyWith<$Res> implements $ProductDetailModelCopyWith<$Res> {
  factory _$ProductDetailModelCopyWith(_ProductDetailModel value, $Res Function(_ProductDetailModel) _then) = __$ProductDetailModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description,@JsonKey(name: 'thumb') String imageUrl, String content,@JsonKey(fromJson: _priceFromJson) double price,@JsonKey(name: 'original_price', fromJson: _priceFromJson) double? originalPrice,@JsonKey(name: 'cost_price', fromJson: _priceFromJson) double? costPrice,@JsonKey(name: 'net_profit', fromJson: _priceFromJson) double? netProfit,@JsonKey(name: 'shelf_life') int? shelfLife, int sales,@JsonKey(name: 'heating_time') int? heatingTime, String type,@JsonKey(name: 'sauce_id') int? sauceId, int? weigh,@JsonKey(name: 'daily_limit') int? dailyLimit, String? spec,@JsonKey(name: 'supply_chain') String? supplyChain,@JsonKey(name: 'is_enabled') bool isEnabled,@JsonKey(name: 'time_discount') String? timeDiscount, ProductDetailCategory? category, List<ProductDetailComment> comments, List<ProductDetailMedia> media,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});


@override $ProductDetailCategoryCopyWith<$Res>? get category;

}
/// @nodoc
class __$ProductDetailModelCopyWithImpl<$Res>
    implements _$ProductDetailModelCopyWith<$Res> {
  __$ProductDetailModelCopyWithImpl(this._self, this._then);

  final _ProductDetailModel _self;
  final $Res Function(_ProductDetailModel) _then;

/// Create a copy of ProductDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? imageUrl = null,Object? content = null,Object? price = null,Object? originalPrice = freezed,Object? costPrice = freezed,Object? netProfit = freezed,Object? shelfLife = freezed,Object? sales = null,Object? heatingTime = freezed,Object? type = null,Object? sauceId = freezed,Object? weigh = freezed,Object? dailyLimit = freezed,Object? spec = freezed,Object? supplyChain = freezed,Object? isEnabled = null,Object? timeDiscount = freezed,Object? category = freezed,Object? comments = null,Object? media = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ProductDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,netProfit: freezed == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double?,shelfLife: freezed == shelfLife ? _self.shelfLife : shelfLife // ignore: cast_nullable_to_non_nullable
as int?,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as int,heatingTime: freezed == heatingTime ? _self.heatingTime : heatingTime // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,sauceId: freezed == sauceId ? _self.sauceId : sauceId // ignore: cast_nullable_to_non_nullable
as int?,weigh: freezed == weigh ? _self.weigh : weigh // ignore: cast_nullable_to_non_nullable
as int?,dailyLimit: freezed == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as int?,spec: freezed == spec ? _self.spec : spec // ignore: cast_nullable_to_non_nullable
as String?,supplyChain: freezed == supplyChain ? _self.supplyChain : supplyChain // ignore: cast_nullable_to_non_nullable
as String?,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,timeDiscount: freezed == timeDiscount ? _self.timeDiscount : timeDiscount // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ProductDetailCategory?,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<ProductDetailComment>,media: null == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<ProductDetailMedia>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProductDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductDetailCategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $ProductDetailCategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
mixin _$ProductDetailCategory {

 int get id; String get name;
/// Create a copy of ProductDetailCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailCategoryCopyWith<ProductDetailCategory> get copyWith => _$ProductDetailCategoryCopyWithImpl<ProductDetailCategory>(this as ProductDetailCategory, _$identity);

  /// Serializes this ProductDetailCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'ProductDetailCategory(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $ProductDetailCategoryCopyWith<$Res>  {
  factory $ProductDetailCategoryCopyWith(ProductDetailCategory value, $Res Function(ProductDetailCategory) _then) = _$ProductDetailCategoryCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$ProductDetailCategoryCopyWithImpl<$Res>
    implements $ProductDetailCategoryCopyWith<$Res> {
  _$ProductDetailCategoryCopyWithImpl(this._self, this._then);

  final ProductDetailCategory _self;
  final $Res Function(ProductDetailCategory) _then;

/// Create a copy of ProductDetailCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDetailCategory].
extension ProductDetailCategoryPatterns on ProductDetailCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetailCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetailCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetailCategory value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetailCategory():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetailCategory value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetailCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetailCategory() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _ProductDetailCategory():
return $default(_that.id,_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetailCategory() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductDetailCategory implements ProductDetailCategory {
  const _ProductDetailCategory({required this.id, this.name = ''});
  factory _ProductDetailCategory.fromJson(Map<String, dynamic> json) => _$ProductDetailCategoryFromJson(json);

@override final  int id;
@override@JsonKey() final  String name;

/// Create a copy of ProductDetailCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailCategoryCopyWith<_ProductDetailCategory> get copyWith => __$ProductDetailCategoryCopyWithImpl<_ProductDetailCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDetailCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'ProductDetailCategory(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailCategoryCopyWith<$Res> implements $ProductDetailCategoryCopyWith<$Res> {
  factory _$ProductDetailCategoryCopyWith(_ProductDetailCategory value, $Res Function(_ProductDetailCategory) _then) = __$ProductDetailCategoryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$ProductDetailCategoryCopyWithImpl<$Res>
    implements _$ProductDetailCategoryCopyWith<$Res> {
  __$ProductDetailCategoryCopyWithImpl(this._self, this._then);

  final _ProductDetailCategory _self;
  final $Res Function(_ProductDetailCategory) _then;

/// Create a copy of ProductDetailCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_ProductDetailCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProductDetailComment {

 int get id; String get content; int get rating;@JsonKey(name: 'rating_stars') String get ratingStars; String get status;@JsonKey(name: 'likes_count') int get likesCount;@JsonKey(name: 'is_liked') bool get isLiked; ProductDetailUser get user;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;@JsonKey(name: 'created_at_human') String get createdAtHuman;
/// Create a copy of ProductDetailComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailCommentCopyWith<ProductDetailComment> get copyWith => _$ProductDetailCommentCopyWithImpl<ProductDetailComment>(this as ProductDetailComment, _$identity);

  /// Serializes this ProductDetailComment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailComment&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingStars, ratingStars) || other.ratingStars == ratingStars)&&(identical(other.status, status) || other.status == status)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAtHuman, createdAtHuman) || other.createdAtHuman == createdAtHuman));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,rating,ratingStars,status,likesCount,isLiked,user,createdAt,updatedAt,createdAtHuman);

@override
String toString() {
  return 'ProductDetailComment(id: $id, content: $content, rating: $rating, ratingStars: $ratingStars, status: $status, likesCount: $likesCount, isLiked: $isLiked, user: $user, createdAt: $createdAt, updatedAt: $updatedAt, createdAtHuman: $createdAtHuman)';
}


}

/// @nodoc
abstract mixin class $ProductDetailCommentCopyWith<$Res>  {
  factory $ProductDetailCommentCopyWith(ProductDetailComment value, $Res Function(ProductDetailComment) _then) = _$ProductDetailCommentCopyWithImpl;
@useResult
$Res call({
 int id, String content, int rating,@JsonKey(name: 'rating_stars') String ratingStars, String status,@JsonKey(name: 'likes_count') int likesCount,@JsonKey(name: 'is_liked') bool isLiked, ProductDetailUser user,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'created_at_human') String createdAtHuman
});


$ProductDetailUserCopyWith<$Res> get user;

}
/// @nodoc
class _$ProductDetailCommentCopyWithImpl<$Res>
    implements $ProductDetailCommentCopyWith<$Res> {
  _$ProductDetailCommentCopyWithImpl(this._self, this._then);

  final ProductDetailComment _self;
  final $Res Function(ProductDetailComment) _then;

/// Create a copy of ProductDetailComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,Object? rating = null,Object? ratingStars = null,Object? status = null,Object? likesCount = null,Object? isLiked = null,Object? user = null,Object? createdAt = null,Object? updatedAt = null,Object? createdAtHuman = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,ratingStars: null == ratingStars ? _self.ratingStars : ratingStars // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProductDetailUser,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,createdAtHuman: null == createdAtHuman ? _self.createdAtHuman : createdAtHuman // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ProductDetailComment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductDetailUserCopyWith<$Res> get user {
  
  return $ProductDetailUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductDetailComment].
extension ProductDetailCommentPatterns on ProductDetailComment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetailComment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetailComment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetailComment value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetailComment():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetailComment value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetailComment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String content,  int rating, @JsonKey(name: 'rating_stars')  String ratingStars,  String status, @JsonKey(name: 'likes_count')  int likesCount, @JsonKey(name: 'is_liked')  bool isLiked,  ProductDetailUser user, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'created_at_human')  String createdAtHuman)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetailComment() when $default != null:
return $default(_that.id,_that.content,_that.rating,_that.ratingStars,_that.status,_that.likesCount,_that.isLiked,_that.user,_that.createdAt,_that.updatedAt,_that.createdAtHuman);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String content,  int rating, @JsonKey(name: 'rating_stars')  String ratingStars,  String status, @JsonKey(name: 'likes_count')  int likesCount, @JsonKey(name: 'is_liked')  bool isLiked,  ProductDetailUser user, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'created_at_human')  String createdAtHuman)  $default,) {final _that = this;
switch (_that) {
case _ProductDetailComment():
return $default(_that.id,_that.content,_that.rating,_that.ratingStars,_that.status,_that.likesCount,_that.isLiked,_that.user,_that.createdAt,_that.updatedAt,_that.createdAtHuman);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String content,  int rating, @JsonKey(name: 'rating_stars')  String ratingStars,  String status, @JsonKey(name: 'likes_count')  int likesCount, @JsonKey(name: 'is_liked')  bool isLiked,  ProductDetailUser user, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'created_at_human')  String createdAtHuman)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetailComment() when $default != null:
return $default(_that.id,_that.content,_that.rating,_that.ratingStars,_that.status,_that.likesCount,_that.isLiked,_that.user,_that.createdAt,_that.updatedAt,_that.createdAtHuman);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductDetailComment implements ProductDetailComment {
  const _ProductDetailComment({required this.id, this.content = '', this.rating = 5, @JsonKey(name: 'rating_stars') this.ratingStars = '', this.status = '', @JsonKey(name: 'likes_count') this.likesCount = 0, @JsonKey(name: 'is_liked') this.isLiked = false, this.user = const ProductDetailUser(id: 0), @JsonKey(name: 'created_at') this.createdAt = '', @JsonKey(name: 'updated_at') this.updatedAt = '', @JsonKey(name: 'created_at_human') this.createdAtHuman = ''});
  factory _ProductDetailComment.fromJson(Map<String, dynamic> json) => _$ProductDetailCommentFromJson(json);

@override final  int id;
@override@JsonKey() final  String content;
@override@JsonKey() final  int rating;
@override@JsonKey(name: 'rating_stars') final  String ratingStars;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'likes_count') final  int likesCount;
@override@JsonKey(name: 'is_liked') final  bool isLiked;
@override@JsonKey() final  ProductDetailUser user;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey(name: 'created_at_human') final  String createdAtHuman;

/// Create a copy of ProductDetailComment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailCommentCopyWith<_ProductDetailComment> get copyWith => __$ProductDetailCommentCopyWithImpl<_ProductDetailComment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDetailCommentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailComment&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingStars, ratingStars) || other.ratingStars == ratingStars)&&(identical(other.status, status) || other.status == status)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAtHuman, createdAtHuman) || other.createdAtHuman == createdAtHuman));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,rating,ratingStars,status,likesCount,isLiked,user,createdAt,updatedAt,createdAtHuman);

@override
String toString() {
  return 'ProductDetailComment(id: $id, content: $content, rating: $rating, ratingStars: $ratingStars, status: $status, likesCount: $likesCount, isLiked: $isLiked, user: $user, createdAt: $createdAt, updatedAt: $updatedAt, createdAtHuman: $createdAtHuman)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailCommentCopyWith<$Res> implements $ProductDetailCommentCopyWith<$Res> {
  factory _$ProductDetailCommentCopyWith(_ProductDetailComment value, $Res Function(_ProductDetailComment) _then) = __$ProductDetailCommentCopyWithImpl;
@override @useResult
$Res call({
 int id, String content, int rating,@JsonKey(name: 'rating_stars') String ratingStars, String status,@JsonKey(name: 'likes_count') int likesCount,@JsonKey(name: 'is_liked') bool isLiked, ProductDetailUser user,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'created_at_human') String createdAtHuman
});


@override $ProductDetailUserCopyWith<$Res> get user;

}
/// @nodoc
class __$ProductDetailCommentCopyWithImpl<$Res>
    implements _$ProductDetailCommentCopyWith<$Res> {
  __$ProductDetailCommentCopyWithImpl(this._self, this._then);

  final _ProductDetailComment _self;
  final $Res Function(_ProductDetailComment) _then;

/// Create a copy of ProductDetailComment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,Object? rating = null,Object? ratingStars = null,Object? status = null,Object? likesCount = null,Object? isLiked = null,Object? user = null,Object? createdAt = null,Object? updatedAt = null,Object? createdAtHuman = null,}) {
  return _then(_ProductDetailComment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,ratingStars: null == ratingStars ? _self.ratingStars : ratingStars // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProductDetailUser,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,createdAtHuman: null == createdAtHuman ? _self.createdAtHuman : createdAtHuman // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ProductDetailComment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductDetailUserCopyWith<$Res> get user {
  
  return $ProductDetailUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$ProductDetailUser {

 int get id; String get name; String get avatar;
/// Create a copy of ProductDetailUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailUserCopyWith<ProductDetailUser> get copyWith => _$ProductDetailUserCopyWithImpl<ProductDetailUser>(this as ProductDetailUser, _$identity);

  /// Serializes this ProductDetailUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatar);

@override
String toString() {
  return 'ProductDetailUser(id: $id, name: $name, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class $ProductDetailUserCopyWith<$Res>  {
  factory $ProductDetailUserCopyWith(ProductDetailUser value, $Res Function(ProductDetailUser) _then) = _$ProductDetailUserCopyWithImpl;
@useResult
$Res call({
 int id, String name, String avatar
});




}
/// @nodoc
class _$ProductDetailUserCopyWithImpl<$Res>
    implements $ProductDetailUserCopyWith<$Res> {
  _$ProductDetailUserCopyWithImpl(this._self, this._then);

  final ProductDetailUser _self;
  final $Res Function(ProductDetailUser) _then;

/// Create a copy of ProductDetailUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatar = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDetailUser].
extension ProductDetailUserPatterns on ProductDetailUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetailUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetailUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetailUser value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetailUser():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetailUser value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetailUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String avatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetailUser() when $default != null:
return $default(_that.id,_that.name,_that.avatar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String avatar)  $default,) {final _that = this;
switch (_that) {
case _ProductDetailUser():
return $default(_that.id,_that.name,_that.avatar);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String avatar)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetailUser() when $default != null:
return $default(_that.id,_that.name,_that.avatar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductDetailUser implements ProductDetailUser {
  const _ProductDetailUser({required this.id, this.name = '', this.avatar = ''});
  factory _ProductDetailUser.fromJson(Map<String, dynamic> json) => _$ProductDetailUserFromJson(json);

@override final  int id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String avatar;

/// Create a copy of ProductDetailUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailUserCopyWith<_ProductDetailUser> get copyWith => __$ProductDetailUserCopyWithImpl<_ProductDetailUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDetailUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatar);

@override
String toString() {
  return 'ProductDetailUser(id: $id, name: $name, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailUserCopyWith<$Res> implements $ProductDetailUserCopyWith<$Res> {
  factory _$ProductDetailUserCopyWith(_ProductDetailUser value, $Res Function(_ProductDetailUser) _then) = __$ProductDetailUserCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String avatar
});




}
/// @nodoc
class __$ProductDetailUserCopyWithImpl<$Res>
    implements _$ProductDetailUserCopyWith<$Res> {
  __$ProductDetailUserCopyWithImpl(this._self, this._then);

  final _ProductDetailUser _self;
  final $Res Function(_ProductDetailUser) _then;

/// Create a copy of ProductDetailUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatar = null,}) {
  return _then(_ProductDetailUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProductDetailMedia {

 int get id; String get url;
/// Create a copy of ProductDetailMedia
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailMediaCopyWith<ProductDetailMedia> get copyWith => _$ProductDetailMediaCopyWithImpl<ProductDetailMedia>(this as ProductDetailMedia, _$identity);

  /// Serializes this ProductDetailMedia to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailMedia&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url);

@override
String toString() {
  return 'ProductDetailMedia(id: $id, url: $url)';
}


}

/// @nodoc
abstract mixin class $ProductDetailMediaCopyWith<$Res>  {
  factory $ProductDetailMediaCopyWith(ProductDetailMedia value, $Res Function(ProductDetailMedia) _then) = _$ProductDetailMediaCopyWithImpl;
@useResult
$Res call({
 int id, String url
});




}
/// @nodoc
class _$ProductDetailMediaCopyWithImpl<$Res>
    implements $ProductDetailMediaCopyWith<$Res> {
  _$ProductDetailMediaCopyWithImpl(this._self, this._then);

  final ProductDetailMedia _self;
  final $Res Function(ProductDetailMedia) _then;

/// Create a copy of ProductDetailMedia
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDetailMedia].
extension ProductDetailMediaPatterns on ProductDetailMedia {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetailMedia value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetailMedia() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetailMedia value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetailMedia():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetailMedia value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetailMedia() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetailMedia() when $default != null:
return $default(_that.id,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String url)  $default,) {final _that = this;
switch (_that) {
case _ProductDetailMedia():
return $default(_that.id,_that.url);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String url)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetailMedia() when $default != null:
return $default(_that.id,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductDetailMedia implements ProductDetailMedia {
  const _ProductDetailMedia({required this.id, this.url = ''});
  factory _ProductDetailMedia.fromJson(Map<String, dynamic> json) => _$ProductDetailMediaFromJson(json);

@override final  int id;
@override@JsonKey() final  String url;

/// Create a copy of ProductDetailMedia
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailMediaCopyWith<_ProductDetailMedia> get copyWith => __$ProductDetailMediaCopyWithImpl<_ProductDetailMedia>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDetailMediaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailMedia&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url);

@override
String toString() {
  return 'ProductDetailMedia(id: $id, url: $url)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailMediaCopyWith<$Res> implements $ProductDetailMediaCopyWith<$Res> {
  factory _$ProductDetailMediaCopyWith(_ProductDetailMedia value, $Res Function(_ProductDetailMedia) _then) = __$ProductDetailMediaCopyWithImpl;
@override @useResult
$Res call({
 int id, String url
});




}
/// @nodoc
class __$ProductDetailMediaCopyWithImpl<$Res>
    implements _$ProductDetailMediaCopyWith<$Res> {
  __$ProductDetailMediaCopyWithImpl(this._self, this._then);

  final _ProductDetailMedia _self;
  final $Res Function(_ProductDetailMedia) _then;

/// Create a copy of ProductDetailMedia
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,}) {
  return _then(_ProductDetailMedia(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
