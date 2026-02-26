// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommunityModel _$CommunityModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_CommunityModel',
      json,
      ($checkedConvert) {
        final val = _CommunityModel(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          thumb: $checkedConvert('thumb', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          latitude: $checkedConvert('latitude', (v) => v as String),
          longitude: $checkedConvert('longitude', (v) => v as String),
          distance: $checkedConvert('distance', (v) => v as String),
          distanceKm: $checkedConvert('distance_km', (v) => v as String),
          createdAt: $checkedConvert('created_at', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'distanceKm': 'distance_km',
        'createdAt': 'created_at',
      },
    );

Map<String, dynamic> _$CommunityModelToJson(_CommunityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumb': ?instance.thumb,
      'description': ?instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'distance': instance.distance,
      'distance_km': instance.distanceKm,
      'created_at': instance.createdAt,
    };
