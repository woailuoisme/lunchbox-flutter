import 'package:lunchbox/features/welcome_gift/datasources/welcome_gift_rest_client.dart';
import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_item_response.dart';
import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_log_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'welcome_gift_repository.g.dart';

@Riverpod(keepAlive: true)
WelcomeGiftRepository welcomeGiftRepository(Ref ref) {
  return WelcomeGiftRepository(ref.watch(welcomeGiftRestClientProvider));
}

/// 新人礼包仓库
class WelcomeGiftRepository {
  WelcomeGiftRepository(this._client);

  final WelcomeGiftRestClient _client;

  /// 获取新人礼包项列表
  Future<List<WelcomeGiftItemResponse>> getWelcomeGiftItems() async {
    final response = await _client.getWelcomeGiftItems();
    return response.data ?? [];
  }

  /// 领取新人礼包
  Future<void> claimWelcomeGift(int giftId) async {
    await _client.claimWelcomeGift(giftId);
  }

  /// 获取新人礼包领取记录
  Future<List<WelcomeGiftLogResponse>> getWelcomeGiftLogs() async {
    final response = await _client.getWelcomeGiftLogs();
    return response.data ?? [];
  }
}
