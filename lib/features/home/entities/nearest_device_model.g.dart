// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearest_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NearestDeviceModel _$NearestDeviceModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_NearestDeviceModel',
      json,
      ($checkedConvert) {
        final val = _NearestDeviceModel(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          distance: $checkedConvert('distance', (v) => v as String),
          distanceKm: $checkedConvert('distance_km', (v) => v as String),
          latitude: $checkedConvert('latitude', (v) => v as String),
          longitude: $checkedConvert('longitude', (v) => v as String),
          city: $checkedConvert(
            'city',
            (v) => NearestCity.fromJson(v as Map<String, dynamic>),
          ),
          streetAddress: $checkedConvert('street_address', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'distanceKm': 'distance_km',
        'streetAddress': 'street_address',
      },
    );

Map<String, dynamic> _$NearestDeviceModelToJson(_NearestDeviceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'distance': instance.distance,
      'distance_km': instance.distanceKm,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'city': instance.city.toJson(),
      'street_address': instance.streetAddress,
    };

_NearestCity _$NearestCityFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_NearestCity', json, ($checkedConvert) {
      final val = _NearestCity(
        name: $checkedConvert('name', (v) => v as String),
        code: $checkedConvert('code', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$NearestCityToJson(_NearestCity instance) =>
    <String, dynamic>{'name': instance.name, 'code': instance.code};
