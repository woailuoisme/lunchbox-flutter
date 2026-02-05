import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lunchbox/features/device/entities/device_model.dart';
import 'package:lunchbox/features/device/entities/location_model.dart';
import 'package:lunchbox/features/device/providers/device_providers.dart';

void main() {
  const tLocationModel = LocationModel(
    latitude: 31.2304,
    longitude: 121.4737,
    address: 'Shanghai',
  );

  const tDevice1 = DeviceModel(
    id: 'd1',
    name: 'Device 1',
    cityId: 'c1',
    status: 'online',
    location: tLocationModel,
    productIds: ['p1'],
    lastUpdated: '2023-01-01T12:00:00.000',
  );

  const tDevice2 = DeviceModel(
    id: 'd2',
    name: 'Device 2',
    cityId: 'c1',
    status: 'offline',
    location: tLocationModel,
    productIds: ['p2'],
    lastUpdated: '2023-01-01T12:00:00.000',
  );

  final tDevices = [tDevice1, tDevice2];

  group('filteredDevicesProvider', () {
    test('should return all devices initially', () async {
      final container = ProviderContainer(
        overrides: [rawDevicesProvider.overrideWith((ref) => tDevices)],
      );
      addTearDown(container.dispose);

      final result = await container.read(filteredDevicesProvider.future);
      expect(result, tDevices);
    });

    test('should filter devices by online status', () async {
      final container = ProviderContainer(
        overrides: [rawDevicesProvider.overrideWith((ref) => tDevices)],
      );
      addTearDown(container.dispose);

      // Enable online only filter
      container.read(deviceFilterOnlineProvider.notifier).toggle();

      final result = await container.read(filteredDevicesProvider.future);
      expect(result.length, 1);
      expect(result.first, tDevice1);
    });

    test('should filter devices by search query', () async {
      final container = ProviderContainer(
        overrides: [rawDevicesProvider.overrideWith((ref) => tDevices)],
      );
      addTearDown(container.dispose);

      // Set search query
      container.read(deviceSearchQueryProvider.notifier).update('Device 2');

      final result = await container.read(filteredDevicesProvider.future);
      expect(result.length, 1);
      expect(result.first, tDevice2);
    });

    test('should sort devices by name', () async {
      final container = ProviderContainer(
        overrides: [
          rawDevicesProvider.overrideWith((ref) => [tDevice2, tDevice1]),
        ],
      );
      addTearDown(container.dispose);

      // Set sort by name
      container.read(deviceSortProvider.notifier).set('name');

      final result = await container.read(filteredDevicesProvider.future);
      expect(result.first, tDevice1);
      expect(result.last, tDevice2);
    });
  });
}
