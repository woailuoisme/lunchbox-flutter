import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommend_product_model.freezed.dart';
part 'recommend_product_model.g.dart';

@freezed
sealed class RecommendProductModel with _$RecommendProductModel {
  const factory RecommendProductModel({
    required int id,
    @Default('') String name,
    @Default('') String image,
    @Default('') String category,
    @Default('') String price,
    @JsonKey(name: 'original_price') @Default('') String? originalPrice,
    @Default([]) List<String> tags,
  }) = _RecommendProductModel;

  factory RecommendProductModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendProductModelFromJson(json);
}
