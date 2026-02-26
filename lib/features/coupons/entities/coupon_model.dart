import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_model.freezed.dart';
part 'coupon_model.g.dart';

/// 优惠券模型
@freezed
abstract class CouponModel with _$CouponModel {
  const factory CouponModel({
    /// 优惠券ID
    required String id,

    /// 优惠券名称
    required String name,

    /// 优惠券描述
    required String description,

    /// 优惠金额/折扣
    required double amount,

    /// 使用门槛（0表示无门槛）
    @Default(0) double minSpend,

    /// 优惠券类型 (discount: 折扣, cash: 现金)
    @Default('cash') String type,

    /// 有效期开始时间
    required DateTime startTime,

    /// 有效期结束时间
    required DateTime endTime,

    /// 是否已领取
    @Default(false) bool isReceived,

    /// 是否已使用
    @Default(false) bool isUsed,
  }) = _CouponModel;

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);
}
