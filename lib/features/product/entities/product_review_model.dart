import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_review_model.freezed.dart';
part 'product_review_model.g.dart';

@freezed
sealed class ProductReviewModel with _$ProductReviewModel {
  const factory ProductReviewModel({
    /// 评价ID
    required String id,

    /// 商品ID
    @Default('') String productId,

    /// 用户ID
    @Default('') String userId,

    /// 用户昵称
    @Default('') String userName,

    /// 用户头像
    @Default('') String avatarUrl,

    /// 评分 (1-5)
    @Default(5.0) double rating,

    /// 评价内容
    @Default('') String content,

    /// 评价时间
    @JsonKey(name: 'created_at') @Default('') String createdAt,

    /// 评价图片列表
    @Default([]) List<String> images,
  }) = _ProductReviewModel;

  factory ProductReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewModelFromJson(json);
}
