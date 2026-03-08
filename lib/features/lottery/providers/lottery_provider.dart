import 'package:lunchbox/features/lottery/entities/lottery_prize.dart';
import 'package:lunchbox/features/lottery/entities/lottery_state.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lottery_provider.g.dart';

@riverpod
class LotteryNotifier extends _$LotteryNotifier {
  @override
  FutureOr<LotteryState> build() {
    return LotteryState(remainingSpins: 3, prizes: _mockPrizes());
  }

  /// 奖盘配置项
  List<String> get wheelItems => [
    '5${t.points.unit}',
    '10${t.points.unit}',
    '50${t.points.unit}',
    '100${t.points.unit}',
    '150${t.points.unit}',
    '200${t.points.unit}',
  ];

  /// 开始抽奖
  /// 返回中奖索引，如果无法抽奖则返回 null
  Future<int?> spin() async {
    final current = state.value;
    if (current == null || current.isSpinning || current.remainingSpins <= 0) {
      return null;
    }

    int? winIndex;

    state = await AsyncValue.guard(() async {
      state = AsyncData(current.copyWith(isSpinning: true));

      // 模拟网络请求延迟
      await Future<void>.delayed(const Duration(milliseconds: 500));

      // 随机生成中奖索引 (0-5)
      winIndex = DateTime.now().millisecondsSinceEpoch % wheelItems.length;

      // 注意：实际状态更新应在动画结束后进行，但为了简化流程，这里先预扣次数
      return state.value!.copyWith(
        isSpinning: true, // 保持旋转状态，直到UI动画结束调用 completeSpin
        remainingSpins: state.value!.remainingSpins - 1,
      );
    });

    return winIndex;
  }

  /// 完成抽奖动画
  void completeSpin(LotteryPrize prize) {
    final current = state.value;
    if (current == null) return;

    state = AsyncData(
      current.copyWith(
        isSpinning: false,
        prizes: [prize, ...current.prizes],
        lastWonPrize: prize,
      ),
    );
  }

  /// 构造奖品对象（辅助方法，用于UI在动画结束后调用 completeSpin）
  LotteryPrize createPrize(int index) {
    final winItem = wheelItems[index];
    final amount = double.tryParse(winItem.replaceAll(t.points.unit, '')) ?? 0;
    return LotteryPrize(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: winItem,
      amount: amount,
      type: 'coin',
      createdAt: DateTime.now(),
      expiredAt: DateTime.now().add(const Duration(days: 30)),
    );
  }

  List<LotteryPrize> _mockPrizes() {
    return [
      LotteryPrize(
        id: '1',
        name: '10.0',
        amount: 10,
        type: 'coin',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        expiredAt: DateTime.now().add(const Duration(days: 29)),
      ),
      LotteryPrize(
        id: '2',
        name: '2.0',
        amount: 2,
        type: 'coin',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
        expiredAt: DateTime.now().add(const Duration(days: 30)),
      ),
    ];
  }
}
