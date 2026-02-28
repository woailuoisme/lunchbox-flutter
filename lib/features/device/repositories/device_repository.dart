import 'package:lunchbox/features/device/datasources/device_rest_client.dart';
import 'package:lunchbox/features/device/entities/device_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_repository.g.dart';

@Riverpod(keepAlive: true)
DeviceRepository deviceRepository(Ref ref) {
  final restClient = ref.watch(deviceRestClientProvider);
  return DeviceRepository(restClient);
}

/// 设备仓库类
/// 负责处理自动售货机设备相关的数据访问和业务逻辑
class DeviceRepository {
  DeviceRepository(this._client);

  final DeviceRestClient _client;

  Future<List<DeviceModel>> getDevicesWithDistance({
    required String cityCode,
    required double latitude,
    required double longitude,
  }) async {
    final response = await _client.getDevicesWithDistance(
      cityCode: cityCode,
      latitude: latitude,
      longitude: longitude,
    );
    return response.data ?? [];
  }

  Future<List<DeviceModel>> getFrequentDevices() async {
    final response = await _client.getFrequentDevices();
    return response.data ?? [];
  }
}
