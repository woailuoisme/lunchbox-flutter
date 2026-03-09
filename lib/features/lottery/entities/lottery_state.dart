import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/lottery/entities/lottery_prize_response.dart';
import 'package:lunchbox/features/lottery/entities/lottery_record_response.dart';
import 'package:lunchbox/features/lottery/entities/lottery_statistics_response.dart';

part 'lottery_state.freezed.dart';

@freezed
sealed class LotteryState with _$LotteryState {
  const factory LotteryState({
    /// 奖盘池中的商品列表
    @Default([]) List<LotteryPrizeResponse> prizes,

    /// 用户的中奖/抽奖记录
    @Default([]) List<LotteryRecordResponse> records,

    /// 统计信息
    LotteryStatisticsResponse? statistics,

    /// 剩余次数
    @Default(0) int remainingSpins,

    /// 是否正在旋转
    @Default(false) bool isSpinning,

    /// 是否正在加载
    @Default(false) bool isLoading,

    /// 最后一次中奖的奖品
    LotteryPrizeResponse? lastWonPrize,

    /// 错误消息
    String? errorMessage,
  }) = _LotteryState;
}
