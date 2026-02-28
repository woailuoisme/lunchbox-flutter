// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductReviewModel _$ProductReviewModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_ProductReviewModel',
  json,
  ($checkedConvert) {
    final val = _ProductReviewModel(
      id: $checkedConvert('id', (v) => v as String),
      productId: $checkedConvert('product_id', (v) => v as String? ?? ''),
      userId: $checkedConvert('user_id', (v) => v as String? ?? ''),
      userName: $checkedConvert('user_name', (v) => v as String? ?? ''),
      avatarUrl: $checkedConvert('avatar_url', (v) => v as String? ?? ''),
      rating: $checkedConvert('rating', (v) => (v as num?)?.toDouble() ?? 5.0),
      content: $checkedConvert('content', (v) => v as String? ?? ''),
      createdAt: $checkedConvert('created_at', (v) => v as String? ?? ''),
      images: $checkedConvert(
        'images',
        (v) =>
            (v as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'productId': 'product_id',
    'userId': 'user_id',
    'userName': 'user_name',
    'avatarUrl': 'avatar_url',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$ProductReviewModelToJson(_ProductReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'avatar_url': instance.avatarUrl,
      'rating': instance.rating,
      'content': instance.content,
      'created_at': instance.createdAt,
      'images': instance.images,
    };
