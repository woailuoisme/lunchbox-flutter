// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductDetailModel _$ProductDetailModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_ProductDetailModel',
  json,
  ($checkedConvert) {
    final val = _ProductDetailModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String? ?? ''),
      description: $checkedConvert('description', (v) => v as String? ?? ''),
      imageUrl: $checkedConvert('thumb', (v) => v as String? ?? ''),
      content: $checkedConvert('content', (v) => v as String? ?? ''),
      price: $checkedConvert(
        'price',
        (v) => v == null ? 0.0 : _priceFromJson(v),
      ),
      originalPrice: $checkedConvert(
        'original_price',
        (v) => v == null ? 0.0 : _priceFromJson(v),
      ),
      costPrice: $checkedConvert(
        'cost_price',
        (v) => v == null ? 0.0 : _priceFromJson(v),
      ),
      netProfit: $checkedConvert(
        'net_profit',
        (v) => v == null ? 0.0 : _priceFromJson(v),
      ),
      shelfLife: $checkedConvert(
        'shelf_life',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      sales: $checkedConvert('sales', (v) => (v as num?)?.toInt() ?? 0),
      heatingTime: $checkedConvert(
        'heating_time',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      type: $checkedConvert('type', (v) => v as String? ?? 'food'),
      sauceId: $checkedConvert('sauce_id', (v) => (v as num?)?.toInt() ?? 0),
      weigh: $checkedConvert('weigh', (v) => (v as num?)?.toInt() ?? 0),
      dailyLimit: $checkedConvert(
        'daily_limit',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      spec: $checkedConvert('spec', (v) => v as String? ?? ''),
      supplyChain: $checkedConvert('supply_chain', (v) => v as String? ?? ''),
      isEnabled: $checkedConvert('is_enabled', (v) => v as bool? ?? true),
      timeDiscount: $checkedConvert('time_discount', (v) => v as String? ?? ''),
      category: $checkedConvert(
        'category',
        (v) => v == null
            ? null
            : ProductDetailCategory.fromJson(v as Map<String, dynamic>),
      ),
      comments: $checkedConvert(
        'comments',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) =>
                      ProductDetailComment.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            const [],
      ),
      media: $checkedConvert(
        'media',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => ProductDetailMedia.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            const [],
      ),
      createdAt: $checkedConvert('created_at', (v) => v as String? ?? ''),
      updatedAt: $checkedConvert('updated_at', (v) => v as String? ?? ''),
    );
    return val;
  },
  fieldKeyMap: const {
    'imageUrl': 'thumb',
    'originalPrice': 'original_price',
    'costPrice': 'cost_price',
    'netProfit': 'net_profit',
    'shelfLife': 'shelf_life',
    'heatingTime': 'heating_time',
    'sauceId': 'sauce_id',
    'dailyLimit': 'daily_limit',
    'supplyChain': 'supply_chain',
    'isEnabled': 'is_enabled',
    'timeDiscount': 'time_discount',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$ProductDetailModelToJson(_ProductDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'thumb': instance.imageUrl,
      'content': instance.content,
      'price': instance.price,
      'original_price': ?instance.originalPrice,
      'cost_price': ?instance.costPrice,
      'net_profit': ?instance.netProfit,
      'shelf_life': ?instance.shelfLife,
      'sales': instance.sales,
      'heating_time': ?instance.heatingTime,
      'type': instance.type,
      'sauce_id': ?instance.sauceId,
      'weigh': ?instance.weigh,
      'daily_limit': ?instance.dailyLimit,
      'spec': ?instance.spec,
      'supply_chain': ?instance.supplyChain,
      'is_enabled': instance.isEnabled,
      'time_discount': ?instance.timeDiscount,
      'category': ?instance.category?.toJson(),
      'comments': instance.comments.map((e) => e.toJson()).toList(),
      'media': instance.media.map((e) => e.toJson()).toList(),
      'created_at': ?instance.createdAt,
      'updated_at': ?instance.updatedAt,
    };

_ProductDetailCategory _$ProductDetailCategoryFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ProductDetailCategory', json, ($checkedConvert) {
  final val = _ProductDetailCategory(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String? ?? ''),
  );
  return val;
});

Map<String, dynamic> _$ProductDetailCategoryToJson(
  _ProductDetailCategory instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

_ProductDetailComment _$ProductDetailCommentFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_ProductDetailComment',
  json,
  ($checkedConvert) {
    final val = _ProductDetailComment(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      content: $checkedConvert('content', (v) => v as String? ?? ''),
      rating: $checkedConvert('rating', (v) => (v as num?)?.toInt() ?? 5),
      ratingStars: $checkedConvert('rating_stars', (v) => v as String? ?? ''),
      status: $checkedConvert('status', (v) => v as String? ?? ''),
      likesCount: $checkedConvert(
        'likes_count',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      isLiked: $checkedConvert('is_liked', (v) => v as bool? ?? false),
      user: $checkedConvert(
        'user',
        (v) => v == null
            ? const ProductDetailUser(id: 0)
            : ProductDetailUser.fromJson(v as Map<String, dynamic>),
      ),
      createdAt: $checkedConvert('created_at', (v) => v as String? ?? ''),
      updatedAt: $checkedConvert('updated_at', (v) => v as String? ?? ''),
      createdAtHuman: $checkedConvert(
        'created_at_human',
        (v) => v as String? ?? '',
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'ratingStars': 'rating_stars',
    'likesCount': 'likes_count',
    'isLiked': 'is_liked',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
    'createdAtHuman': 'created_at_human',
  },
);

Map<String, dynamic> _$ProductDetailCommentToJson(
  _ProductDetailComment instance,
) => <String, dynamic>{
  'id': instance.id,
  'content': instance.content,
  'rating': instance.rating,
  'rating_stars': instance.ratingStars,
  'status': instance.status,
  'likes_count': instance.likesCount,
  'is_liked': instance.isLiked,
  'user': instance.user.toJson(),
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'created_at_human': instance.createdAtHuman,
};

_ProductDetailUser _$ProductDetailUserFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ProductDetailUser', json, ($checkedConvert) {
      final val = _ProductDetailUser(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String? ?? ''),
        avatar: $checkedConvert('avatar', (v) => v as String? ?? ''),
      );
      return val;
    });

Map<String, dynamic> _$ProductDetailUserToJson(_ProductDetailUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };

_ProductDetailMedia _$ProductDetailMediaFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ProductDetailMedia', json, ($checkedConvert) {
      final val = _ProductDetailMedia(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        url: $checkedConvert('url', (v) => v as String? ?? ''),
      );
      return val;
    });

Map<String, dynamic> _$ProductDetailMediaToJson(_ProductDetailMedia instance) =>
    <String, dynamic>{'id': instance.id, 'url': instance.url};
