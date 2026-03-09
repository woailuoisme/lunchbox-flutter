import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/lottery/entities/lottery_prize_response.dart';

part 'lottery_draw_response.freezed.dart';
part 'lottery_draw_response.g.dart';

/// 抽奖记录简要信息 (Draw 接口返回)
@freezed
sealed class LotteryDrawRecord with _$LotteryDrawRecord {
  const factory LotteryDrawRecord({
    required int id,
    @JsonKey(name: 'user_id') @Default(0) int userId,
    @JsonKey(name: 'prize_id') @Default(0) int prizeId,
    @JsonKey(name: 'prize_type') @Default('') String prizeType,
    @JsonKey(name: 'prize_value') @Default(0) int prizeValue,
    @Default('') String result,
    @JsonKey(name: 'created_at') @Default(null) DateTime? createdAt,
    @JsonKey(name: 'updated_at') @Default(null) DateTime? updatedAt,
  }) = _LotteryDrawRecord;

  factory LotteryDrawRecord.fromJson(Map<String, dynamic> json) =>
      _$LotteryDrawRecordFromJson(json);
}

/// 执行抽奖接口的响应数据模型
@freezed
sealed class LotteryDrawResponse with _$LotteryDrawResponse {
  const factory LotteryDrawResponse({
    /// 抽奖生成的记录
    @Default(LotteryDrawRecord(id: 0)) LotteryDrawRecord record,

    /// 中奖的奖品详情 (未中奖时可能为 null 或特定的空奖品)
    @Default(null) LotteryPrizeResponse? prize,

    /// 是否中奖
    @JsonKey(name: 'is_winning') @Default(false) bool isWinning,
  }) = _LotteryDrawResponse;

  factory LotteryDrawResponse.fromJson(Map<String, dynamic> json) =>
      _$LotteryDrawResponseFromJson(json);
}
