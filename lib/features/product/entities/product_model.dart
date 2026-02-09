import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

/// 产品模型类
/// 表示自动售货机中的商品信息
@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    /// 产品ID
    required String id,

    /// 产品名称
    required String name,

    /// 产品描述
    required String description,

    /// 产品价格
    required double price,

    /// 产品图片URL
    required String imageUrl,

    /// 产品更新时间
    required DateTime updateTime,

    /// 产品原价（用于促销显示）
    double? originalPrice,

    /// 产品库存
    @Default(0) int stock,

    /// 产品类别
    @Default('food') String category,

    /// 产品是否在售
    @Default(true) bool isAvailable,

    /// 产品是否为热门
    @Default(false) bool isHot,

    /// 产品是否为促销商品
    @Default(false) bool isPromotion,

    /// 月售数量
    @Default(0) int monthlySales,

    /// 产品规格信息
    String? specifications,
  }) = _ProductModel;
  const ProductModel._();

  /// 从JSON映射创建ProductModel实例
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  /// 判断产品是否有库存
  bool get hasStock => stock > 0;

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
