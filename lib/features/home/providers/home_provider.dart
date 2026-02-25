import 'package:geolocator/geolocator.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/device/repositories/city_repository.dart';
import 'package:lunchbox/features/device/repositories/device_repository.dart';
import 'package:lunchbox/features/home/providers/home_state.dart';
import 'package:lunchbox/features/home/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

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
    state = state.copyWith(isLoading: true);
    try {
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
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// 加载推荐商品
  Future<void> loadRecommendProducts() async {
    try {
      final homeRepository = ref.read(homeRepositoryProvider);
      final result = await homeRepository
          .getRecommendProducts(tags: ['hot', 'new', 'recommend'])
          .run();

      result.fold(
        (failure) {
          LoggerUtils.e(
            'HomeNotifier: Failed to load recommend products: $failure',
          );
        },
        (products) {
          state = state.copyWith(recommendProducts: products);
          LoggerUtils.i(
            'HomeNotifier: Loaded ${products.length} recommend products',
          );
        },
      );
    } catch (e) {
      LoggerUtils.e('HomeNotifier: Failed to load recommend products', e);
    }
  }

  /// 加载最近设备
  Future<void> loadNearestDevice() async {
    try {
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
        latitude = state.currentCity?.latitude ?? 22.543099;
        longitude = state.currentCity?.longitude ?? 114.057868;
      }

      final result = await homeRepository
          .getNearestDevice(latitude: latitude, longitude: longitude)
          .run();

      result.fold(
        (failure) {
          LoggerUtils.e(
            'HomeNotifier: Failed to load nearest device: $failure',
          );
        },
        (devices) {
          if (devices.isNotEmpty) {
            state = state.copyWith(nearestDevice: devices.first);
            LoggerUtils.i(
              'HomeNotifier: Loaded nearest device: ${devices.first.name}',
            );
          }
        },
      );
    } catch (e) {
      LoggerUtils.e('HomeNotifier: Failed to load nearest device', e);
    }
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
      desiredAccuracy: LocationAccuracy.high,
      timeLimit: const Duration(seconds: 5),
    );
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
            // 优先选择深圳作为默认城市（code: 440300），否则选择第一个
            final defaultCity = cities.firstWhere(
              (city) => city.code == '440300' || city.name.contains('深圳'),
              orElse: () => cities.first,
            );
            state = state.copyWith(currentCity: defaultCity);
          }
        },
      );
    } catch (e) {
      LoggerUtils.e('HomeNotifier: Failed to load current city', e);
    }
  }

  /// 加载轮播图
  Future<void> loadBanners() async {
    try {
      final homeRepository = ref.read(homeRepositoryProvider);
      final result = await homeRepository.getBanners(type: 'first').run();

      result.fold(
        (failure) {
          LoggerUtils.e('HomeNotifier: Failed to load banners: $failure');
          state = state.copyWith(errorMessage: failure.toString());
        },
        (banners) {
          state = state.copyWith(banners: banners, errorMessage: null);
          LoggerUtils.i('HomeNotifier: Loaded ${banners.length} banners');
        },
      );
    } catch (e) {
      LoggerUtils.e('HomeNotifier: Failed to load banners', e);
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
