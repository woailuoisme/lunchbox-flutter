// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommunityModel _$CommunityModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_CommunityModel',
      json,
      ($checkedConvert) {
        final val = _CommunityModel(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          coverUrl: $checkedConvert('cover_url', (v) => v as String),
          qrCodeUrl: $checkedConvert('qr_code_url', (v) => v as String),
          memberCount: $checkedConvert(
            'member_count',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
          isRecommended: $checkedConvert(
            'is_recommended',
            (v) => v as bool? ?? false,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'coverUrl': 'cover_url',
        'qrCodeUrl': 'qr_code_url',
        'memberCount': 'member_count',
        'isRecommended': 'is_recommended',
      },
    );

Map<String, dynamic> _$CommunityModelToJson(_CommunityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'cover_url': instance.coverUrl,
      'qr_code_url': instance.qrCodeUrl,
      'member_count': instance.memberCount,
      'is_recommended': instance.isRecommended,
    };
