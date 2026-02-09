// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CityModel _$CityModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_CityModel',
  json,
  ($checkedConvert) {
    final val = _CityModel(
      id: $checkedConvert('id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      code: $checkedConvert('code', (v) => v as String),
      pinyin: $checkedConvert('pinyin', (v) => v as String? ?? ''),
      initial: $checkedConvert('initial', (v) => v as String? ?? ''),
      latitude: $checkedConvert(
        'latitude',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
      longitude: $checkedConvert(
        'longitude',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
      isHot: $checkedConvert('is_hot', (v) => v as bool? ?? false),
      deviceCount: $checkedConvert(
        'device_count',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
    );
    return val;
  },
  fieldKeyMap: const {'isHot': 'is_hot', 'deviceCount': 'device_count'},
);

Map<String, dynamic> _$CityModelToJson(_CityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'pinyin': instance.pinyin,
      'initial': instance.initial,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'is_hot': instance.isHot,
      'device_count': instance.deviceCount,
    };
