import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_review_response.freezed.dart';
part 'order_review_response.g.dart';

@freezed
sealed class OrderReviewResponse with _$OrderReviewResponse {
  const factory OrderReviewResponse({
    required int id,
    required String content,
    required String rating,
    @JsonKey(name: 'rating_stars') required String ratingStars,
    required String status,
    @JsonKey(name: 'likes_count') required int likesCount,
    @JsonKey(name: 'is_liked') required bool isLiked,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'created_at_human') required String createdAtHuman,
  }) = _OrderReviewResponse;

  factory OrderReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderReviewResponseFromJson(json);
}
