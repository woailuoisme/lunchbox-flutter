// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_statistics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LotteryStatisticsResponse _$LotteryStatisticsResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_LotteryStatisticsResponse',
  json,
  ($checkedConvert) {
    final val = _LotteryStatisticsResponse(
      totalRecords: $checkedConvert(
        'total_records',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      winningRecords: $checkedConvert(
        'winning_records',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      distributedRecords: $checkedConvert(
        'distributed_records',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      winRate: $checkedConvert(
        'win_rate',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
      winRatePercentage: $checkedConvert(
        'win_rate_percentage',
        (v) => v as String? ?? '0%',
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'totalRecords': 'total_records',
    'winningRecords': 'winning_records',
    'distributedRecords': 'distributed_records',
    'winRate': 'win_rate',
    'winRatePercentage': 'win_rate_percentage',
  },
);

Map<String, dynamic> _$LotteryStatisticsResponseToJson(
  _LotteryStatisticsResponse instance,
) => <String, dynamic>{
  'total_records': instance.totalRecords,
  'winning_records': instance.winningRecords,
  'distributed_records': instance.distributedRecords,
  'win_rate': instance.winRate,
  'win_rate_percentage': instance.winRatePercentage,
};
