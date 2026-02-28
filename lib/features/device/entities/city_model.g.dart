// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CityModel _$CityModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CityModel', json, ($checkedConvert) {
      final val = _CityModel(
        code: $checkedConvert('code', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String? ?? ''),
        province: $checkedConvert('province', (v) => v as String? ?? ''),
        city: $checkedConvert('city', (v) => v as String? ?? ''),
        count: $checkedConvert('count', (v) => (v as num?)?.toInt() ?? 0),
      );
      return val;
    });

Map<String, dynamic> _$CityModelToJson(_CityModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'province': instance.province,
      'city': instance.city,
      'count': instance.count,
    };
