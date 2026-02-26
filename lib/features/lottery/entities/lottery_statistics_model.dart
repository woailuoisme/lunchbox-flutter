import 'package:freezed_annotation/freezed_annotation.dart';

part 'lottery_statistics_model.freezed.dart';
part 'lottery_statistics_model.g.dart';

/// 抽奖统计模型
@freezed
abstract class LotteryStatisticsModel with _$LotteryStatisticsModel {
  const factory LotteryStatisticsModel({
    /// 总抽奖次数
    @JsonKey(name: 'total_draws') @Default(0) int totalDraws,

    /// 剩余抽奖次数
    @JsonKey(name: 'remaining_spins') @Default(0) int remainingSpins,

    /// 总获得金额/积分
    @JsonKey(name: 'total_value') @Default(0.0) double totalValue,

    /// 中奖次数
    @JsonKey(name: 'win_count') @Default(0) int winCount,
  }) = _LotteryStatisticsModel;

  factory LotteryStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$LotteryStatisticsModelFromJson(json);
}
