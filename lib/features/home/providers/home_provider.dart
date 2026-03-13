import 'package:geolocator/geolocator.dart';
import 'package:lunchbox/core/services/location_service.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/home/entities/banner_model.dart';
import 'package:lunchbox/features/home/entities/recommend_product_model.dart';
import 'package:lunchbox/features/home/providers/home_state.dart';
import 'package:lunchbox/features/home/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

/// 首页数据管理器
/// 职责：聚合首页所需的所有并发加载数据，并利用 AsyncValue 处理加载/错误状态
@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  FutureOr<HomeState> build() async {
    return _fetchHomeData();
  }

  /// 并行获取首页数据
  Future<HomeState> _fetchHomeData() async {
    final homeRepository = ref.watch(homeRepositoryProvider);
    final locationService = ref.watch(locationServiceProvider);

    // 首先获取基础的 Banner 和 推荐商品 (它们不依赖位置)
    // 以及异步请求位置权限
    final bannersFuture = homeRepository.getBanners(type: 'first');
    final productsFuture = homeRepository.getRecommendProducts(
      tags: ['hot', 'new', 'recommend'],
    );
    final positionFuture = locationService.getCurrentPosition();

    // 并行运行
    final results = await Future.wait([
      bannersFuture,
      productsFuture,
      positionFuture,
    ]);

    final banners = results[0] as List<BannerModel>;
    final recommendProducts = results[1] as List<RecommendProductModel>;
    final position = results[2] as Position?;

    // 获取位置失败时使用默认值 (从旧版逻辑迁移)
    final latitude = position?.latitude ?? 22.543099;
    final longitude = position?.longitude ?? 114.057868;

    // 获取最近设备依赖经纬度
    final nearestDevice = await homeRepository.getNearestDevice(
      latitude: latitude,
      longitude: longitude,
    );

    LoggerUtils.i(
      'HomeNotifier: Data loaded - Banners: ${banners.length}, '
      'Products: ${recommendProducts.length}, Nearest: ${nearestDevice?.name ?? 'None'}',
    );

    return HomeState(
      banners: banners,
      recommendProducts: recommendProducts,
      nearestDevice: nearestDevice,
    );
  }

  /// 刷新首页数据
  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
