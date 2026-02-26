import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation_verify_model.freezed.dart';
part 'invitation_verify_model.g.dart';

/// 邀请码验证结果模型
@freezed
abstract class InvitationVerifyModel with _$InvitationVerifyModel {
  const factory InvitationVerifyModel({
    /// 邀请码是否有效
    @JsonKey(name: 'is_valid') @Default(false) bool isValid,

    /// 邀请人昵称
    @JsonKey(name: 'inviter_name') String? inviterName,

    /// 邀请人头像
    @JsonKey(name: 'inviter_avatar') String? inviterAvatar,
  }) = _InvitationVerifyModel;

  factory InvitationVerifyModel.fromJson(Map<String, dynamic> json) =>
      _$InvitationVerifyModelFromJson(json);
}
