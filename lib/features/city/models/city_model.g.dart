// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CityModel _$CityModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CityModel', json, ($checkedConvert) {
      final val = _CityModel(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        code: $checkedConvert('code', (v) => v as String),
        deviceCount: $checkedConvert('device_count', (v) => (v as num).toInt()),
      );
      return val;
    }, fieldKeyMap: const {'deviceCount': 'device_count'});

Map<String, dynamic> _$CityModelToJson(_CityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'device_count': instance.deviceCount,
    };
