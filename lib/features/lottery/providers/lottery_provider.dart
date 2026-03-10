import 'package:lunchbox/core/network/response/paginated_response.dart';
import 'package:lunchbox/features/lottery/entities/lottery_prize_response.dart';
import 'package:lunchbox/features/lottery/entities/lottery_record_response.dart';
import 'package:lunchbox/features/lottery/entities/lottery_statistics_response.dart';
import 'package:lunchbox/features/lottery/entities/lottery_state.dart';
import 'package:lunchbox/features/lottery/repositories/lottery_repository.dart';
import 'package:lunchbox/features/profile/providers/profile_provider.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lottery_provider.g.dart';

@riverpod
class LotteryNotifier extends _$LotteryNotifier {
  @override
  Future<LotteryState> build() async {
    final repository = ref.watch(lotteryRepositoryProvider);

    // 并发拉取奖池、统计、第一页记录
    final results = await Future.wait([
      repository.getLotteryPrizes(),
      repository.getLotteryStatistics(),
      repository.getLotteryRecords(page: 1, size: 20),
    ]);

    final prizes = results[0] as List<LotteryPrizeResponse>;
    final stats = results[1] as LotteryStatisticsResponse?;
    final recordsPage = results[2] as PaginatedResponse<LotteryRecordResponse>?;

    final profileState = ref.watch(profileProvider).value;
    final lotteryCount = profileState?.currentUser?.lotteryCount ?? 0;

    return LotteryState(
      remainingSpins: lotteryCount,
      prizes: prizes,
      statistics: stats,
      records: recordsPage?.items ?? [],
    );
  }

  /// 奖盘展示项（取前 6 个，不足补"谢谢参与"）
  List<String> get wheelItems {
    final prizes = state.value?.prizes ?? [];
    if (prizes.isEmpty) {
      return List.filled(6, t.lottery.thankYou);
    }
    final items = prizes.map((p) => p.name).toList();
    while (items.length < 6) {
      items.add(t.lottery.thankYou);
    }
    return items.take(6).toList();
  }

  /// 执行抽奖，返回转盘中奖索引；失败或无次数时返回 null
  Future<int?> spin() async {
    final current = state.value;
    if (current == null || current.isSpinning || current.remainingSpins <= 0) {
      return null;
    }

    // ref.read 用于 Notifier 方法内部（避免订阅）
    final repository = ref.read(lotteryRepositoryProvider);

    try {
      state = AsyncData(current.copyWith(isSpinning: true));

      final drawResult = await repository.drawLottery();
      if (drawResult == null) {
        state = AsyncData(current.copyWith(isSpinning: false));
        return null;
      }

      // 匹配转盘位置
      int winIndex;
      if (drawResult.isWinning && drawResult.prize != null) {
        winIndex = wheelItems.indexOf(drawResult.prize!.name);
        if (winIndex == -1) winIndex = 0;
      } else {
        winIndex = wheelItems.indexWhere((item) => item == t.lottery.thankYou);
        if (winIndex == -1) winIndex = 0;
      }

      state = AsyncData(
        current.copyWith(
          isSpinning: true,
          remainingSpins: current.remainingSpins - 1,
          lastWonPrize: drawResult.prize,
        ),
      );

      return winIndex;
    } catch (e) {
      state = AsyncData(
        current.copyWith(isSpinning: false, errorMessage: e.toString()),
      );
      return null;
    }
  }

  /// 动画播毕后调用，重置旋转状态并静默刷新数据
  void completeSpin() {
    final current = state.value;
    if (current == null) return;
    state = AsyncData(current.copyWith(isSpinning: false));
    _silentRefresh();
  }

  /// 静默刷新统计与记录（不影响主流程）
  Future<void> _silentRefresh() async {
    final repository = ref.read(lotteryRepositoryProvider);
    try {
      final results = await Future.wait([
        repository.getLotteryStatistics(),
        repository.getLotteryRecords(page: 1, size: 20),
      ]);

      final stats = results[0] as LotteryStatisticsResponse?;
      final recordsPage =
          results[1] as PaginatedResponse<LotteryRecordResponse>?;
      final current = state.value;

      if (current != null) {
        state = AsyncData(
          current.copyWith(
            statistics: stats ?? current.statistics,
            records: recordsPage?.items ?? current.records,
          ),
        );
      }
    } catch (_) {
      // 静默失败，不影响主界面
    }
  }

  /// 强制全量刷新
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => build());
  }
}
