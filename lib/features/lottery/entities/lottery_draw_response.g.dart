// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_draw_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LotteryDrawRecord _$LotteryDrawRecordFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_LotteryDrawRecord',
      json,
      ($checkedConvert) {
        final val = _LotteryDrawRecord(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          userId: $checkedConvert('user_id', (v) => (v as num?)?.toInt() ?? 0),
          prizeId: $checkedConvert(
            'prize_id',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
          prizeType: $checkedConvert('prize_type', (v) => v as String? ?? ''),
          prizeValue: $checkedConvert(
            'prize_value',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
          result: $checkedConvert('result', (v) => v as String? ?? ''),
          createdAt: $checkedConvert(
            'created_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'prizeId': 'prize_id',
        'prizeType': 'prize_type',
        'prizeValue': 'prize_value',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$LotteryDrawRecordToJson(_LotteryDrawRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'prize_id': instance.prizeId,
      'prize_type': instance.prizeType,
      'prize_value': instance.prizeValue,
      'result': instance.result,
      'created_at': ?instance.createdAt?.toIso8601String(),
      'updated_at': ?instance.updatedAt?.toIso8601String(),
    };

_LotteryDrawResponse _$LotteryDrawResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LotteryDrawResponse', json, ($checkedConvert) {
      final val = _LotteryDrawResponse(
        record: $checkedConvert(
          'record',
          (v) => v == null
              ? const LotteryDrawRecord(id: 0)
              : LotteryDrawRecord.fromJson(v as Map<String, dynamic>),
        ),
        prize: $checkedConvert(
          'prize',
          (v) => v == null
              ? null
              : LotteryPrizeResponse.fromJson(v as Map<String, dynamic>),
        ),
        isWinning: $checkedConvert('is_winning', (v) => v as bool? ?? false),
      );
      return val;
    }, fieldKeyMap: const {'isWinning': 'is_winning'});

Map<String, dynamic> _$LotteryDrawResponseToJson(
  _LotteryDrawResponse instance,
) => <String, dynamic>{
  'record': instance.record.toJson(),
  'prize': ?instance.prize?.toJson(),
  'is_winning': instance.isWinning,
};
