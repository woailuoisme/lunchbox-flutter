// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderReviewResponse _$OrderReviewResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_OrderReviewResponse',
      json,
      ($checkedConvert) {
        final val = _OrderReviewResponse(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          content: $checkedConvert('content', (v) => v as String),
          rating: $checkedConvert('rating', (v) => v as String),
          ratingStars: $checkedConvert('rating_stars', (v) => v as String),
          status: $checkedConvert('status', (v) => v as String),
          likesCount: $checkedConvert('likes_count', (v) => (v as num).toInt()),
          isLiked: $checkedConvert('is_liked', (v) => v as bool),
          createdAt: $checkedConvert('created_at', (v) => v as String),
          updatedAt: $checkedConvert('updated_at', (v) => v as String),
          createdAtHuman: $checkedConvert(
            'created_at_human',
            (v) => v as String,
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

Map<String, dynamic> _$OrderReviewResponseToJson(
  _OrderReviewResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'content': instance.content,
  'rating': instance.rating,
  'rating_stars': instance.ratingStars,
  'status': instance.status,
  'likes_count': instance.likesCount,
  'is_liked': instance.isLiked,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'created_at_human': instance.createdAtHuman,
};
