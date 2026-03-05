import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_data.freezed.dart';
part 'login_response_data.g.dart';

/// 登录响应数据模型
@freezed
sealed class LoginResponseData with _$LoginResponseData {
  const factory LoginResponseData({
    /// 用户ID
    required int id,

    /// 手机号
    String? telephone,

    /// 认证 Token
    required String token,

    /// 过期时长（字符串形式，如 "20160 minutes"）
    @JsonKey(name: 'expires_in') String? expiresIn,

    /// 创建时间
    @JsonKey(name: 'created_at') String? createdAt,

    /// 过期时间
    @JsonKey(name: 'expires_at') String? expiresAt,
  }) = _LoginResponseData;

  /// 从JSON映射创建 LoginResponseData 实例
  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDataFromJson(json);
}
