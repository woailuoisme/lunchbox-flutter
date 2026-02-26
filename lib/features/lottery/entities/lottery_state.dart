import 'package:lunchbox/features/lottery/entities/lottery_prize.dart';

class LotteryState {
  const LotteryState({
    this.remainingSpins = 0,
    this.isLoading = false,
    this.errorMessage,
    this.isSpinning = false,
    this.prizes = const [],
    this.lastWonPrize,
  });

  final int remainingSpins;
  final bool isLoading;
  final String? errorMessage;
  final bool isSpinning;
  final List<LotteryPrize> prizes;
  final LotteryPrize? lastWonPrize;

  LotteryState copyWith({
    int? remainingSpins,
    bool? isLoading,
    String? errorMessage,
    bool? isSpinning,
    List<LotteryPrize>? prizes,
    LotteryPrize? lastWonPrize,
  }) {
    return LotteryState(
      remainingSpins: remainingSpins ?? this.remainingSpins,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSpinning: isSpinning ?? this.isSpinning,
      prizes: prizes ?? this.prizes,
      lastWonPrize: lastWonPrize ?? this.lastWonPrize,
    );
  }
}
