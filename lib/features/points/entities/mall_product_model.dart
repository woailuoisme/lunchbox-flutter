import 'package:freezed_annotation/freezed_annotation.dart';

part 'mall_product_model.freezed.dart';
part 'mall_product_model.g.dart';

/// 积分商城商品模型
@freezed
abstract class MallProductModel with _$MallProductModel {
  const factory MallProductModel({
    /// 商品ID
    required String id,

    /// 商品标题
    required String title,

    /// 价值金额
    @JsonKey(name: 'amount_value') required int amountValue,

    /// 兑换所需积分
    @JsonKey(name: 'points_cost') required int pointsCost,

    /// 商品类型
    required String type,

    /// 是否热门
    @JsonKey(name: 'is_hot') @Default(false) bool isHot,

    /// 商品图片
    @Default('') String image,
  }) = _MallProductModel;

  factory MallProductModel.fromJson(Map<String, dynamic> json) =>
      _$MallProductModelFromJson(json);
}
