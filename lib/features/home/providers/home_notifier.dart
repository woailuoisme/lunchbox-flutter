import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/device/repositories/city_repository.dart';
import 'package:lunchbox/features/device/repositories/device_repository.dart';
import 'package:lunchbox/features/home/providers/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
      final result = await cityRepository.getAllCities().run();
      result.fold(
        (failure) => LoggerUtils.e(
          'HomeNotifier: Failed to load current city: ${failure.toString()}',
        ),
        (cities) {
          if (cities.isNotEmpty) {
            state = state.copyWith(currentCity: cities.first);
          }
        },
      );
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
      final result = await deviceRepository
          .getNearbyDevices(
            state.currentCity!.latitude,
            state.currentCity!.longitude,
          )
          .run();

      await result.fold(
        (failure) async {
          LoggerUtils.e(
            'HomeNotifier: Failed to load nearby devices: ${failure.toString()}',
          );
          // 如果获取附近设备失败，尝试获取城市的所有设备
          await _loadCityDevices();
        },
        (devices) async {
          state = state.copyWith(nearbyDevices: devices);
          LoggerUtils.i(
            'HomeNotifier: Loaded ${devices.length} nearby devices',
          );
        },
      );
    } catch (e) {
      LoggerUtils.e('HomeNotifier: Failed to load nearby devices', e);
      await _loadCityDevices();
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> _loadCityDevices() async {
    if (state.currentCity != null) {
      try {
        final deviceRepository = ref.read(deviceRepositoryProvider);
        final result = await deviceRepository
            .getDevicesByCityId(state.currentCity!.id)
            .run();
        result.fold(
          (failure) => LoggerUtils.e(
            'HomeNotifier: Failed to load city devices: ${failure.toString()}',
          ),
          (devices) => state = state.copyWith(nearbyDevices: devices),
        );
      } catch (e2) {
        LoggerUtils.e('HomeNotifier: Failed to load city devices', e2);
      }
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
