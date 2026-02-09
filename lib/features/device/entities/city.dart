import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.freezed.dart';

/// City domain entity
/// Pure business object representing a city in the lunchbox vending machine system
@freezed
abstract class City with _$City {
  const factory City({
    /// Unique identifier for the city
    required String id,

    /// Name of the city
    required String name,

    /// City code (e.g., "BJ" for Beijing)
    required String code,

    /// Number of devices in this city
    required int deviceCount,
  }) = _City;
}
