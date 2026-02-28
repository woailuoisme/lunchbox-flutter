import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/product/entities/category_product_model.dart';

part 'product_detail_model.freezed.dart';
part 'product_detail_model.g.dart';

@freezed
abstract class ProductDetailModel with _$ProductDetailModel {
  const factory ProductDetailModel({
    /// 商品ID
    required int id,

    /// 商品名称
    required String name,

    /// 商品简述
    required String description,

    /// 商品主图
    @JsonKey(name: 'thumb') required String imageUrl,

    /// 商品详情 HTML 内容
    required String content,

    /// 商品价格
    @JsonKey(fromJson: _priceFromJson) required double price,

    /// 商品原价
    @JsonKey(name: 'original_price', fromJson: _priceFromJson)
    double? originalPrice,

    /// 成本价
    @JsonKey(name: 'cost_price', fromJson: _priceFromJson) double? costPrice,

    /// 净利润
    @JsonKey(name: 'net_profit', fromJson: _priceFromJson) double? netProfit,

    /// 保质期 (天)
    @JsonKey(name: 'shelf_life') int? shelfLife,

    /// 销量
    @Default(0) int sales,

    /// 加热时间 (秒)
    @JsonKey(name: 'heating_time') int? heatingTime,

    /// 商品类型
    required String type,

    /// 酱料ID
    @JsonKey(name: 'sauce_id') int? sauceId,

    /// 重量
    int? weigh,

    /// 每日限购
    @JsonKey(name: 'daily_limit') int? dailyLimit,

    /// 规格
    String? spec,

    /// 供应链
    @JsonKey(name: 'supply_chain') String? supplyChain,

    /// 是否上架
    @JsonKey(name: 'is_enabled') @Default(true) bool isEnabled,

    /// 限时折扣
    @JsonKey(name: 'time_discount') String? timeDiscount,

    /// 分类信息
    ProductDetailCategory? category,

    /// 评价列表
    @Default([]) List<ProductDetailComment> comments,

    /// 媒体资源
    @Default([]) List<ProductDetailMedia> media,

    /// 创建时间
    @JsonKey(name: 'created_at') String? createdAt,

    /// 更新时间
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _ProductDetailModel;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);

  const ProductDetailModel._();

  /// 转换为基础产品模型
  ProductModel toProductModel() {
    return ProductModel(
      id: id,
      name: name,
      description: description,
      price: price,
      originalPrice: originalPrice,
      costPrice: costPrice,
      netProfit: netProfit,
      sales: sales,
      type: type,
      dailyLimit: dailyLimit,
      imageUrl: imageUrl,
      createdAt: createdAt,
      // inventory 和 tags 字段在 ProductDetailModel 中不直接存在，可能需要从其他字段推导或设为默认值
    );
  }
}

@freezed
abstract class ProductDetailCategory with _$ProductDetailCategory {
  const factory ProductDetailCategory({required int id, required String name}) =
      _ProductDetailCategory;

  factory ProductDetailCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailCategoryFromJson(json);
}

@freezed
abstract class ProductDetailComment with _$ProductDetailComment {
  const factory ProductDetailComment({
    required int id,
    required String content,
    required int rating,
    @JsonKey(name: 'rating_stars') required String ratingStars,
    required String status,
    @JsonKey(name: 'likes_count') @Default(0) int likesCount,
    @JsonKey(name: 'is_liked') @Default(false) bool isLiked,
    required ProductDetailUser user,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'created_at_human') required String createdAtHuman,
  }) = _ProductDetailComment;

  factory ProductDetailComment.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailCommentFromJson(json);
}

@freezed
abstract class ProductDetailUser with _$ProductDetailUser {
  const factory ProductDetailUser({
    required int id,
    required String name,
    required String avatar,
  }) = _ProductDetailUser;

  factory ProductDetailUser.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailUserFromJson(json);
}

@freezed
abstract class ProductDetailMedia with _$ProductDetailMedia {
  const factory ProductDetailMedia({required int id, required String url}) =
      _ProductDetailMedia;

  factory ProductDetailMedia.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailMediaFromJson(json);
}

/// 将各种类型的价格输入转换为 double
double _priceFromJson(dynamic value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}
