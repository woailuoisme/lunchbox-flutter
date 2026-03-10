// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mall_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MallProductResponse _$MallProductResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_MallProductResponse',
      json,
      ($checkedConvert) {
        final val = _MallProductResponse(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String? ?? ''),
          requiredPoints: $checkedConvert(
            'required_points',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
          stock: $checkedConvert('stock', (v) => (v as num?)?.toInt()),
          isActive: $checkedConvert('is_active', (v) => v as bool? ?? false),
          type: $checkedConvert('type', (v) => v as String? ?? ''),
          typeLabel: $checkedConvert('type_label', (v) => v as String? ?? ''),
          content: $checkedConvert('content', (v) => v as String? ?? ''),
          rules: $checkedConvert(
            'rules',
            (v) => v as Map<String, dynamic>? ?? const {},
          ),
          isAvailable: $checkedConvert(
            'is_available',
            (v) => v as bool? ?? false,
          ),
          createdAt: $checkedConvert('created_at', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {
        'requiredPoints': 'required_points',
        'isActive': 'is_active',
        'typeLabel': 'type_label',
        'isAvailable': 'is_available',
        'createdAt': 'created_at',
      },
    );

Map<String, dynamic> _$MallProductResponseToJson(
  _MallProductResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'required_points': instance.requiredPoints,
  'stock': ?instance.stock,
  'is_active': instance.isActive,
  'type': instance.type,
  'type_label': instance.typeLabel,
  'content': instance.content,
  'rules': instance.rules,
  'is_available': instance.isAvailable,
  'created_at': instance.createdAt,
};
