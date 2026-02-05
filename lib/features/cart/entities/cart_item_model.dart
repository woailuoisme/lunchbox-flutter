import 'package:freezed_annotation/freezed_annotation.dart';
import '../../product/entities/product_model.dart';

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

/// 购物车项模型类
/// 表示购物车中的单个商品项
@freezed
abstract class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    /// 购物车项ID
    required String id,

    /// 产品ID
    required String productId,

    /// 产品信息
    required ProductModel product,

    /// 添加时间
    required DateTime addedTime,

    /// 购买数量
    @Default(1) int quantity,

    /// 是否选中
    @Default(true) bool isSelected,

    /// 设备ID（从哪个设备添加）
    String? deviceId,
  }) = _CartItemModel;
  const CartItemModel._();

  /// 从JSON映射创建CartItemModel实例
  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  /// 小计金额
  double get subtotal => product.price * quantity;

  /// 总价（考虑选中状态）
  double get totalPrice => isSelected ? subtotal : 0.0;
}
