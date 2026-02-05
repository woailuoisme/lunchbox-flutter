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
      id: $checkedConvert('id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      cityId: $checkedConvert('city_id', (v) => v as String),
      status: $checkedConvert('status', (v) => v as String),
      location: $checkedConvert(
        'location',
        (v) => LocationModel.fromJson(v as Map<String, dynamic>),
      ),
      productIds: $checkedConvert(
        'product_ids',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      lastUpdated: $checkedConvert('last_updated', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'cityId': 'city_id',
    'productIds': 'product_ids',
    'lastUpdated': 'last_updated',
  },
);

Map<String, dynamic> _$DeviceModelToJson(_DeviceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city_id': instance.cityId,
      'status': instance.status,
      'location': instance.location.toJson(),
      'product_ids': instance.productIds,
      'last_updated': instance.lastUpdated,
    };
