import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_model.freezed.dart';
part 'coupon_model.g.dart';

/// 优惠券模型
@freezed
abstract class CouponModel with _$CouponModel {
  const factory CouponModel({
    /// 优惠券ID
    required int id,

    /// 优惠券名称
    required String name,

    /// 优惠券描述
    String? description,

    /// 优惠券类型 (full_reduction: 满减券, discount: 折扣券, reduction: 减免)
    required String type,

    /// 优惠规则
    required CouponRuleModel rule,

    /// 总数量
    @JsonKey(name: 'total_quantity') required int totalQuantity,

    /// 已使用数量
    @JsonKey(name: 'used_quantity') required int usedQuantity,

    /// 剩余数量
    @JsonKey(name: 'remaining_quantity') required int remainingQuantity,

    /// 每人限领数量
    @JsonKey(name: 'per_user_limit') int? perUserLimit,

    /// 是否已激活
    @JsonKey(name: 'is_activated') @Default(true) bool isActivated,

    /// 开始时间
    @JsonKey(name: 'start_at') String? startAt,

    /// 结束时间
    @JsonKey(name: 'end_at') String? endAt,

    /// 创建时间
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _CouponModel;

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);
}

/// 优惠券规则模型
@freezed
abstract class CouponRuleModel with _$CouponRuleModel {
  const factory CouponRuleModel({
    /// 减免金额
    @JsonKey(name: 'reduce_amount') double? reduceAmount,

    /// 折扣比例 (0-100)
    @JsonKey(name: 'discount_rate') double? discountRate,

    /// 最高折扣金额
    @JsonKey(name: 'max_discount') double? maxDiscount,

    /// 门槛金额 (min_amount 或 min_spend_amount)
    @JsonKey(name: 'min_amount') double? minAmount,

    /// 满减门槛金额 (兼容旧字段)
    @JsonKey(name: 'min_spend_amount') double? minSpendAmount,
  }) = _CouponRuleModel;

  factory CouponRuleModel.fromJson(Map<String, dynamic> json) =>
      _$CouponRuleModelFromJson(json);
}
