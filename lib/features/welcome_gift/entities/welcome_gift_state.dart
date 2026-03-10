import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_item_response.dart';
import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_log_response.dart';

part 'welcome_gift_state.freezed.dart';

@freezed
sealed class WelcomeGiftState with _$WelcomeGiftState {
  const factory WelcomeGiftState({
    /// 可领取礼包列表
    @Default([]) List<WelcomeGiftItemResponse> availableGifts,

    /// 已领取礼包记录列表
    @Default([]) List<WelcomeGiftLogResponse> receivedLogs,

    /// 是否正在操作（如下单/领取）
    @Default(false) bool isProcessing,

    /// 错误消息
    String? errorMessage,

    /// 正在处理的礼包ID
    int? processingId,

    /// 成功提示消息（如领取成功后弹出）
    String? successMessage,
  }) = _WelcomeGiftState;
}
