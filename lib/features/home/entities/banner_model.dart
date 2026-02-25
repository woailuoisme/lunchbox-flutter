import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

@freezed
abstract class BannerModel with _$BannerModel {
  const factory BannerModel({
    required int id,
    required String title,
    required String type,
    String? mpPage,
    required String thumb,
    required ThumbMedia thumbMedia,
    required int order,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}

@freezed
abstract class ThumbMedia with _$ThumbMedia {
  const factory ThumbMedia({required String thumbnail, required String webp}) =
      _ThumbMedia;

  factory ThumbMedia.fromJson(Map<String, dynamic> json) =>
      _$ThumbMediaFromJson(json);
}
