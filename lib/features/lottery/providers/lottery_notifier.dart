import 'package:lunchbox/features/lottery/entities/lottery_prize.dart';
import 'package:lunchbox/features/lottery/entities/lottery_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lottery_notifier.g.dart';

@riverpod
class LotteryNotifier extends _$LotteryNotifier {
  @override
  LotteryState build() {
    return LotteryState(remainingSpins: 3, prizes: _mockPrizes());
  }

  /// 奖盘配置项
  List<String> get wheelItems => [
    '5乖乖币',
    '10乖乖币',
    '50乖乖币',
    '100乖乖币',
    '150乖乖币',
    '200乖乖币',
  ];

  /// 开始抽奖
  /// 返回中奖索引，如果无法抽奖则返回 null
  Future<int?> spin() async {
    if (state.isSpinning || state.remainingSpins <= 0) {
      return null;
    }

    state = state.copyWith(isSpinning: true);

    // 模拟网络请求延迟
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // 随机生成中奖索引 (0-5)
    final winIndex = DateTime.now().millisecondsSinceEpoch % wheelItems.length;
    final winItem = wheelItems[winIndex];
    // final amount = double.tryParse(winItem.replaceAll('乖乖币', '')) ?? 0;

    // 注意：实际状态更新应在动画结束后进行，但为了简化流程，这里先预扣次数
    // 真正的“获得奖品”逻辑可能需要拆分，但这里我们在spin返回后由UI决定何时弹窗
    state = state.copyWith(
      isSpinning: true, // 保持旋转状态，直到UI动画结束调用 completeSpin
      remainingSpins: state.remainingSpins - 1,
    );

    return winIndex;
  }

  /// 完成抽奖动画
  void completeSpin(LotteryPrize prize) {
    state = state.copyWith(
      isSpinning: false,
      prizes: [prize, ...state.prizes],
      lastWonPrize: prize,
    );
  }

  /// 构造奖品对象（辅助方法，用于UI在动画结束后调用 completeSpin）
  LotteryPrize createPrize(int index) {
    final winItem = wheelItems[index];
    final amount = double.tryParse(winItem.replaceAll('乖乖币', '')) ?? 0;
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
