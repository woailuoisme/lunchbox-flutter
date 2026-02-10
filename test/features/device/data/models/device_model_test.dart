import 'package:flutter_test/flutter_test.dart';
import 'package:lunchbox/features/device/entities/device_model.dart';
import 'package:lunchbox/features/device/entities/location_model.dart';

void main() {
  group('DeviceModel', () {
    const tLocationModel = LocationModel(
      latitude: 31.2304,
      longitude: 121.4737,
      address: 'Shanghai',
    );

    const tDeviceModel = DeviceModel(
      id: 'd1',
      name: 'Test Device',
      cityId: 'c1',
      status: 'online',
      location: tLocationModel,
      productIds: ['p1', 'p2'],
      lastUpdated: '2023-01-01T12:00:00.000',
    );

    test('should be a subclass of DeviceModel entity', () async {
      // assert
      expect(tDeviceModel, isA<DeviceModel>());
    });

    test('fromJson should return a valid model', () async {
      // arrange
      final Map<String, dynamic> jsonMap = {
        'id': 'd1',
        'name': 'Test Device',
        'city_id': 'c1',
        'status': 'online',
        'location': {
          'latitude': 31.2304,
          'longitude': 121.4737,
          'address': 'Shanghai',
        },
        'product_ids': ['p1', 'p2'],
        'last_updated': '2023-01-01T12:00:00.000',
      };

      // act
      final result = DeviceModel.fromJson(jsonMap);

      // assert
      expect(result, tDeviceModel);
    });

    test('toJson should return a JSON map containing proper data', () async {
      // act
      final result = tDeviceModel.toJson();

      // assert
      final expectedMap = {
        'id': 'd1',
        'name': 'Test Device',
        'city_id': 'c1',
        'status': 'online',
        'location': {
          'latitude': 31.2304,
          'longitude': 121.4737,
          'address': 'Shanghai',
        },
        'product_ids': ['p1', 'p2'],
        'last_updated': '2023-01-01T12:00:00.000',
      };
      expect(result, expectedMap);
    });

    test('isOnline should return true when status is online', () {
      expect(tDeviceModel.isOnline, true);
    });

    test('isOnline should return false when status is not online', () {
      final offlineDevice = tDeviceModel.copyWith(status: 'offline');
      expect(offlineDevice.isOnline, false);
    });

    test('round trip serialization should preserve data', () {
      final json = tDeviceModel.toJson();
      final fromJson = DeviceModel.fromJson(json);
      expect(fromJson, tDeviceModel);
    });
  });
}
