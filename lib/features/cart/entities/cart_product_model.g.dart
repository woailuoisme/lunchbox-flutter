// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_CartProductModel',
      json,
      ($checkedConvert) {
        final val = _CartProductModel(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          price: $checkedConvert('price', (v) => _priceFromJson(v)),
          originalPrice: $checkedConvert(
            'original_price',
            (v) => _priceFromJson(v),
          ),
          imageUrl: $checkedConvert('thumb', (v) => v as String),
          stock: $checkedConvert('stock', (v) => (v as num?)?.toInt() ?? 0),
          type: $checkedConvert('type', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'originalPrice': 'original_price',
        'imageUrl': 'thumb',
      },
    );

Map<String, dynamic> _$CartProductModelToJson(_CartProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'original_price': ?instance.originalPrice,
      'thumb': instance.imageUrl,
      'stock': instance.stock,
      'type': instance.type,
    };
