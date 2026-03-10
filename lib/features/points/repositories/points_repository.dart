import 'package:lunchbox/features/points/datasources/points_rest_client.dart';
import 'package:lunchbox/features/points/entities/mall_product_response.dart';
import 'package:lunchbox/features/points/entities/points_record_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'points_repository.g.dart';

/// 积分商城与记录相关的 Repository
/// 封装所有积分 API 请求，错误由上层 Provider 处理
@riverpod
class PointsRepository extends _$PointsRepository {
  @override
  FutureOr<void> build() {}

  /// 获取商城商品列表（服务端过滤）
  /// [type] 商品类型: balance（余额类）| coupon（优惠券类）
  Future<List<MallProductResponse>> getMallProducts({
    required String type,
    int pageSize = 100,
  }) async {
    final client = ref.read(pointsRestClientProvider);
    final response = await client.getRedemptionItems(type: type);
    return response.data?.items ?? [];
  }

  /// 兑换商品，失败时抛出异常以便上层 Provider 捕获并处理
  Future<void> exchangeProduct(int productId) async {
    final client = ref.read(pointsRestClientProvider);
    final response = await client.redeemItem(productId);
    if (!response.success) {
      throw Exception(response.message);
    }
  }

  /// 获取积分历史记录（分页）
  /// [page] 当前页码，[type] 过滤类型: all | gain | use
  Future<List<PointsRecordResponse>> getPointsRecords({
    required int page,
    required String type,
  }) async {
    final client = ref.read(pointsRestClientProvider);
    final response = await client.getRedemptionHistory(
      page: page,
      type: type == 'all' ? null : type,
    );
    return response.data?.items ?? [];
  }
}
