import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommend_product_model.freezed.dart';
part 'recommend_product_model.g.dart';

@freezed
abstract class RecommendProductModel with _$RecommendProductModel {
  const factory RecommendProductModel({
    required int id,
    required String name,
    required String image,
    required String category,
    required String price,
    @JsonKey(name: 'original_price') String? originalPrice,
    @Default([]) List<String> tags,
  }) = _RecommendProductModel;

  factory RecommendProductModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendProductModelFromJson(json);
}
