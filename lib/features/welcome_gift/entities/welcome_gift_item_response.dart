import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_gift_item_response.freezed.dart';
part 'welcome_gift_item_response.g.dart';

/// 新人礼包规则模型
@freezed
sealed class WelcomeGiftRules with _$WelcomeGiftRules {
  const factory WelcomeGiftRules({@JsonKey(name: 'coupon_id') int? couponId}) =
      _WelcomeGiftRules;

  factory WelcomeGiftRules.fromJson(Map<String, dynamic> json) =>
      _$WelcomeGiftRulesFromJson(json);
}

/// 新人礼包项响应模型
@freezed
sealed class WelcomeGiftItemResponse with _$WelcomeGiftItemResponse {
  const factory WelcomeGiftItemResponse({
    /// ID
    required int id,

    /// 名称
    required String name,

    /// 类型
    required String type,

    /// 类型标签
    @JsonKey(name: 'type_label') required String typeLabel,

    /// 规则
    required WelcomeGiftRules rules,

    /// 描述
    required String description,

    /// 排序
    required int order,

    /// 创建时间
    @JsonKey(name: 'created_at') required String createdAt,

    /// 是否已领取
    @JsonKey(name: 'is_claimed') @Default(false) bool isClaimed,
  }) = _WelcomeGiftItemResponse;

  factory WelcomeGiftItemResponse.fromJson(Map<String, dynamic> json) =>
      _$WelcomeGiftItemResponseFromJson(json);
}
