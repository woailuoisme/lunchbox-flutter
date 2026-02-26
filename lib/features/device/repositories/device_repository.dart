import 'package:lunchbox/core/errors/errors.dart';
import 'package:lunchbox/core/errors/repository_error_handler_mixin.dart';
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
class DeviceRepository with RepositoryErrorHandlerMixin {
  DeviceRepository(this._client);

  final DeviceRestClient _client;

  Future<List<DeviceModel>> getDevicesWithDistance({
    required String cityCode,
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _client.getDevicesWithDistance(
        cityCode: cityCode,
        latitude: latitude,
        longitude: longitude,
      );
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }

  Future<List<DeviceModel>> getFrequentDevices() async {
    try {
      final response = await _client.getFrequentDevices();
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }
}
