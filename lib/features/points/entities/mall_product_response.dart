import 'package:freezed_annotation/freezed_annotation.dart';

part 'mall_product_response.freezed.dart';
part 'mall_product_response.g.dart';

/// 积分商城商品模型
@freezed
sealed class MallProductResponse with _$MallProductResponse {
  const factory MallProductResponse({
    /// 商品ID
    required int id,

    /// 商品标题
    @Default('') String name,

    /// 兑换所需积分
    @JsonKey(name: 'required_points') @Default(0) int requiredPoints,

    /// 库存
    int? stock,

    /// 是否激活
    @JsonKey(name: 'is_active') @Default(false) bool isActive,

    /// 商品类型
    @Default('') String type,

    /// 类型标签
    @JsonKey(name: 'type_label') @Default('') String typeLabel,

    /// 内容描述
    @Default('') String content,

    /// 规则
    @Default({}) Map<String, dynamic> rules,

    /// 是否可用
    @JsonKey(name: 'is_available') @Default(false) bool isAvailable,

    /// 创建时间
    @JsonKey(name: 'created_at') @Default('') String createdAt,
  }) = _MallProductResponse;

  factory MallProductResponse.fromJson(Map<String, dynamic> json) =>
      _$MallProductResponseFromJson(json);
}
