import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/product/entities/category_product_model.dart';

part 'cart_product_model.freezed.dart';
part 'cart_product_model.g.dart';

/// 购物车专用的商品模型
/// 用于解耦购物车与商品详情 feature
@freezed
abstract class CartProductModel with _$CartProductModel {
  const factory CartProductModel({
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

    /// 产品图片URL/缩略图
    @JsonKey(name: 'thumb') required String imageUrl,

    /// 库存数量
    @Default(0) int stock,

    /// 产品类型/类别
    required String type,
  }) = _CartProductModel;

  const CartProductModel._();

  /// 从JSON映射创建CartProductModel实例
  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);

  /// 从基础商品模型转换
  factory CartProductModel.fromProductModel(ProductModel product) {
    return CartProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      originalPrice: product.originalPrice,
      imageUrl: product.imageUrl,
      stock: product.stock,
      type: product.type,
    );
  }

  /// 判断产品是否有库存
  bool get hasStock => stock > 0;

  /// 判断产品是否有折扣
  bool get hasDiscount => originalPrice != null && originalPrice! > price;
}

/// 处理价格字段的转换逻辑
double _priceFromJson(dynamic value) {
  if (value == null) return 0.0;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) {
    return double.tryParse(value) ?? 0.0;
  }
  return 0.0;
}
