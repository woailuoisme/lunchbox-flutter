import 'package:lunchbox/features/wallet/entities/wallet_transaction_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wallet_repository.g.dart';

@riverpod
class WalletRepository extends _$WalletRepository {
  @override
  FutureOr<void> build() {
    // 这是一个简单的仓库，不需要维护复杂状态，或者可以维护余额
  }

  Future<List<WalletTransactionModel>> getTransactionsPaginated({
    required int page,
    required int pageSize,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));

    // 模拟数据：如果超过3页就没有数据了
    if (page > 3) return [];

    return List.generate(pageSize, (index) {
      final actualIndex = (page - 1) * pageSize + index;
      final isRecharge = actualIndex % 4 == 0; // 每4条有一条充值记录

      return WalletTransactionModel(
        id: 'mock_$actualIndex',
        title: isRecharge ? '账户充值' : (actualIndex % 3 == 0 ? '购买午餐' : '购买饮料'),
        amount: isRecharge ? 100.0 + (index * 10) : 10.0 + (index * 2.5),
        date:
            '2025-02-${(actualIndex % 28) + 1} 12:${(index % 60).toString().padLeft(2, '0')}',
        type: isRecharge ? 'recharge' : 'consume',
      );
    });
  }

  Future<double> getBalance() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return 1280.50;
  }

  Future<List<WalletTransactionModel>> getTransactions() async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    return [
      WalletTransactionModel(
        id: '1',
        title: '账户充值',
        amount: 500.00,
        date: '2025-02-01 10:30',
        type: 'recharge',
      ),
      WalletTransactionModel(
        id: '2',
        title: '购买午餐',
        amount: 35.00,
        date: '2025-02-02 12:15',
        type: 'consume',
      ),
      WalletTransactionModel(
        id: '3',
        title: '购买饮料',
        amount: 12.00,
        date: '2025-02-03 14:20',
        type: 'consume',
      ),
      WalletTransactionModel(
        id: '4',
        title: '活动赠送',
        amount: 50.00,
        date: '2025-02-05 09:00',
        type: 'recharge',
      ),
      WalletTransactionModel(
        id: '5',
        title: '购买晚餐',
        amount: 48.00,
        date: '2025-02-06 18:30',
        type: 'consume',
      ),
    ];
  }
}

@riverpod
Future<double> walletBalance(Ref ref) {
  return ref.watch(walletRepositoryProvider.notifier).getBalance();
}

@riverpod
Future<List<WalletTransactionModel>> walletTransactions(Ref ref) {
  return ref.watch(walletRepositoryProvider.notifier).getTransactions();
}
