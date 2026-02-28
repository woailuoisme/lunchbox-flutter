import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_product_model.freezed.dart';
part 'category_product_model.g.dart';

/// 产品分类模型
/// 包含分类信息及其下的产品列表
@freezed
abstract class CategoryProductModel with _$CategoryProductModel {
  const factory CategoryProductModel({
    /// 分类ID
    required int id,

    /// 分类名称
    required String name,

    /// 分类图标/缩略图
    required String thumb,

    /// 排序权重
    required int order,

    /// 分类下的产品列表
    @Default([]) List<ProductModel> products,
  }) = _CategoryProductModel;

  factory CategoryProductModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductModelFromJson(json);
}

/// 产品模型类
/// 表示自动售货机中的商品信息
@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    /// 产品ID
    required int id,

    /// 产品名称
    required String name,

    /// 产品描述
    required String description,

    /// 产品价格
    @JsonKey(fromJson: _priceFromJson) required double price,

    /// 产品原价（用于促销显示）
    @JsonKey(name: 'original_price', fromJson: _priceFromJson)
    double? originalPrice,

    /// 产品成本价
    @JsonKey(name: 'cost_price', fromJson: _priceFromJson) double? costPrice,

    /// 净利润
    @JsonKey(name: 'net_profit', fromJson: _priceFromJson) double? netProfit,

    /// 销量
    @Default(0) int sales,

    /// 产品类型/类别
    required String type,

    /// 每日限购数量
    @JsonKey(name: 'daily_limit') int? dailyLimit,

    /// 产品图片URL/缩略图
    @JsonKey(name: 'thumb') required String imageUrl,

    /// 库存信息
    ProductInventory? inventory,

    /// 创建时间
    @JsonKey(name: 'created_at') String? createdAt,

    /// 是否为热门
    @Default(false) bool isHot,

    /// 是否为促销商品
    @Default(false) bool isPromotion,
  }) = _ProductModel;
  const ProductModel._();

  /// 从JSON映射创建ProductModel实例
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  /// 判断产品是否有库存
  bool get hasStock => (inventory?.productCount ?? 0) > 0;

  /// 获取库存数量
  int get stock => inventory?.productCount ?? 0;

  /// 判断产品是否有折扣
  bool get hasDiscount => originalPrice != null && originalPrice! > price;

  /// 计算折扣百分比
  int get discountPercentage {
    if (!hasDiscount) {
      return 0;
    }
    return ((1 - price / originalPrice!) * 100).round();
  }
}

@freezed
abstract class ProductInventory with _$ProductInventory {
  const factory ProductInventory({
    /// 设备编号
    required String no,

    /// 产品库存数量
    @JsonKey(name: 'product_count') required int productCount,
  }) = _ProductInventory;

  factory ProductInventory.fromJson(Map<String, dynamic> json) =>
      _$ProductInventoryFromJson(json);
}

/// 将各种类型的价格输入转换为 double
double _priceFromJson(dynamic value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}
