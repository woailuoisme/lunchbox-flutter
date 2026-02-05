import 'package:flutter_test/flutter_test.dart';
import 'package:lunchbox/features/device/entities/device_model.dart';
import 'package:lunchbox/features/device/entities/location_model.dart';
import 'package:lunchbox/features/device/repositories/device_repository.dart';
import 'package:lunchbox/shared/models/api_response_model.dart';
import 'package:lunchbox/shared/services/api_provider.dart';
import 'package:lunchbox/shared/services/mock_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([ApiProvider, MockProvider])
import 'device_repository_test.mocks.dart';

void main() {
  late DeviceRepository repository;
  late MockApiProvider mockApiProvider;
  late MockMockProvider mockMockProvider;

  setUp(() {
    mockApiProvider = MockApiProvider();
    mockMockProvider = MockMockProvider();
    repository = DeviceRepository(
      mockApiProvider,
      mockMockProvider,
      useMockData: false,
    );
  });

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

  final tDeviceList = [tDeviceModel];

  group('getAllDevices', () {
    test('should return list of devices when api call is successful', () async {
      // arrange
      final apiResponse = ApiResponseModel<List<DeviceModel>>.success(
        tDeviceList,
      );

      when(
        mockApiProvider.get<List<DeviceModel>>(any, any),
      ).thenAnswer((_) async => apiResponse);

      // act
      final result = await repository.getAllDevices();

      // assert
      expect(result, tDeviceList);
      verify(mockApiProvider.get<List<DeviceModel>>('/api/devices', any));
      verifyNoMoreInteractions(mockApiProvider);
    });

    test('should throw exception when api call fails', () async {
      // arrange
      final apiResponse = ApiResponseModel<List<DeviceModel>>.failure(
        'Server error',
      );

      when(
        mockApiProvider.get<List<DeviceModel>>(any, any),
      ).thenAnswer((_) async => apiResponse);

      // act
      final call = repository.getAllDevices;

      // assert
      expect(call, throwsException);
      verify(mockApiProvider.get<List<DeviceModel>>('/api/devices', any));
    });
  });

  group('getDeviceById', () {
    const tDeviceId = 'd1';

    test('should return device when api call is successful', () async {
      // arrange
      final apiResponse = ApiResponseModel<DeviceModel>.success(tDeviceModel);

      when(
        mockApiProvider.get<DeviceModel>(any, any),
      ).thenAnswer((_) async => apiResponse);

      // act
      final result = await repository.getDeviceById(tDeviceId);

      // assert
      expect(result, tDeviceModel);
      verify(mockApiProvider.get<DeviceModel>('/api/devices/$tDeviceId', any));
    });
  });

  group('getNearbyDevices', () {
    test('should return sorted devices within radius', () async {
      // arrange
      // Create devices with different locations
      // User location: (31.2304, 121.4737)

      // Device 1: Very close (same location)
      const device1 = tDeviceModel;

      // Device 2: Far away (e.g., Beijing, approx 1000km away)
      const device2 = DeviceModel(
        id: 'd2',
        name: 'Beijing Device',
        cityId: 'c2',
        status: 'online',
        location: LocationModel(
          latitude: 39.9042,
          longitude: 116.4074,
          address: 'Beijing',
        ),
        productIds: [],
        lastUpdated: '2023-01-01',
      );

      final devices = [device1, device2];
      final apiResponse = ApiResponseModel<List<DeviceModel>>.success(devices);

      when(
        mockApiProvider.get<List<DeviceModel>>(any, any),
      ).thenAnswer((_) async => apiResponse);

      // act
      // Search with small radius (e.g. 10km)
      final result = await repository.getNearbyDevices(
        31.2304,
        121.4737,
        radius: 10,
      );

      // assert
      expect(result.length, 1);
      expect(result.first, device1);
    });
  });
}
