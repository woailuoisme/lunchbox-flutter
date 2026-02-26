import 'package:lunchbox/core/errors/errors.dart';
import 'package:lunchbox/core/services/location_service.dart';
import 'package:lunchbox/features/device/device.dart';
import 'package:lunchbox/features/product/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_provider.g.dart';

/// 设备排序方式
@riverpod
class DeviceSort extends _$DeviceSort {
  @override
  String build() => 'distance';

  // ignore: use_setters_to_change_properties
  void set(String sort) => state = sort;
}

/// 仅显示在线设备过滤
@riverpod
class DeviceFilterOnline extends _$DeviceFilterOnline {
  @override
  bool build() => false;

  void toggle() => state = !state;
}

/// 设备搜索关键词
@riverpod
class DeviceSearchQuery extends _$DeviceSearchQuery {
  @override
  String build() => '';

  // ignore: use_setters_to_change_properties
  void update(String query) => state = query;
}

/// 原始设备列表（基于选中的城市）
@riverpod
class RawDevices extends _$RawDevices {
  @override
  Future<List<DeviceModel>> build() async {
    final repository = ref.watch(deviceRepositoryProvider);
    final selectedCityAsync = ref.watch(selectedCityProvider);
    final locationService = ref.watch(locationServiceProvider);

    // 等待城市加载完成
    final selectedCity = selectedCityAsync.value;

    if (selectedCity != null) {
      final position = await locationService.getCurrentPosition();
      final latitude = position?.latitude ?? 22.543099;
      final longitude = position?.longitude ?? 114.057868;
      return await repository.getDevicesWithDistance(
        cityCode: selectedCity.code,
        latitude: latitude,
        longitude: longitude,
      );
    } else {
      return await repository.getFrequentDevices();
    }
  }
}

/// 过滤和排序后的设备列表
@riverpod
Future<List<DeviceModel>> filteredDevices(Ref ref) async {
  final devicesAsync = await ref.watch(rawDevicesProvider.future);
  final sort = ref.watch(deviceSortProvider);
  final onlineOnly = ref.watch(deviceFilterOnlineProvider);
  final searchQuery = ref.watch(deviceSearchQueryProvider);

  var filtered = List<DeviceModel>.from(devicesAsync);

  // 过滤：在线状态
  if (onlineOnly) {
    filtered = filtered.where((d) => d.isEnabled).toList();
  }

  // 过滤：搜索关键词
  if (searchQuery.isNotEmpty) {
    final keyword = searchQuery.toLowerCase();
    filtered = filtered
        .where(
          (d) =>
              d.name.toLowerCase().contains(keyword) ||
              d.fullAddress.toLowerCase().contains(keyword) ||
              d.streetAddress.toLowerCase().contains(keyword),
        )
        .toList();
  }

  // 排序
  if (sort == 'distance') {
    double parseDistance(DeviceModel device) {
      final kmText = device.distanceKm ?? device.distance;
      if (kmText == null || kmText.isEmpty) {
        return double.infinity;
      }
      final match = RegExp(r'[\d.]+').firstMatch(kmText);
      if (match == null) {
        return double.infinity;
      }
      final value = double.tryParse(match.group(0) ?? '');
      if (value == null) {
        return double.infinity;
      }
      if (kmText.toLowerCase().contains('m') &&
          !kmText.toLowerCase().contains('km')) {
        return value / 1000;
      }
      return value;
    }

    filtered.sort((a, b) => parseDistance(a).compareTo(parseDistance(b)));
  } else if (sort == 'name') {
    filtered.sort((a, b) => a.name.compareTo(b.name));
  }

  return filtered;
}

/// 当前选中的设备
@riverpod
class SelectedDevice extends _$SelectedDevice {
  @override
  DeviceModel? build() => null;

  // ignore: use_setters_to_change_properties
  void set(DeviceModel? device) => state = device;
}

/// 根据ID获取设备详情
@riverpod
Future<DeviceModel> deviceDetail(Ref ref, String deviceId) async {
  ref.keepAlive();
  final selectedDevice = ref.watch(selectedDeviceProvider);
  if (selectedDevice != null && selectedDevice.id.toString() == deviceId) {
    return selectedDevice;
  }

  try {
    final devices = await ref.watch(rawDevicesProvider.future);
    final matched = devices.firstWhere(
      (device) => device.id.toString() == deviceId,
      orElse: () => throw const Failure.server(
        message: 'Device not found',
        statusCode: 404,
      ),
    );
    return matched;
  } on Failure {
    rethrow;
  } catch (_) {
    final repository = ref.watch(deviceRepositoryProvider);
    final List<DeviceModel> devices = await repository.getFrequentDevices();
    return devices.firstWhere(
      (DeviceModel device) => device.id.toString() == deviceId,
      orElse: () => throw const Failure.server(
        message: 'Device not found',
        statusCode: 404,
      ),
    );
  }
}

/// 获取指定设备的产品列表
@riverpod
Future<List<ProductModel>> deviceProducts(Ref ref, String deviceId) async {
  ref.keepAlive();
  final repository = ref.watch(productRepositoryProvider);
  return await repository.getProductsByDeviceId(deviceId);
}
