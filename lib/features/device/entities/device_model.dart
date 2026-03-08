import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_model.freezed.dart';
part 'device_model.g.dart';

/// 设备模型
@freezed
sealed class DeviceModel with _$DeviceModel {
  const factory DeviceModel({
    /// 设备ID
    required int id,

    /// 设备编号
    @Default('') String no,

    /// 设备名称
    @Default('') String name,

    /// 是否启用
    @JsonKey(name: 'is_enabled') @Default(true) bool isEnabled,

    /// 距离 (如: "48880.04m")
    @Default('') String? distance,

    /// 距离公里 (如: "48.88km")
    @JsonKey(name: 'distance_km') @Default('') String? distanceKm,

    /// 经度
    @Default('') String longitude,

    /// 纬度
    @Default('') String latitude,

    /// 街道地址
    @JsonKey(name: 'street_address') @Default('') String streetAddress,

    /// 完整地址
    @JsonKey(name: 'full_address') @Default('') String fullAddress,

    /// 营业时间
    @JsonKey(name: 'business_hours') @Default('') String businessHours,

    /// 图片URL
    @JsonKey(name: 'image_url') @Default('') String imageUrl,

    /// 城市信息
    @Default(DeviceCityModel(id: '', name: '')) DeviceCityModel city,
  }) = _DeviceModel;

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);
}

extension DeviceModelX on DeviceModel {
  /// 获取数值型距离（用于排序）
  double get numericalDistance {
    final kmText = distanceKm ?? distance;
    if (kmText == null || kmText.isEmpty) {
      return double.infinity;
    }

    final match = RegExp(r'[\d.]+').firstMatch(kmText);
    if (match == null) {
      return double.infinity;
    }

    final valueString = match.group(0);
    if (valueString == null) {
      return double.infinity;
    }

    final value = double.tryParse(valueString);
    if (value == null) {
      return double.infinity;
    }

    // 如果单位是 m，则转换为 km
    if (kmText.toLowerCase().contains('m') &&
        !kmText.toLowerCase().contains('km')) {
      return value / 1000;
    }

    return value;
  }
}

/// 设备所属城市简要模型
@freezed
sealed class DeviceCityModel with _$DeviceCityModel {
  const factory DeviceCityModel({
    /// 城市ID/代码
    required String id,

    /// 城市名称
    @Default('') String name,
  }) = _DeviceCityModel;

  factory DeviceCityModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceCityModelFromJson(json);
}
