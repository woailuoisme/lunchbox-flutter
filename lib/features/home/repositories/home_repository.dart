import 'package:lunchbox/features/home/datasources/home_rest_client.dart';
import 'package:lunchbox/features/home/entities/banner_model.dart';
import 'package:lunchbox/features/home/entities/nearest_device_model.dart';
import 'package:lunchbox/features/home/entities/recommend_product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

@Riverpod(keepAlive: true)
HomeRepository homeRepository(Ref ref) {
  final homeRestClient = ref.watch(homeRestClientProvider);
  return HomeRepository(homeRestClient);
}

class HomeRepository {
  HomeRepository(this._client);

  final HomeRestClient _client;

  /// 获取轮播图列表
  Future<List<BannerModel>> getBanners({String type = 'first'}) async {
    final response = await _client.getBanners(type: type);
    return response.data ?? [];
  }

  /// 获取最近的设备
  Future<NearestDeviceModel?> getNearestDevice({
    required double latitude,
    required double longitude,
    int limit = 1,
  }) async {
    final response = await _client.getNearestDevice(
      latitude: latitude,
      longitude: longitude,
      limit: limit,
    );
    return response.data;
  }

  /// 获取推荐商品列表
  Future<List<RecommendProductModel>> getRecommendProducts({
    List<String>? tags,
  }) async {
    final response = await _client.getRecommendProducts(tags: tags);
    return response.data ?? [];
  }
}
