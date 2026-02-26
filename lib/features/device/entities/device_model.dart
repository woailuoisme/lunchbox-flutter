import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/device/entities/device_status.dart';
import 'package:lunchbox/features/device/entities/location_model.dart';

part 'device_model.freezed.dart';
part 'device_model.g.dart';

/// Device data model
/// Used for data transfer and JSON serialization
@freezed
abstract class DeviceModel with _$DeviceModel {
  const factory DeviceModel({
    /// Unique device identifier
    required String id,

    /// Device name
    required String name,

    /// ID of the city where the device is located
    @JsonKey(name: 'city_id') required String cityId,

    /// Current operational status (as string for JSON)
    required String status,

    /// Geographic location of the device
    required LocationModel location,

    /// List of product IDs available in this device
    @JsonKey(name: 'product_ids') required List<String> productIds,

    /// Timestamp of the last update (as ISO 8601 string)
    @JsonKey(name: 'last_updated') required String lastUpdated,

    /// Distance from user (optional, from API)
    double? distance,

    /// Formatted distance text (optional, from API)
    @JsonKey(name: 'distance_text') String? distanceText,
  }) = _DeviceModel;

  /// Create DeviceModel from JSON
  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);

  const DeviceModel._();

  bool get isOnline => status == 'online';

  bool get supportMobilePayment => true;
  bool get supportCashPayment => true;

  String get address => location.address ?? '';

  /// Parse status string to DeviceStatus enum
  DeviceStatus _parseStatus(String status) {
    return DeviceStatus.values.firstWhere(
      (s) => s.name == status,
      orElse: () => DeviceStatus.offline,
    );
  }
}
