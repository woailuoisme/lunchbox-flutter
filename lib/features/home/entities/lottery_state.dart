import 'package:lunchbox/features/home/entities/lottery_prize.dart';

class LotteryState {
  const LotteryState({
    this.remainingSpins = 0,
    this.isSpinning = false,
    this.prizes = const [],
    this.lastWonPrize,
  });

  final int remainingSpins;
  final bool isSpinning;
  final List<LotteryPrize> prizes;
  final LotteryPrize? lastWonPrize;

  LotteryState copyWith({
    int? remainingSpins,
    bool? isSpinning,
    List<LotteryPrize>? prizes,
    LotteryPrize? lastWonPrize,
  }) {
    return LotteryState(
      remainingSpins: remainingSpins ?? this.remainingSpins,
      isSpinning: isSpinning ?? this.isSpinning,
      prizes: prizes ?? this.prizes,
      lastWonPrize: lastWonPrize ?? this.lastWonPrize,
    );
  }
}
