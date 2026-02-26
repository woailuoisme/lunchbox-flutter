import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation_record_model.freezed.dart';
part 'invitation_record_model.g.dart';

/// 邀请记录模型
@freezed
abstract class InvitationRecordModel with _$InvitationRecordModel {
  const factory InvitationRecordModel({
    /// 记录ID
    required String id,

    /// 被邀请人手机号（掩码处理）
    @JsonKey(name: 'invitee_phone') required String inviteePhone,

    /// 邀请状态 (pending: 待处理, completed: 已完成)
    required String status,

    /// 获得的奖励金额
    @Default(0.0) double reward,

    /// 创建时间
    @JsonKey(name: 'create_time') required DateTime createTime,
  }) = _InvitationRecordModel;

  factory InvitationRecordModel.fromJson(Map<String, dynamic> json) =>
      _$InvitationRecordModelFromJson(json);
}
