// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PointsRecordModel _$PointsRecordModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PointsRecordModel', json, ($checkedConvert) {
      final val = _PointsRecordModel(
        id: $checkedConvert('id', (v) => v as String),
        title: $checkedConvert('title', (v) => v as String),
        points: $checkedConvert('points', (v) => (v as num).toInt()),
        date: $checkedConvert('date', (v) => v as String),
        type: $checkedConvert('type', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$PointsRecordModelToJson(_PointsRecordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'points': instance.points,
      'date': instance.date,
      'type': instance.type,
    };
