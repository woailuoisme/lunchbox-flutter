import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/device/entities/city.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

/// City data model
/// Used for data transfer with JSON serialization support
@freezed
abstract class CityModel with _$CityModel {
  const factory CityModel({
    /// Unique identifier for the city
    required String id,

    /// Name of the city
    required String name,

    /// City code (e.g., "BJ" for Beijing)
    required String code,

    /// Number of devices in this city
    @JsonKey(name: 'device_count') required int deviceCount,
  }) = _CityModel;

  /// Create CityModel from JSON
  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  const CityModel._();

  /// Convert data model to domain entity
  City toEntity() =>
      City(id: id, name: name, code: code, deviceCount: deviceCount);
}
