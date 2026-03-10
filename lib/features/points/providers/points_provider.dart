import 'dart:async';
import 'package:lunchbox/features/points/entities/mall_product_response.dart';
import 'package:lunchbox/features/points/entities/points_record_response.dart';
import 'package:lunchbox/features/points/providers/points_state.dart';
import 'package:lunchbox/features/points/repositories/points_repository.dart';
import 'package:lunchbox/features/profile/providers/profile_provider.dart';
import 'package:lunchbox/features/profile/providers/profile_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'points_provider.g.dart';

/// 积分商城 Provider
/// 管理商品列表加载、兑换流程与状态反馈
@riverpod
class PointsMallNotifier extends _$PointsMallNotifier {
  @override
  Future<PointsMallState> build() async {
    final repo = ref.watch(pointsRepositoryProvider.notifier);
    final balance = await ref.watch(pointsBalanceProvider.future);

    // 并发加载两类商品，利用服务端 type 参数过滤
    final results = await Future.wait([
      repo.getMallProducts(type: 'balance'),
      repo.getMallProducts(type: 'coupon'),
    ]);

    return PointsMallState(
      balanceProducts: results[0],
      couponProducts: results[1],
      balance: balance,
    );
  }

  /// 兑换商品
  /// 异常信息向上传递，由 UI 层通过 DialogService 展示
  Future<bool> redeemProduct(MallProductResponse product) async {
    final current = state.value;
    if (current == null || current.isRedeeming) return false;

    state = AsyncData(
      current.copyWith(
        isRedeeming: true,
        redeemingId: product.id,
        errorMessage: null,
        successMessage: null,
      ),
    );

    try {
      final repo = ref.read(pointsRepositoryProvider.notifier);
      await repo.exchangeProduct(product.id);

      // 兑换成功后刷新余额
      ref.invalidate(pointsBalanceProvider);

      state = AsyncData(
        current.copyWith(
          isRedeeming: false,
          redeemingId: null,
          successMessage: _kSuccessToken, // UI 层通过 token 判断并用 i18n 展示
        ),
      );
      return true;
    } catch (e) {
      state = AsyncData(
        current.copyWith(
          isRedeeming: false,
          redeemingId: null,
          errorMessage: e.toString(),
        ),
      );
      return false;
    }
  }

  /// 刷新整个商城状态（使用 Riverpod 推荐方式）
  void refresh() => ref.invalidateSelf();

  /// 清除消息标记（由 UI 层展示后调用）
  void clearMessage() {
    final current = state.value;
    if (current == null) return;
    state = AsyncData(
      current.copyWith(errorMessage: null, successMessage: null),
    );
  }
}

/// 兑换成功标识 token（UI 层根据此 token 判断并使用 i18n 展示消息）
const _kSuccessToken = '__success__';

/// 是否属于兑换成功消息
bool isPointsExchangeSuccess(String? msg) => msg == _kSuccessToken;

/// 积分兑换记录 Provider（分页，autoDispose）
/// page 为页码，type 为类型（all / gain / use）
@riverpod
Future<List<PointsRecordResponse>> pointsRecords(
  Ref ref, {
  required int page,
  required String type,
}) async {
  final repo = ref.read(pointsRepositoryProvider.notifier);
  return repo.getPointsRecords(page: page, type: type);
}

/// 用户积分余额 Provider（autoDispose，离页后释放）
/// 从 profileProvider 获取真实用户信息中的积分字段
@riverpod
Future<int> pointsBalance(Ref ref) async {
  final userProfile = await ref.watch(
    profileProvider.selectAsync((ProfileState state) => state.currentUser),
  );

  final String integralStr = userProfile?.integral ?? '0';
  return int.tryParse(integralStr) ?? 0;
}
