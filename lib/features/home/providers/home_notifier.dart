import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/logger_utils.dart';
import '../../city/repositories/city_repository.dart';
import '../../device/repositories/device_repository.dart';
import 'home_state.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    // 初始化时加载数据
    Future.microtask(loadData);
    return const HomeState();
  }

  /// 加载数据
  Future<void> loadData() async {
    await loadCurrentCity();
    if (state.currentCity != null) {
      await loadNearbyDevices();
    }
  }

  /// 加载当前城市
  Future<void> loadCurrentCity() async {
    try {
      final cityRepository = ref.read(cityRepositoryProvider);

      // 尝试获取所有城市，默认选择第一个作为当前城市
      // TODO(User): 实现本地存储读取上次选择的城市
      final cities = await cityRepository.getAllCities();
      if (cities.isNotEmpty) {
        state = state.copyWith(currentCity: cities.first);
      }
    } catch (e) {
      LoggerUtils.e('HomeNotifier: Failed to load current city', e);
    }
  }

  /// 加载附近设备
  Future<void> loadNearbyDevices() async {
    try {
      if (state.currentCity == null) {
        return;
      }

      state = state.copyWith(isLoading: true);

      final deviceRepository = ref.read(deviceRepositoryProvider);
      final devices = await deviceRepository.getNearbyDevices(
        state.currentCity!.latitude,
        state.currentCity!.longitude,
      );
      state = state.copyWith(nearbyDevices: devices);

      LoggerUtils.i('HomeNotifier: Loaded ${devices.length} nearby devices');
    } catch (e) {
      LoggerUtils.e('HomeNotifier: Failed to load nearby devices', e);

      // 如果获取附近设备失败，尝试获取城市的所有设备
      if (state.currentCity != null) {
        try {
          final deviceRepository = ref.read(deviceRepositoryProvider);
          final devices = await deviceRepository.getDevicesByCityId(
            state.currentCity!.id,
          );
          state = state.copyWith(nearbyDevices: devices);
        } catch (e2) {
          LoggerUtils.e('HomeNotifier: Failed to load city devices', e2);
        }
      }
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// 刷新数据
  Future<void> refreshData() async {
    await loadData();
  }

  /// 切换城市
  void changeCity() {
    // 导航逻辑应由UI层处理，这里只负责状态更新
    // 实际项目中可能需要在这里处理一些清理工作
  }

  /// 切换底部导航标签
  void changeTab(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }
}
