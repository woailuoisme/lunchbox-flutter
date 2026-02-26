import 'package:freezed_annotation/freezed_annotation.dart';

part 'points_record_model.freezed.dart';
part 'points_record_model.g.dart';

/// 积分记录模型
@freezed
abstract class PointsRecordModel with _$PointsRecordModel {
  const factory PointsRecordModel({
    /// 记录ID
    required String id,

    /// 标题/描述
    required String title,

    /// 变动积分 (正数表示获取，负数表示消耗)
    required int points,

    /// 记录日期
    required String date,

    /// 记录类型 (gain: 获取, use: 消耗)
    required String type,
  }) = _PointsRecordModel;

  factory PointsRecordModel.fromJson(Map<String, dynamic> json) =>
      _$PointsRecordModelFromJson(json);
}
