// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LotteryRecordModel _$LotteryRecordModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LotteryRecordModel', json, ($checkedConvert) {
      final val = _LotteryRecordModel(
        id: $checkedConvert('id', (v) => v as String),
        prize: $checkedConvert(
          'prize',
          (v) => LotteryPrizeModel.fromJson(v as Map<String, dynamic>),
        ),
        createdAt: $checkedConvert(
          'created_at',
          (v) => DateTime.parse(v as String),
        ),
        status: $checkedConvert('status', (v) => v as String? ?? 'completed'),
      );
      return val;
    }, fieldKeyMap: const {'createdAt': 'created_at'});

Map<String, dynamic> _$LotteryRecordModelToJson(_LotteryRecordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prize': instance.prize.toJson(),
      'created_at': instance.createdAt.toIso8601String(),
      'status': instance.status,
    };
