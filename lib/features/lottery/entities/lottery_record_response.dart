import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/lottery/entities/lottery_prize_response.dart';

part 'lottery_record_response.freezed.dart';
part 'lottery_record_response.g.dart';

/// 抽奖记录响应模型
@freezed
sealed class LotteryRecordResponse with _$LotteryRecordResponse {
  const factory LotteryRecordResponse({
    /// 记录ID
    required int id,

    /// 用户ID
    @JsonKey(name: 'user_id') @Default(0) int userId,

    /// 奖品ID
    @JsonKey(name: 'prize_id') @Default(null) int? prizeId,

    /// 奖品类型
    @JsonKey(name: 'prize_type') @Default('') String prizeType,

    /// 奖品价值
    @JsonKey(name: 'prize_value') @Default(0) int prizeValue,

    /// 抽奖结果 (win, lose)
    @Default('') String result,

    /// 获得的奖品详情
    @Default(null) LotteryPrizeResponse? prize,

    /// 抽奖时间
    @JsonKey(name: 'created_at') @Default(null) DateTime? createdAt,

    /// 更新时间
    @JsonKey(name: 'updated_at') @Default(null) DateTime? updatedAt,
  }) = _LotteryRecordResponse;

  factory LotteryRecordResponse.fromJson(Map<String, dynamic> json) =>
      _$LotteryRecordResponseFromJson(json);
}
