import 'package:freezed_annotation/freezed_annotation.dart';

part 'lottery_prize_response.freezed.dart';
part 'lottery_prize_response.g.dart';

/// 奖品规则
@freezed
sealed class PrizeRules with _$PrizeRules {
  const factory PrizeRules({
    @JsonKey(name: 'integral_amount') @Default(null) int? integralAmount,
  }) = _PrizeRules;

  factory PrizeRules.fromJson(Map<String, dynamic> json) =>
      _$PrizeRulesFromJson(json);
}

/// 抽奖奖品响应模型
@freezed
sealed class LotteryPrizeResponse with _$LotteryPrizeResponse {
  const factory LotteryPrizeResponse({
    /// 奖品ID
    required int id,

    /// 奖品名称
    @Default('') String name,

    /// 奖品类型 (integral: 积分)
    @Default('') String type,

    /// 奖品规则
    @Default(PrizeRules()) PrizeRules rules,

    /// 中奖概率 (万分位)
    @Default(0) int probability,

    /// 每日限制
    @JsonKey(name: 'daily_limit') @Default(0) int dailyLimit,

    /// 总量限制
    @JsonKey(name: 'total_limit') @Default(0) int totalLimit,

    /// 今日已发数量
    @JsonKey(name: 'daily_count') @Default(0) int dailyCount,

    /// 总计已发数量
    @JsonKey(name: 'total_count') @Default(0) int totalCount,

    /// 是否启用
    @JsonKey(name: 'is_enabled') @Default(false) bool isEnabled,

    /// 奖品图片
    @Default('') String image,

    /// 奖品描述
    @Default('') String description,

    /// 创建时间
    @JsonKey(name: 'created_at') @Default('') String createdAt,
  }) = _LotteryPrizeResponse;

  factory LotteryPrizeResponse.fromJson(Map<String, dynamic> json) =>
      _$LotteryPrizeResponseFromJson(json);
}
