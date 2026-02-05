import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

/// Location domain entity
/// Represents a geographic location with coordinates and optional address
@freezed
abstract class Location with _$Location {
  const factory Location({
    /// Latitude coordinate
    required double latitude,

    /// Longitude coordinate
    required double longitude,

    /// Optional address description
    String? address,
  }) = _Location;
}
