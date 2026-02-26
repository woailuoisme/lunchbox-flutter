import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_model.freezed.dart';
part 'community_model.g.dart';

/// 社群信息模型
@freezed
abstract class CommunityModel with _$CommunityModel {
  const factory CommunityModel({
    /// 社群ID
    required String id,

    /// 社群名称
    required String name,

    /// 社群描述
    required String description,

    /// 社群封面图
    required String coverUrl,

    /// 社群二维码链接
    required String qrCodeUrl,

    /// 成员数量
    @Default(0) int memberCount,

    /// 是否推荐
    @Default(false) bool isRecommended,
  }) = _CommunityModel;

  factory CommunityModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityModelFromJson(json);
}
