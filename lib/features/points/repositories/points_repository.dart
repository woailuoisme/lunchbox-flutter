import 'package:lunchbox/features/points/entities/mall_product_model.dart';
import 'package:lunchbox/features/points/entities/points_record_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'points_repository.g.dart';

@riverpod
class PointsRepository extends _$PointsRepository {
  static int _mockBalance = 2580;

  @override
  FutureOr<void> build() {}

  Future<int> getPointsBalance() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return _mockBalance;
  }

  Future<List<PointsRecordModel>> getPointsRecords({
    int page = 1,
    int pageSize = 20,
    String? type,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    final allRecords = [
      PointsRecordModel(
        id: '1',
        title: '购买商品获得',
        points: 50,
        date: '2025-02-01',
        type: 'gain',
      ),
      PointsRecordModel(
        id: '2',
        title: '签到奖励',
        points: 10,
        date: '2025-02-02',
        type: 'gain',
      ),
      PointsRecordModel(
        id: '3',
        title: '兑换优惠券',
        points: -200,
        date: '2025-02-03',
        type: 'use',
      ),
      PointsRecordModel(
        id: '4',
        title: '购买商品获得',
        points: 80,
        date: '2025-02-04',
        type: 'gain',
      ),
      PointsRecordModel(
        id: '5',
        title: '邀请好友',
        points: 100,
        date: '2025-02-05',
        type: 'gain',
      ),
      // Add more mock data to demonstrate pagination if needed
      for (int i = 6; i <= 30; i++)
        PointsRecordModel(
          id: '$i',
          title: i % 2 == 0 ? '购买商品获得' : '兑换优惠券',
          points: i % 2 == 0 ? 50 : -20,
          date: '2025-02-0${i % 9 + 1}',
          type: i % 2 == 0 ? 'gain' : 'use',
        ),
    ];

    var filtered = allRecords;
    if (type != null && type != 'all') {
      filtered = allRecords.where((e) => e.type == type).toList();
    }

    final startIndex = (page - 1) * pageSize;
    if (startIndex >= filtered.length) {
      return [];
    }

    final endIndex = startIndex + pageSize;
    return filtered.sublist(
      startIndex,
      endIndex > filtered.length ? filtered.length : endIndex,
    );
  }

  Future<List<MallProductModel>> getMallProducts({
    int page = 1,
    int pageSize = 20,
    String? type,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));

    final allProducts = [
      MallProductModel(
        id: '1',
        title: '10元无门槛券',
        amountValue: 10,
        pointsCost: 1000,
        isHot: true,
        type: 'coupon',
      ),
      MallProductModel(
        id: '2',
        title: '5元立减券',
        amountValue: 5,
        pointsCost: 500,
        isHot: false,
        type: 'coupon',
      ),
      MallProductModel(
        id: '3',
        title: '20元满减券',
        amountValue: 20,
        pointsCost: 1800,
        isHot: true,
        type: 'coupon',
      ),
      MallProductModel(
        id: '4',
        title: '50元余额',
        amountValue: 50,
        pointsCost: 5000,
        isHot: false,
        type: 'balance',
      ),
      MallProductModel(
        id: '5',
        title: '免运费券',
        amountValue: 0,
        pointsCost: 300,
        isHot: false,
        type: 'coupon',
      ),
      // Mock pagination data
      for (int i = 6; i <= 30; i++)
        MallProductModel(
          id: '$i',
          title: i % 2 == 0 ? '${i * 10}元余额' : '${i * 5}元优惠券',
          amountValue: i % 2 == 0 ? i * 10 : i * 5,
          pointsCost: i * 100,
          isHot: i % 5 == 0,
          type: i % 2 == 0 ? 'balance' : 'coupon',
        ),
    ];

    var filtered = allProducts;
    if (type != null && type != 'all') {
      filtered = allProducts.where((e) => e.type == type).toList();
    }

    final startIndex = (page - 1) * pageSize;
    if (startIndex >= filtered.length) {
      return [];
    }

    final endIndex = startIndex + pageSize;
    return filtered.sublist(
      startIndex,
      endIndex > filtered.length ? filtered.length : endIndex,
    );
  }

  Future<bool> exchangeProduct(String productId, int cost) async {
    await Future<void>.delayed(const Duration(milliseconds: 1000));
    if (_mockBalance >= cost) {
      _mockBalance -= cost;
      return true;
    }
    return false;
  }
}

@riverpod
Future<int> pointsBalance(Ref ref) {
  return ref.watch(pointsRepositoryProvider.notifier).getPointsBalance();
}

@riverpod
Future<List<PointsRecordModel>> pointsRecords(Ref ref) {
  return ref.watch(pointsRepositoryProvider.notifier).getPointsRecords();
}

@riverpod
Future<List<MallProductModel>> mallProducts(Ref ref) {
  return ref.watch(pointsRepositoryProvider.notifier).getMallProducts();
}
