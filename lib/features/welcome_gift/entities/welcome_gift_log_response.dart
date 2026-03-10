import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_item_response.dart';

part 'welcome_gift_log_response.freezed.dart';
part 'welcome_gift_log_response.g.dart';

/// 新人礼包领取记录响应模型
@freezed
sealed class WelcomeGiftLogResponse with _$WelcomeGiftLogResponse {
  const factory WelcomeGiftLogResponse({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'welcome_gift_id') required int welcomeGiftId,
    @JsonKey(name: 'claimed_at') required String claimedAt,
    @JsonKey(name: 'welcomeGift') required WelcomeGiftItemResponse welcomeGift,
  }) = _WelcomeGiftLogResponse;

  factory WelcomeGiftLogResponse.fromJson(Map<String, dynamic> json) =>
      _$WelcomeGiftLogResponseFromJson(json);
}
