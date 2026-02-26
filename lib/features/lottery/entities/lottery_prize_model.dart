import 'package:freezed_annotation/freezed_annotation.dart';

part 'lottery_prize_model.freezed.dart';
part 'lottery_prize_model.g.dart';

/// 抽奖奖品模型
@freezed
abstract class LotteryPrizeModel with _$LotteryPrizeModel {
  const factory LotteryPrizeModel({
    /// 奖品ID
    required String id,

    /// 奖品名称
    required String name,

    /// 奖品图片
    @Default('') String image,

    /// 奖品类型 (coupon: 优惠券, point: 积分, physical: 实物, none: 未中奖)
    required String type,

    /// 奖品价值 (金额或积分数)
    @Default(0) double value,

    /// 奖品描述
    @Default('') String description,
  }) = _LotteryPrizeModel;

  factory LotteryPrizeModel.fromJson(Map<String, dynamic> json) =>
      _$LotteryPrizeModelFromJson(json);
}
