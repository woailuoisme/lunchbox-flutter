// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mall_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MallProductModel _$MallProductModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_MallProductModel',
      json,
      ($checkedConvert) {
        final val = _MallProductModel(
          id: $checkedConvert('id', (v) => v as String),
          title: $checkedConvert('title', (v) => v as String),
          amountValue: $checkedConvert(
            'amount_value',
            (v) => (v as num).toInt(),
          ),
          pointsCost: $checkedConvert('points_cost', (v) => (v as num).toInt()),
          type: $checkedConvert('type', (v) => v as String),
          isHot: $checkedConvert('is_hot', (v) => v as bool? ?? false),
          image: $checkedConvert('image', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {
        'amountValue': 'amount_value',
        'pointsCost': 'points_cost',
        'isHot': 'is_hot',
      },
    );

Map<String, dynamic> _$MallProductModelToJson(_MallProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'amount_value': instance.amountValue,
      'points_cost': instance.pointsCost,
      'type': instance.type,
      'is_hot': instance.isHot,
      'image': instance.image,
    };
