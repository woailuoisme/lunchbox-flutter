import 'package:freezed_annotation/freezed_annotation.dart';
import 'location.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

/// Location data model
/// Used for data transfer and JSON serialization
@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    /// Latitude coordinate
    required double latitude,

    /// Longitude coordinate
    required double longitude,

    /// Optional address description
    String? address,
  }) = _LocationModel;

  /// Create LocationModel from JSON
  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  const LocationModel._();

  /// Convert LocationModel to Location domain entity
  Location toEntity() =>
      Location(latitude: latitude, longitude: longitude, address: address);
}
