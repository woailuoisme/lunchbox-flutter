import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

/// 城市模型
@freezed
abstract class CityModel with _$CityModel {
  const factory CityModel({
    /// 城市代码 (如: "440100")
    required String code,

    /// 城市名称 (如: "广州市")
    required String name,

    /// 省份代码 (如: "44")
    required String province,

    /// 城市短码 (如: "01")
    required String city,

    /// 城市下的设备数量
    required int count,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
