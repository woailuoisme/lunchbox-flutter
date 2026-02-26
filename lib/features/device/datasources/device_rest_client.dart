import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/device/entities/city_model.dart';
import 'package:lunchbox/features/device/entities/device_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_rest_client.g.dart';

@Riverpod(keepAlive: true)
DeviceRestClient deviceRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return DeviceRestClient(dio);
}

@RestApi()
abstract class DeviceRestClient {
  factory DeviceRestClient(Dio dio, {String baseUrl}) = _DeviceRestClient;

  /// 获取已开通设备的城市列表
  @GET('/api/v1/home/enable_cities')
  Future<ApiResponse<List<CityModel>>> getEnableCities();

  /// 获取城市设备列表（带距离）
  @GET('/api/v1/home/devices_with_distance')
  Future<ApiResponse<List<DeviceModel>>> getDevicesWithDistance({
    @Query('city_code') String? cityCode,
    @Query('latitude') double? latitude,
    @Query('longitude') double? longitude,
  });

  /// 获取用户常用设备列表
  @GET('/api/v1/home/frequent_devices')
  Future<ApiResponse<List<DeviceModel>>> getFrequentDevices();
}
