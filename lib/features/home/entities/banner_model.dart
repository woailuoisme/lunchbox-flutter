import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

@freezed
sealed class BannerModel with _$BannerModel {
  const factory BannerModel({
    required int id,
    @Default('') String title,
    @Default('') String type,
    @Default('') String? mpPage,
    @Default('') String thumb,
    @Default(ThumbMedia(thumbnail: '', webp: '')) ThumbMedia thumbMedia,
    @Default(0) int order,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}

@freezed
sealed class ThumbMedia with _$ThumbMedia {
  const factory ThumbMedia({
    @Default('') String thumbnail,
    @Default('') String webp,
  }) = _ThumbMedia;

  factory ThumbMedia.fromJson(Map<String, dynamic> json) =>
      _$ThumbMediaFromJson(json);
}
