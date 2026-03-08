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

/// 附近设备列表（基于选中的城市和当前位置）
@riverpod
class NearbyDevices extends _$NearbyDevices {
  @override
  Future<List<DeviceModel>> build() async {
    final repository = ref.watch(deviceRepositoryProvider);
    // 等待选中的城市加载完成，避免使用默认值发起两次请求
    final selectedCity = await ref.watch(selectedCityProvider.future);
    final locationService = ref.watch(locationServiceProvider);

    final cityCode = selectedCity?.code ?? '440300'; // 默认深圳 (440300)
    final position = await locationService.getCurrentPosition();
    final latitude = position?.latitude ?? 22.543099;
    final longitude = position?.longitude ?? 114.057868;

    return await repository.getDevicesWithDistance(
      cityCode: cityCode,
      latitude: latitude,
      longitude: longitude,
    );
  }
}

/// 常用设备列表
@riverpod
class FrequentDevices extends _$FrequentDevices {
  @override
  Future<List<DeviceModel>> build() async {
    final repository = ref.watch(deviceRepositoryProvider);
    return await repository.getFrequentDevices();
  }
}

/// 过滤和排序后的附近设备列表
@riverpod
Future<List<DeviceModel>> filteredNearbyDevices(Ref ref) async {
  final devices = await ref.watch(nearbyDevicesProvider.future);
  return _applyFilters(ref, devices);
}

/// 过滤和排序后的常用设备列表
@riverpod
Future<List<DeviceModel>> filteredFrequentDevices(Ref ref) async {
  final devices = await ref.watch(frequentDevicesProvider.future);
  return _applyFilters(ref, devices);
}

/// 内部方法：应用过滤和排序逻辑
List<DeviceModel> _applyFilters(Ref ref, List<DeviceModel> devices) {
  final sort = ref.watch(deviceSortProvider);
  final onlineOnly = ref.watch(deviceFilterOnlineProvider);
  final searchQuery = ref.watch(deviceSearchQueryProvider).toLowerCase();

  final filtered = devices.where((d) {
    if (onlineOnly && !d.isEnabled) return false;
    if (searchQuery.isNotEmpty) {
      return d.name.toLowerCase().contains(searchQuery) ||
          d.fullAddress.toLowerCase().contains(searchQuery) ||
          d.streetAddress.toLowerCase().contains(searchQuery);
    }
    return true;
  }).toList();

  // 排序
  if (sort == 'distance') {
    filtered.sort((a, b) => a.numericalDistance.compareTo(b.numericalDistance));
  } else if (sort == 'name') {
    filtered.sort((a, b) => a.name.compareTo(b.name));
  }

  return filtered;
}

/// 当前选中的设备
@Riverpod(keepAlive: true)
class SelectedDevice extends _$SelectedDevice {
  @override
  DeviceModel? build() => null;

  // ignore: use_setters_to_change_properties
  void set(DeviceModel? device) => state = device;
}

/// 根据ID获取设备详情
@riverpod
Future<DeviceModel?> deviceDetail(Ref ref, String deviceId) async {
  ref.keepAlive();

  // 1. 先从当前选中设备缓存获取，这是最快且最常见的路径
  final selectedDevice = ref.watch(selectedDeviceProvider);
  if (selectedDevice != null && selectedDevice.id.toString() == deviceId) {
    return selectedDevice;
  }

  // 2. 从附近设备列表查找
  final nearbyDevices = await ref.watch(nearbyDevicesProvider.future);
  final matchedNearby = nearbyDevices.cast<DeviceModel?>().firstWhere(
    (DeviceModel? device) => device?.id.toString() == deviceId,
    orElse: () => null,
  );
  if (matchedNearby != null) return matchedNearby;

  // 3. 从常用设备列表查找
  final frequentDevices = await ref.watch(frequentDevicesProvider.future);
  final matchedFrequent = frequentDevices.cast<DeviceModel?>().firstWhere(
    (DeviceModel? device) => device?.id.toString() == deviceId,
    orElse: () => null,
  );
  if (matchedFrequent != null) return matchedFrequent;

  return null;
}

/// 获取指定设备的产品列表
@riverpod
Future<List<ProductModel>> deviceProducts(Ref ref, String deviceId) async {
  ref.keepAlive();
  final categories = await ref.watch(
    deviceCategoryProductsProvider(deviceId).future,
  );
  return categories.expand((c) => c.products).toList();
}
