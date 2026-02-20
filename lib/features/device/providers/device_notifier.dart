import 'package:lunchbox/core/errors/errors.dart';
import 'package:lunchbox/features/device/device.dart';
import 'package:lunchbox/features/product/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_notifier.g.dart';

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

    // 等待城市加载完成
    final selectedCity = selectedCityAsync.value;

    if (selectedCity != null) {
      final result = await repository.getDevicesByCityId(selectedCity.id).run();
      return result.getOrThrow();
    } else {
      // 如果没有选择城市，加载所有设备（或附近设备，这里暂用所有）
      final result = await repository.getAllDevices().run();
      return result.getOrThrow();
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
    // 假设 DeviceModel 有 status 字段，且 'online' 为在线
    // 需要检查 DeviceModel 定义，这里假设 status == 1 或 'online'
    // 暂时用 status == 'online'
    filtered = filtered.where((d) => d.status == 'online').toList();
  }

  // 过滤：搜索关键词
  if (searchQuery.isNotEmpty) {
    filtered = filtered
        .where(
          (d) =>
              d.name.contains(searchQuery) ||
              (d.location.address?.contains(searchQuery) ?? false),
        )
        .toList();
  }

  // 排序
  if (sort == 'distance') {
    // TODO(User): 实现距离计算和排序。需要引入用户位置 Provider。
    // 目前 DeviceModel 不包含 distance 字段。
    // filtered.sort((a, b) => (a.distance ?? 0).compareTo(b.distance ?? 0));
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
  final repository = ref.watch(deviceRepositoryProvider);
  final result = await repository.getDeviceById(deviceId).run();
  return result.getOrThrow();
}

/// 获取指定设备的产品列表
@riverpod
Future<List<ProductModel>> deviceProducts(Ref ref, String deviceId) async {
  ref.keepAlive();
  final repository = ref.watch(productRepositoryProvider);
  final result = await repository.getProductsByDeviceId(deviceId).run();
  return result.getOrThrow();
}
