// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_CartItemModel',
      json,
      ($checkedConvert) {
        final val = _CartItemModel(
          id: $checkedConvert('id', (v) => v as String),
          productId: $checkedConvert('product_id', (v) => v as String),
          product: $checkedConvert(
            'product',
            (v) => CartProductModel.fromJson(v as Map<String, dynamic>),
          ),
          addedTime: $checkedConvert(
            'added_time',
            (v) => DateTime.parse(v as String),
          ),
          quantity: $checkedConvert(
            'quantity',
            (v) => (v as num?)?.toInt() ?? 1,
          ),
          isSelected: $checkedConvert('is_selected', (v) => v as bool? ?? true),
          deviceId: $checkedConvert('device_id', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'productId': 'product_id',
        'addedTime': 'added_time',
        'isSelected': 'is_selected',
        'deviceId': 'device_id',
      },
    );

Map<String, dynamic> _$CartItemModelToJson(_CartItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product': instance.product.toJson(),
      'added_time': instance.addedTime.toIso8601String(),
      'quantity': instance.quantity,
      'is_selected': instance.isSelected,
      'device_id': ?instance.deviceId,
    };
