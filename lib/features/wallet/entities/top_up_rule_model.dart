import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_up_rule_model.freezed.dart';
part 'top_up_rule_model.g.dart';

@freezed
sealed class TopUpRuleModel with _$TopUpRuleModel {
  /// 充值规则模型
  const factory TopUpRuleModel({
    required int id,
    required String amount,
    @JsonKey(name: 'actual_amount') required String actualAmount,
    required String integral,
    String? description,
  }) = _TopUpRuleModel;

  factory TopUpRuleModel.fromJson(Map<String, dynamic> json) =>
      _$TopUpRuleModelFromJson(json);
}
