// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryProductModel _$CategoryProductModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CategoryProductModel', json, ($checkedConvert) {
  final val = _CategoryProductModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String? ?? ''),
    thumb: $checkedConvert('thumb', (v) => v as String? ?? ''),
    order: $checkedConvert('order', (v) => (v as num?)?.toInt() ?? 0),
    products: $checkedConvert(
      'products',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
  );
  return val;
});

Map<String, dynamic> _$CategoryProductModelToJson(
  _CategoryProductModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'thumb': instance.thumb,
  'order': instance.order,
  'products': instance.products.map((e) => e.toJson()).toList(),
};

_ProductModel _$ProductModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_ProductModel',
  json,
  ($checkedConvert) {
    final val = _ProductModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String? ?? ''),
      description: $checkedConvert('description', (v) => v as String? ?? ''),
      price: $checkedConvert(
        'price',
        (v) => v == null ? 0.0 : _priceFromJson(v),
      ),
      originalPrice: $checkedConvert(
        'original_price',
        (v) => _priceFromJson(v),
      ),
      costPrice: $checkedConvert('cost_price', (v) => _priceFromJson(v)),
      netProfit: $checkedConvert('net_profit', (v) => _priceFromJson(v)),
      sales: $checkedConvert('sales', (v) => (v as num?)?.toInt() ?? 0),
      type: $checkedConvert('type', (v) => v as String? ?? ''),
      dailyLimit: $checkedConvert('daily_limit', (v) => (v as num?)?.toInt()),
      imageUrl: $checkedConvert('thumb', (v) => v as String? ?? ''),
      inventory: $checkedConvert(
        'inventory',
        (v) => v == null
            ? null
            : ProductInventory.fromJson(v as Map<String, dynamic>),
      ),
      createdAt: $checkedConvert('created_at', (v) => v as String?),
      isHot: $checkedConvert('is_hot', (v) => v as bool? ?? false),
      isPromotion: $checkedConvert('is_promotion', (v) => v as bool? ?? false),
    );
    return val;
  },
  fieldKeyMap: const {
    'originalPrice': 'original_price',
    'costPrice': 'cost_price',
    'netProfit': 'net_profit',
    'dailyLimit': 'daily_limit',
    'imageUrl': 'thumb',
    'createdAt': 'created_at',
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
      'original_price': ?instance.originalPrice,
      'cost_price': ?instance.costPrice,
      'net_profit': ?instance.netProfit,
      'sales': instance.sales,
      'type': instance.type,
      'daily_limit': ?instance.dailyLimit,
      'thumb': instance.imageUrl,
      'inventory': ?instance.inventory?.toJson(),
      'created_at': ?instance.createdAt,
      'is_hot': instance.isHot,
      'is_promotion': instance.isPromotion,
    };

_ProductInventory _$ProductInventoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ProductInventory', json, ($checkedConvert) {
      final val = _ProductInventory(
        no: $checkedConvert('no', (v) => v as String? ?? ''),
        productCount: $checkedConvert(
          'product_count',
          (v) => (v as num?)?.toInt() ?? 0,
        ),
      );
      return val;
    }, fieldKeyMap: const {'productCount': 'product_count'});

Map<String, dynamic> _$ProductInventoryToJson(_ProductInventory instance) =>
    <String, dynamic>{
      'no': instance.no,
      'product_count': instance.productCount,
    };
