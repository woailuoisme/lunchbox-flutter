// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_DeviceModel',
  json,
  ($checkedConvert) {
    final val = _DeviceModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      no: $checkedConvert('no', (v) => v as String? ?? ''),
      name: $checkedConvert('name', (v) => v as String? ?? ''),
      isEnabled: $checkedConvert('is_enabled', (v) => v as bool? ?? true),
      distance: $checkedConvert('distance', (v) => v as String? ?? ''),
      distanceKm: $checkedConvert('distance_km', (v) => v as String? ?? ''),
      longitude: $checkedConvert('longitude', (v) => v as String? ?? ''),
      latitude: $checkedConvert('latitude', (v) => v as String? ?? ''),
      streetAddress: $checkedConvert(
        'street_address',
        (v) => v as String? ?? '',
      ),
      fullAddress: $checkedConvert('full_address', (v) => v as String? ?? ''),
      businessHours: $checkedConvert(
        'business_hours',
        (v) => v as String? ?? '',
      ),
      imageUrl: $checkedConvert('image_url', (v) => v as String? ?? ''),
      city: $checkedConvert(
        'city',
        (v) => v == null
            ? const DeviceCityModel(id: '', name: '')
            : DeviceCityModel.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'isEnabled': 'is_enabled',
    'distanceKm': 'distance_km',
    'streetAddress': 'street_address',
    'fullAddress': 'full_address',
    'businessHours': 'business_hours',
    'imageUrl': 'image_url',
  },
);

Map<String, dynamic> _$DeviceModelToJson(_DeviceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no': instance.no,
      'name': instance.name,
      'is_enabled': instance.isEnabled,
      'distance': ?instance.distance,
      'distance_km': ?instance.distanceKm,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'street_address': instance.streetAddress,
      'full_address': instance.fullAddress,
      'business_hours': instance.businessHours,
      'image_url': instance.imageUrl,
      'city': instance.city.toJson(),
    };

_DeviceCityModel _$DeviceCityModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DeviceCityModel', json, ($checkedConvert) {
      final val = _DeviceCityModel(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String? ?? ''),
      );
      return val;
    });

Map<String, dynamic> _$DeviceCityModelToJson(_DeviceCityModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
