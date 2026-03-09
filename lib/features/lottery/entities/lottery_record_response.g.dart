// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_record_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LotteryRecordResponse _$LotteryRecordResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_LotteryRecordResponse',
  json,
  ($checkedConvert) {
    final val = _LotteryRecordResponse(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      userId: $checkedConvert('user_id', (v) => (v as num?)?.toInt() ?? 0),
      prizeId: $checkedConvert('prize_id', (v) => (v as num?)?.toInt() ?? null),
      prizeType: $checkedConvert('prize_type', (v) => v as String? ?? ''),
      prizeValue: $checkedConvert(
        'prize_value',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      result: $checkedConvert('result', (v) => v as String? ?? ''),
      prize: $checkedConvert(
        'prize',
        (v) => v == null
            ? null
            : LotteryPrizeResponse.fromJson(v as Map<String, dynamic>),
      ),
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

Map<String, dynamic> _$LotteryRecordResponseToJson(
  _LotteryRecordResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'prize_id': ?instance.prizeId,
  'prize_type': instance.prizeType,
  'prize_value': instance.prizeValue,
  'result': instance.result,
  'prize': ?instance.prize?.toJson(),
  'created_at': ?instance.createdAt?.toIso8601String(),
  'updated_at': ?instance.updatedAt?.toIso8601String(),
};
