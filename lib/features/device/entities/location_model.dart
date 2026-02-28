import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

/// Location data model
/// Used for data transfer and JSON serialization
@freezed
sealed class LocationModel with _$LocationModel {
  const factory LocationModel({
    /// Latitude coordinate
    @Default(0.0) double latitude,

    /// Longitude coordinate
    @Default(0.0) double longitude,

    /// Optional address description
    @Default('') String? address,
  }) = _LocationModel;

  /// Create LocationModel from JSON
  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  const LocationModel._();
}
