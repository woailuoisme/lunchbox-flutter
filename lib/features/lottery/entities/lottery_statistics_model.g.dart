// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LotteryStatisticsModel _$LotteryStatisticsModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_LotteryStatisticsModel',
  json,
  ($checkedConvert) {
    final val = _LotteryStatisticsModel(
      totalDraws: $checkedConvert(
        'total_draws',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      remainingSpins: $checkedConvert(
        'remaining_spins',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      totalValue: $checkedConvert(
        'total_value',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
      winCount: $checkedConvert('win_count', (v) => (v as num?)?.toInt() ?? 0),
    );
    return val;
  },
  fieldKeyMap: const {
    'totalDraws': 'total_draws',
    'remainingSpins': 'remaining_spins',
    'totalValue': 'total_value',
    'winCount': 'win_count',
  },
);

Map<String, dynamic> _$LotteryStatisticsModelToJson(
  _LotteryStatisticsModel instance,
) => <String, dynamic>{
  'total_draws': instance.totalDraws,
  'remaining_spins': instance.remainingSpins,
  'total_value': instance.totalValue,
  'win_count': instance.winCount,
};
