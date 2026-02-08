import 'package:lunchbox/features/device/entities/device_model.dart';
import 'package:lunchbox/features/device/entities/location_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'simulated_device_repository.g.dart';

@riverpod
SimulatedDeviceRepository simulatedDeviceRepository(Ref ref) {
  return SimulatedDeviceRepository();
}

class SimulatedDeviceRepository {
  // 模拟数据 - 常去营业点
  final _frequentDevices = [
    const DeviceModel(
      id: '1',
      name: '1号机/中国有色大厦',
      cityId: 'sz',
      status: 'online',
      location: LocationModel(
        latitude: 22.543099,
        longitude: 114.057868,
        address: '深圳市福田区沙头街道车公庙深南大道6013号(车公庙地铁站D1口旁)',
      ),
      productIds: [],
      lastUpdated: '2023-10-01T12:00:00Z',
    ),
    const DeviceModel(
      id: '5',
      name: '5号机/三诺智慧大厦大堂',
      cityId: 'sz',
      status: 'online',
      location: LocationModel(
        latitude: 22.543099,
        longitude: 114.057868,
        address: '深圳市南山区滨海大道3388号',
      ),
      productIds: [],
      lastUpdated: '2023-10-01T12:00:00Z',
    ),
    const DeviceModel(
      id: '2',
      name: '2号机/德维森大厦大堂',
      cityId: 'sz',
      status: 'online',
      location: LocationModel(
        latitude: 22.543099,
        longitude: 114.057868,
        address: '深圳市南山区粤海街道德维森德维森大厦',
      ),
      productIds: [],
      lastUpdated: '2023-10-01T12:00:00Z',
    ),
  ];

  // 模拟数据 - 附近营业点
  final _nearbyDevices = [
    const DeviceModel(
      id: '10',
      name: '10号机/中科云计算研究院',
      cityId: 'dg',
      status: 'online',
      location: LocationModel(
        latitude: 22.9,
        longitude: 113.8,
        address: '东莞市广东省东莞市大岭山镇东莞暨南大学研究院中科云计算研究院',
      ),
      productIds: [],
      lastUpdated: '2023-10-01T12:00:00Z',
    ),
    const DeviceModel(
      id: '20',
      name: '20号机',
      cityId: 'dg',
      status: 'online',
      location: LocationModel(
        latitude: 22.9,
        longitude: 113.8,
        address: '东莞市寮步镇科技二路光大We谷',
      ),
      productIds: [],
      lastUpdated: '2023-10-01T12:00:00Z',
    ),
  ];

  Future<List<DeviceModel>> fetchFrequentDevices(
    int pageKey,
    int pageSize,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (pageKey >= _frequentDevices.length) {
      return [];
    }
    final endIndex = (pageKey + pageSize) > _frequentDevices.length
        ? _frequentDevices.length
        : (pageKey + pageSize);
    return _frequentDevices.sublist(pageKey, endIndex);
  }

  Future<List<DeviceModel>> fetchNearbyDevices(
    int pageKey,
    int pageSize,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (pageKey >= _nearbyDevices.length) {
      return [];
    }
    final endIndex = (pageKey + pageSize) > _nearbyDevices.length
        ? _nearbyDevices.length
        : (pageKey + pageSize);
    return _nearbyDevices.sublist(pageKey, endIndex);
  }
}
