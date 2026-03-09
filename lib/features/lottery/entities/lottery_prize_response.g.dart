// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_prize_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrizeRules _$PrizeRulesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PrizeRules', json, ($checkedConvert) {
      final val = _PrizeRules(
        integralAmount: $checkedConvert(
          'integral_amount',
          (v) => (v as num?)?.toInt() ?? null,
        ),
      );
      return val;
    }, fieldKeyMap: const {'integralAmount': 'integral_amount'});

Map<String, dynamic> _$PrizeRulesToJson(_PrizeRules instance) =>
    <String, dynamic>{'integral_amount': ?instance.integralAmount};

_LotteryPrizeResponse _$LotteryPrizeResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_LotteryPrizeResponse',
  json,
  ($checkedConvert) {
    final val = _LotteryPrizeResponse(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String? ?? ''),
      type: $checkedConvert('type', (v) => v as String? ?? ''),
      rules: $checkedConvert(
        'rules',
        (v) => v == null
            ? const PrizeRules()
            : PrizeRules.fromJson(v as Map<String, dynamic>),
      ),
      probability: $checkedConvert(
        'probability',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      dailyLimit: $checkedConvert(
        'daily_limit',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      totalLimit: $checkedConvert(
        'total_limit',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      dailyCount: $checkedConvert(
        'daily_count',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      totalCount: $checkedConvert(
        'total_count',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      isEnabled: $checkedConvert('is_enabled', (v) => v as bool? ?? false),
      image: $checkedConvert('image', (v) => v as String? ?? ''),
      description: $checkedConvert('description', (v) => v as String? ?? ''),
      createdAt: $checkedConvert('created_at', (v) => v as String? ?? ''),
    );
    return val;
  },
  fieldKeyMap: const {
    'dailyLimit': 'daily_limit',
    'totalLimit': 'total_limit',
    'dailyCount': 'daily_count',
    'totalCount': 'total_count',
    'isEnabled': 'is_enabled',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$LotteryPrizeResponseToJson(
  _LotteryPrizeResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'rules': instance.rules.toJson(),
  'probability': instance.probability,
  'daily_limit': instance.dailyLimit,
  'total_limit': instance.totalLimit,
  'daily_count': instance.dailyCount,
  'total_count': instance.totalCount,
  'is_enabled': instance.isEnabled,
  'image': instance.image,
  'description': instance.description,
  'created_at': instance.createdAt,
};
