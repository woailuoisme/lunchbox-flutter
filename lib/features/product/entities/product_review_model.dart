import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_review_model.freezed.dart';
part 'product_review_model.g.dart';

@freezed
abstract class ProductReviewModel with _$ProductReviewModel {
  const factory ProductReviewModel({
    /// 评价ID
    required String id,

    /// 商品ID
    required String productId,

    /// 用户ID
    required String userId,

    /// 用户昵称
    required String userName,

    /// 用户头像
    String? avatarUrl,

    /// 评分 (1-5)
    required double rating,

    /// 评价内容
    required String content,

    /// 评价时间
    required DateTime createdAt,

    /// 评价图片列表
    List<String>? images,
  }) = _ProductReviewModel;

  factory ProductReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewModelFromJson(json);
}
