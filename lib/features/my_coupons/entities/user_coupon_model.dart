import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/coupons/entities/coupon_model.dart';

part 'user_coupon_model.freezed.dart';
part 'user_coupon_model.g.dart';

/// 用户优惠券模型
@freezed
abstract class UserCouponModel with _$UserCouponModel {
  const factory UserCouponModel({
    /// 用户优惠券关联ID
    @JsonKey(name: 'user_coupon_id') required int userCouponId,

    /// 优惠券基础ID
    @JsonKey(name: 'coupon_id') required int couponId,

    /// 使用时间
    @JsonKey(name: 'used_at') String? usedAt,

    /// 是否已使用
    @JsonKey(name: 'is_used') @Default(false) bool isUsed,

    /// 优惠券名称
    required String name,

    /// 优惠券描述
    String? description,

    /// 优惠券分类 (shop: 商城, goods: 食品)
    required String category,

    /// 优惠券类型 (full_reduction, discount, exchange, gift, reduction)
    required String type,

    /// 优惠规则
    required CouponRuleModel rule,

    /// 开始时间
    @JsonKey(name: 'start_at') String? startAt,

    /// 结束时间
    @JsonKey(name: 'end_at') String? endAt,
  }) = _UserCouponModel;

  factory UserCouponModel.fromJson(Map<String, dynamic> json) =>
      _$UserCouponModelFromJson(json);
}
