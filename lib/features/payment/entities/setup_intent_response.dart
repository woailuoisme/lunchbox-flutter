import 'package:freezed_annotation/freezed_annotation.dart';

part 'setup_intent_response.freezed.dart';
part 'setup_intent_response.g.dart';

@freezed
sealed class SetupIntentResponse with _$SetupIntentResponse {
  const factory SetupIntentResponse({
    /// Stripe 设置意向客户端密钥
    @JsonKey(name: 'client_secret') required String clientSecret,
  }) = _SetupIntentResponse;

  factory SetupIntentResponse.fromJson(Map<String, dynamic> json) =>
      _$SetupIntentResponseFromJson(json);
}
