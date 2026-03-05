// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_up_rule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopUpRuleModel _$TopUpRuleModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TopUpRuleModel', json, ($checkedConvert) {
      final val = _TopUpRuleModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        amount: $checkedConvert('amount', (v) => v as String),
        actualAmount: $checkedConvert('actual_amount', (v) => v as String),
        integral: $checkedConvert('integral', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'actualAmount': 'actual_amount'});

Map<String, dynamic> _$TopUpRuleModelToJson(_TopUpRuleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'actual_amount': instance.actualAmount,
      'integral': instance.integral,
      'description': ?instance.description,
    };
