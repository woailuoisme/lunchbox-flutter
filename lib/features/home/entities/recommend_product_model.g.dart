// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecommendProductModel _$RecommendProductModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_RecommendProductModel',
  json,
  ($checkedConvert) {
    final val = _RecommendProductModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      image: $checkedConvert('image', (v) => v as String),
      category: $checkedConvert('category', (v) => v as String),
      price: $checkedConvert('price', (v) => v as String),
      originalPrice: $checkedConvert('original_price', (v) => v as String?),
      tags: $checkedConvert(
        'tags',
        (v) =>
            (v as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
      ),
    );
    return val;
  },
  fieldKeyMap: const {'originalPrice': 'original_price'},
);

Map<String, dynamic> _$RecommendProductModelToJson(
  _RecommendProductModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'category': instance.category,
  'price': instance.price,
  'original_price': ?instance.originalPrice,
  'tags': instance.tags,
};
