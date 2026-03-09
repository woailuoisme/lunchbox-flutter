import 'package:freezed_annotation/freezed_annotation.dart';

part 'lottery_statistics_response.freezed.dart';
part 'lottery_statistics_response.g.dart';

/// 抽奖统计响应模型
@freezed
sealed class LotteryStatisticsResponse with _$LotteryStatisticsResponse {
  const factory LotteryStatisticsResponse({
    /// 总记录数
    @JsonKey(name: 'total_records') @Default(0) int totalRecords,

    /// 中奖记录数
    @JsonKey(name: 'winning_records') @Default(0) int winningRecords,

    /// 已发放记录数
    @JsonKey(name: 'distributed_records') @Default(0) int distributedRecords,

    /// 中奖率
    @JsonKey(name: 'win_rate') @Default(0.0) double winRate,

    /// 中奖率百分比字符串
    @JsonKey(name: 'win_rate_percentage')
    @Default('0%')
    String winRatePercentage,
  }) = _LotteryStatisticsResponse;

  factory LotteryStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$LotteryStatisticsResponseFromJson(json);
}
