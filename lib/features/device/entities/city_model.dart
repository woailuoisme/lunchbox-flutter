import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

/// City model
/// Domain entity representing a city in the lunchbox vending machine system
@freezed
abstract class CityModel with _$CityModel {
  const factory CityModel({
    /// Unique identifier for the city
    required String id,

    /// Name of the city
    required String name,

    /// City code (e.g., "BJ" for Beijing)
    required String code,

    /// Pin yin for the city name
    @Default('') String pinyin,

    /// Initial letter of the city name
    @Default('') String initial,

    /// City latitude
    @Default(0.0) double latitude,

    /// City longitude
    @Default(0.0) double longitude,

    /// Whether this is a hot city
    @Default(false) bool isHot,

    /// Number of devices in this city
    @JsonKey(name: 'device_count') @Default(0) int deviceCount,
  }) = _CityModel;

  /// Create CityModel from JSON
  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  const CityModel._();
}
