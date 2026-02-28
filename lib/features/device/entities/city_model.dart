import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

/// 城市模型
@freezed
sealed class CityModel with _$CityModel {
  const factory CityModel({
    /// 城市代码 (如: "440100")
    required String code,

    /// 城市名称 (如: "广州市")
    @Default('') String name,

    /// 省份代码 (如: "44")
    @Default('') String province,

    /// 城市短码 (如: "01")
    @Default('') String city,

    /// 城市下的设备数量
    @Default(0) int count,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
