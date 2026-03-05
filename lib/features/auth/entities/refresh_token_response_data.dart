import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_response_data.freezed.dart';
part 'refresh_token_response_data.g.dart';

/// 刷新 Token 响应数据模型
@freezed
sealed class RefreshTokenResponseData with _$RefreshTokenResponseData {
  const factory RefreshTokenResponseData({
    /// 新的认证 Token
    required String token,
  }) = _RefreshTokenResponseData;

  /// 从JSON映射创建 RefreshTokenResponseData 实例
  factory RefreshTokenResponseData.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseDataFromJson(json);
}
