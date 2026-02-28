import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/cart/entities/cart_product_model.dart';

part 'order_product_model.freezed.dart';
part 'order_product_model.g.dart';

/// 订单专用的商品模型
/// 用于解耦订单与商品详情 feature
@freezed
abstract class OrderProductModel with _$OrderProductModel {
  const factory OrderProductModel({
    /// 产品ID
    required int id,

    /// 产品名称
    required String name,

    /// 产品分类
    required String category,

    /// 产品缩略图
    required String thumb,

    /// 产品描述
    required String description,

    /// 销售价格 (API 返回的是 String)
    @JsonKey(name: 'sale_price') required String salePrice,

    /// 购买数量
    required int quantity,
  }) = _OrderProductModel;

  const OrderProductModel._();

  /// 从JSON映射创建OrderProductModel实例
  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$OrderProductModelFromJson(json);

  /// 转换为购物车商品模型
  CartProductModel toCartProductModel() {
    return CartProductModel(
      id: id,
      name: name,
      description: description,
      price: double.tryParse(salePrice) ?? 0.0,
      imageUrl: thumb,
      type: category,
      stock: 99, // 重新下单时，库存信息通常需要重新获取，这里先填个默认值
    );
  }
}
