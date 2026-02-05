import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/device/entities/device_status.dart';
import 'package:lunchbox/features/device/entities/location.dart';

part 'device.freezed.dart';

/// Device domain entity
/// Represents a physical vending machine in the system
@freezed
abstract class Device with _$Device {
  const factory Device({
    /// Unique device identifier
    required String id,

    /// Device name
    required String name,

    /// ID of the city where the device is located
    required String cityId,

    /// Current operational status of the device
    required DeviceStatus status,

    /// Geographic location of the device
    required Location location,

    /// List of product IDs available in this device
    required List<String> productIds,

    /// Timestamp of the last update
    required DateTime lastUpdated,
  }) = _Device;
}
