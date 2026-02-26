import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation_code_model.freezed.dart';
part 'invitation_code_model.g.dart';

/// 邀请码模型
@freezed
abstract class InvitationCodeModel with _$InvitationCodeModel {
  const factory InvitationCodeModel({
    /// 邀请码
    required String code,

    /// 邀请链接
    @JsonKey(name: 'share_url') String? shareUrl,

    /// 过期时间
    @JsonKey(name: 'expire_at') DateTime? expireAt,
  }) = _InvitationCodeModel;

  factory InvitationCodeModel.fromJson(Map<String, dynamic> json) =>
      _$InvitationCodeModelFromJson(json);
}
