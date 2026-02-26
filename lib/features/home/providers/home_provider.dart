import 'package:geolocator/geolocator.dart';
import 'package:lunchbox/core/mixins/async_runner_mixin.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/device/repositories/city_repository.dart';
import 'package:lunchbox/features/device/repositories/device_repository.dart';
import 'package:lunchbox/features/home/providers/home_state.dart';
import 'package:lunchbox/features/home/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier with AsyncRunnerMixin<HomeState> {
  @override
  HomeState build() {
    // 初始化时加载数据
    Future.microtask(loadData);
    return const HomeState();
  }

  /// 加载数据
  Future<void> loadData() async {
    await runAsync(() async {
      // 1. 并行加载不依赖城市的数据
      await Future.wait([
        loadCurrentCity(),
        loadBanners(),
        loadRecommendProducts(),
      ]);

      // 2. 加载依赖城市或位置的数据
      final tasks = <Future<void>>[];

      // 加载最近设备 (内部处理了 currentCity 为空的情况)
      tasks.add(loadNearestDevice());

      // 如果有城市信息，加载该城市的设备
      if (state.currentCity != null) {
        tasks.add(loadNearbyDevices());
      }

      if (tasks.isNotEmpty) {
        await Future.wait(tasks);
      }
    }, errorLabel: 'Load home data failed');
  }

  /// 加载推荐商品
  Future<void> loadRecommendProducts() async {
    await runAsync(
      () async {
        final homeRepository = ref.read(homeRepositoryProvider);
        final products = await homeRepository.getRecommendProducts(
          tags: ['hot', 'new', 'recommend'],
        );

        state = state.copyWith(recommendProducts: products);
        LoggerUtils.i(
          'HomeNotifier: Loaded ${products.length} recommend products',
        );
      },
      showLoading: false,
      errorLabel: 'Load recommend products failed',
    );
  }

  /// 加载最近设备
  Future<void> loadNearestDevice() async {
    await runAsync(
      () async {
        final homeRepository = ref.read(homeRepositoryProvider);

        double latitude;
        double longitude;

        try {
          // 尝试获取当前位置
          final position = await _determinePosition();
          latitude = position.latitude;
          longitude = position.longitude;
          LoggerUtils.i(
            'HomeNotifier: Got current location: $latitude, $longitude',
          );
        } catch (e) {
          // 获取位置失败，回退到默认城市坐标或默认值
          LoggerUtils.w(
            'HomeNotifier: Failed to get location, using default: $e',
          );
          latitude = 22.543099;
          longitude = 114.057868;
        }

        final devices = await homeRepository.getNearestDevice(
          latitude: latitude,
          longitude: longitude,
        );

        if (devices.isNotEmpty) {
          state = state.copyWith(nearestDevice: devices.first);
          LoggerUtils.i(
            'HomeNotifier: Loaded nearest device: ${devices.first.name}',
          );
        }
      },
      showLoading: false,
      errorLabel: 'Load nearest device failed',
    );
  }

  /// 获取当前位置
  /// 参考: https://pub.dev/packages/geolocator
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 测试定位服务是否开启
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 定位服务未开启，请求用户开启
      // 这里可以根据需求决定是否抛出异常或返回默认值
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 权限被拒绝
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // 权限被永久拒绝
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // 获取当前位置
    // 设置超时时间为 5 秒，精度为 high
    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 5),
      ),
    );
  }

  /// 加载当前城市
  Future<void> loadCurrentCity() async {
    await runAsync(
      () async {
        final cityRepository = ref.read(cityRepositoryProvider);

        // 尝试获取所有城市，默认选择第一个作为当前城市
        // TODO(User): 实现本地存储读取上次选择的城市
        final cities = await cityRepository.getAllCities();
        if (cities.isNotEmpty) {
          // 优先选择深圳作为默认城市（code: 440300），否则选择第一个
          final defaultCity = cities.firstWhere(
            (city) => city.code == '440300' || city.name.contains('深圳'),
            orElse: () => cities.first,
          );
          state = state.copyWith(currentCity: defaultCity);
        }
      },
      showLoading: false,
      errorLabel: 'Load current city failed',
    );
  }

  /// 加载轮播图
  Future<void> loadBanners() async {
    await runAsync(
      () async {
        final homeRepository = ref.read(homeRepositoryProvider);
        final banners = await homeRepository.getBanners(type: 'first');

        state = state.copyWith(banners: banners, errorMessage: null);
        LoggerUtils.i('HomeNotifier: Loaded ${banners.length} banners');
      },
      showLoading: false,
      errorLabel: 'Load banners failed',
    );
  }

  /// 加载附近设备
  Future<void> loadNearbyDevices() async {
    await runAsync(
      () async {
        if (state.currentCity == null) {
          return;
        }

        final deviceRepository = ref.read(deviceRepositoryProvider);
        double latitude;
        double longitude;

        try {
          final position = await _determinePosition();
          latitude = position.latitude;
          longitude = position.longitude;
        } catch (_) {
          latitude = 22.543099;
          longitude = 114.057868;
        }

        try {
          final devices = await deviceRepository.getDevicesWithDistance(
            cityCode: state.currentCity!.code,
            latitude: latitude,
            longitude: longitude,
          );
          state = state.copyWith(nearbyDevices: devices);
          LoggerUtils.i(
            'HomeNotifier: Loaded ${devices.length} nearby devices',
          );
        } catch (e) {
          LoggerUtils.e(
            'HomeNotifier: Failed to load nearby devices, trying city devices...',
            e,
          );
          // 如果获取附近设备失败，尝试获取城市的所有设备
          await _loadCityDevices();
        }
      },
      showLoading: true,
      errorLabel: 'Load nearby devices failed',
    );
  }

  Future<void> _loadCityDevices() async {
    if (state.currentCity != null) {
      try {
        final deviceRepository = ref.read(deviceRepositoryProvider);
        final devices = await deviceRepository.getDevicesWithDistance(
          cityCode: state.currentCity!.code,
          latitude: 22.543099,
          longitude: 114.057868,
        );
        state = state.copyWith(nearbyDevices: devices);
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
