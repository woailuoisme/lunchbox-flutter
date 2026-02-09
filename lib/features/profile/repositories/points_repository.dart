import 'package:lunchbox/features/profile/models/mall_product_model.dart';
import 'package:lunchbox/features/profile/models/points_record_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'points_repository.g.dart';

@riverpod
class PointsRepository extends _$PointsRepository {
  @override
  FutureOr<void> build() {}

  Future<int> getPointsBalance() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return 2580;
  }

  Future<List<PointsRecordModel>> getPointsRecords() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return [
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
    ];
  }

  Future<List<MallProductModel>> getMallProducts() async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    return [
      MallProductModel(
        id: '1',
        title: '10元无门槛券',
        amountValue: 10,
        pointsCost: 1000,
        isHot: true,
      ),
      MallProductModel(
        id: '2',
        title: '5元立减券',
        amountValue: 5,
        pointsCost: 500,
        isHot: false,
      ),
      MallProductModel(
        id: '3',
        title: '20元满减券',
        amountValue: 20,
        pointsCost: 1800,
        isHot: true,
      ),
      MallProductModel(
        id: '4',
        title: '50元大额券',
        amountValue: 50,
        pointsCost: 4500,
        isHot: false,
      ),
      MallProductModel(
        id: '5',
        title: '免运费券',
        amountValue: 0,
        pointsCost: 300,
        isHot: false,
      ),
    ];
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
