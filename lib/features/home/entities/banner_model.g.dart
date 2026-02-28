// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_BannerModel',
  json,
  ($checkedConvert) {
    final val = _BannerModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      title: $checkedConvert('title', (v) => v as String? ?? ''),
      type: $checkedConvert('type', (v) => v as String? ?? ''),
      mpPage: $checkedConvert('mp_page', (v) => v as String? ?? ''),
      thumb: $checkedConvert('thumb', (v) => v as String? ?? ''),
      thumbMedia: $checkedConvert(
        'thumb_media',
        (v) => v == null
            ? const ThumbMedia(thumbnail: '', webp: '')
            : ThumbMedia.fromJson(v as Map<String, dynamic>),
      ),
      order: $checkedConvert('order', (v) => (v as num?)?.toInt() ?? 0),
    );
    return val;
  },
  fieldKeyMap: const {'mpPage': 'mp_page', 'thumbMedia': 'thumb_media'},
);

Map<String, dynamic> _$BannerModelToJson(_BannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'mp_page': ?instance.mpPage,
      'thumb': instance.thumb,
      'thumb_media': instance.thumbMedia.toJson(),
      'order': instance.order,
    };

_ThumbMedia _$ThumbMediaFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ThumbMedia', json, ($checkedConvert) {
      final val = _ThumbMedia(
        thumbnail: $checkedConvert('thumbnail', (v) => v as String? ?? ''),
        webp: $checkedConvert('webp', (v) => v as String? ?? ''),
      );
      return val;
    });

Map<String, dynamic> _$ThumbMediaToJson(_ThumbMedia instance) =>
    <String, dynamic>{'thumbnail': instance.thumbnail, 'webp': instance.webp};
