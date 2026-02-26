import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_model.freezed.dart';
part 'device_model.g.dart';

/// 设备模型
@freezed
abstract class DeviceModel with _$DeviceModel {
  const factory DeviceModel({
    /// 设备ID
    required int id,

    /// 设备编号
    required String no,

    /// 设备名称
    required String name,

    /// 是否启用
    @JsonKey(name: 'is_enabled') required bool isEnabled,

    /// 距离 (如: "48880.04m")
    String? distance,

    /// 距离公里 (如: "48.88km")
    @JsonKey(name: 'distance_km') String? distanceKm,

    /// 经度
    required String longitude,

    /// 纬度
    required String latitude,

    /// 街道地址
    @JsonKey(name: 'street_address') required String streetAddress,

    /// 完整地址
    @JsonKey(name: 'full_address') required String fullAddress,

    /// 营业时间
    @JsonKey(name: 'business_hours') required String businessHours,

    /// 图片URL
    @JsonKey(name: 'image_url') required String imageUrl,

    /// 城市信息
    required DeviceCityModel city,
  }) = _DeviceModel;

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);
}

/// 设备所属城市简要模型
@freezed
abstract class DeviceCityModel with _$DeviceCityModel {
  const factory DeviceCityModel({
    /// 城市ID/代码
    required String id,

    /// 城市名称
    required String name,
  }) = _DeviceCityModel;

  factory DeviceCityModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceCityModelFromJson(json);
}
