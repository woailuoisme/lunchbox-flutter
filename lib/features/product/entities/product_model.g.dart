// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_ProductModel',
  json,
  ($checkedConvert) {
    final val = _ProductModel(
      id: $checkedConvert('id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String),
      price: $checkedConvert('price', (v) => (v as num).toDouble()),
      imageUrl: $checkedConvert('image_url', (v) => v as String),
      updateTime: $checkedConvert(
        'update_time',
        (v) => DateTime.parse(v as String),
      ),
      originalPrice: $checkedConvert(
        'original_price',
        (v) => (v as num?)?.toDouble(),
      ),
      stock: $checkedConvert('stock', (v) => (v as num?)?.toInt() ?? 0),
      category: $checkedConvert('category', (v) => v as String? ?? 'food'),
      isAvailable: $checkedConvert('is_available', (v) => v as bool? ?? true),
      isHot: $checkedConvert('is_hot', (v) => v as bool? ?? false),
      isPromotion: $checkedConvert('is_promotion', (v) => v as bool? ?? false),
      specifications: $checkedConvert('specifications', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'imageUrl': 'image_url',
    'updateTime': 'update_time',
    'originalPrice': 'original_price',
    'isAvailable': 'is_available',
    'isHot': 'is_hot',
    'isPromotion': 'is_promotion',
  },
);

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'image_url': instance.imageUrl,
      'update_time': instance.updateTime.toIso8601String(),
      'original_price': ?instance.originalPrice,
      'stock': instance.stock,
      'category': instance.category,
      'is_available': instance.isAvailable,
      'is_hot': instance.isHot,
      'is_promotion': instance.isPromotion,
      'specifications': ?instance.specifications,
    };
