// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LocationModel', json, ($checkedConvert) {
      final val = _LocationModel(
        latitude: $checkedConvert(
          'latitude',
          (v) => (v as num?)?.toDouble() ?? 0.0,
        ),
        longitude: $checkedConvert(
          'longitude',
          (v) => (v as num?)?.toDouble() ?? 0.0,
        ),
        address: $checkedConvert('address', (v) => v as String? ?? ''),
      );
      return val;
    });

Map<String, dynamic> _$LocationModelToJson(_LocationModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': ?instance.address,
    };
