import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_model.freezed.dart';
part 'community_model.g.dart';

/// 社群信息模型
@freezed
abstract class CommunityModel with _$CommunityModel {
  const factory CommunityModel({
    /// 社群ID
    required int id,

    /// 社群名称
    required String name,

    /// 社群封面图
    String? thumb,

    /// 社群描述
    String? description,

    /// 纬度
    required String latitude,

    /// 经度
    required String longitude,

    /// 距离（单位：m）
    required String distance,

    /// 距离（单位：km）
    @JsonKey(name: 'distance_km') required String distanceKm,

    /// 创建时间
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _CommunityModel;

  factory CommunityModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityModelFromJson(json);
}
