import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_item_response.dart';
import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_log_response.dart';
import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_state.dart';
import 'package:lunchbox/features/welcome_gift/repositories/welcome_gift_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'welcome_gift_provider.g.dart';

@riverpod
class WelcomeGiftNotifier extends _$WelcomeGiftNotifier {
  @override
  Future<WelcomeGiftState> build() async {
    final repository = ref.watch(welcomeGiftRepositoryProvider);

    // 并发请求礼包列表和历史记录
    final results = await Future.wait([
      repository.getWelcomeGiftItems(),
      repository.getWelcomeGiftLogs(),
    ]);

    return WelcomeGiftState(
      availableGifts: results[0] as List<WelcomeGiftItemResponse>,
      receivedLogs: results[1] as List<WelcomeGiftLogResponse>,
    );
  }

  /// 领取礼包
  Future<bool> claimGift(int giftId) async {
    final current = state.value;
    if (current == null || current.isProcessing) return false;

    state = AsyncData(
      current.copyWith(
        isProcessing: true,
        processingId: giftId,
        errorMessage: null,
      ),
    );

    try {
      final repository = ref.read(welcomeGiftRepositoryProvider);
      await repository.claimWelcomeGift(giftId);

      // 领取成功后刷新状态
      await refresh();
      return true;
    } catch (e) {
      state = AsyncData(
        current.copyWith(
          isProcessing: false,
          processingId: null,
          errorMessage: e.toString(),
        ),
      );
      return false;
    }
  }

  /// 全量刷新
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build());
  }

  /// 清除错误信息
  void clearMessage() {
    final current = state.value;
    if (current == null) return;
    state = AsyncData(
      current.copyWith(errorMessage: null, successMessage: null),
    );
  }
}
