import 'package:freezed_annotation/freezed_annotation.dart';

part 'points_record_response.freezed.dart';
part 'points_record_response.g.dart';

/// 积分记录响应模型
@freezed
sealed class PointsRecordResponse with _$PointsRecordResponse {
  const factory PointsRecordResponse({
    /// 记录ID
    required int id,

    /// 用户ID
    @JsonKey(name: 'user_id') @Default(0) int userId,

    /// 物品ID
    @JsonKey(name: 'item_id') int? itemId,

    /// 变动积分
    @Default(0) int inte,

    /// 状态 (completed 等)
    @Default('') String status,

    /// 兑换项简报
    @JsonKey(name: 'redemption_item') Map<String, dynamic>? redemptionItem,

    /// 兑换类型
    @JsonKey(name: 'redemption_type') String? redemptionType,

    /// 兑换内容描述
    @JsonKey(name: 'redemption_content') @Default('') String redemptionContent,

    /// 状态标签
    @JsonKey(name: 'status_label') @Default('') String statusLabel,

    /// 创建时间
    @JsonKey(name: 'created_at') @Default('') String createdAt,
  }) = _PointsRecordResponse;

  factory PointsRecordResponse.fromJson(Map<String, dynamic> json) =>
      _$PointsRecordResponseFromJson(json);
}
