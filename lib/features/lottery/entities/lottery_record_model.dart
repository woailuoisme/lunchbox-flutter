import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/lottery/entities/lottery_prize_model.dart';

part 'lottery_record_model.freezed.dart';
part 'lottery_record_model.g.dart';

/// 抽奖记录模型
@freezed
abstract class LotteryRecordModel with _$LotteryRecordModel {
  const factory LotteryRecordModel({
    /// 记录ID
    required String id,

    /// 获得的奖品
    required LotteryPrizeModel prize,

    /// 抽奖时间
    @JsonKey(name: 'created_at') required DateTime createdAt,

    /// 状态 (pending: 待发放, completed: 已发放)
    @Default('completed') String status,
  }) = _LotteryRecordModel;

  factory LotteryRecordModel.fromJson(Map<String, dynamic> json) =>
      _$LotteryRecordModelFromJson(json);
}
