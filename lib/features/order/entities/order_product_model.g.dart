// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderProductModel _$OrderProductModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_OrderProductModel', json, ($checkedConvert) {
      final val = _OrderProductModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        category: $checkedConvert('category', (v) => v as String),
        thumb: $checkedConvert('thumb', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
        salePrice: $checkedConvert('sale_price', (v) => v as String),
        quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
      );
      return val;
    }, fieldKeyMap: const {'salePrice': 'sale_price'});

Map<String, dynamic> _$OrderProductModelToJson(_OrderProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'thumb': instance.thumb,
      'description': instance.description,
      'sale_price': instance.salePrice,
      'quantity': instance.quantity,
    };
