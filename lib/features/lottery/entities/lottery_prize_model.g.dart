// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_prize_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LotteryPrizeModel _$LotteryPrizeModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LotteryPrizeModel', json, ($checkedConvert) {
      final val = _LotteryPrizeModel(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        image: $checkedConvert('image', (v) => v as String? ?? ''),
        type: $checkedConvert('type', (v) => v as String),
        value: $checkedConvert('value', (v) => (v as num?)?.toDouble() ?? 0),
        description: $checkedConvert('description', (v) => v as String? ?? ''),
      );
      return val;
    });

Map<String, dynamic> _$LotteryPrizeModelToJson(_LotteryPrizeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'type': instance.type,
      'value': instance.value,
      'description': instance.description,
    };
