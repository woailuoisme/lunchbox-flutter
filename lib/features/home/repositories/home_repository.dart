import 'package:lunchbox/core/errors/errors.dart';
import 'package:lunchbox/core/errors/repository_error_handler_mixin.dart';
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

class HomeRepository with RepositoryErrorHandlerMixin {
  HomeRepository(this._client);

  final HomeRestClient _client;

  /// 获取轮播图列表
  Future<List<BannerModel>> getBanners({String type = 'first'}) async {
    try {
      final response = await _client.getBanners(type: type);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }

  /// 获取最近的设备
  Future<List<NearestDeviceModel>> getNearestDevice({
    required double latitude,
    required double longitude,
    int limit = 1,
  }) async {
    try {
      final response = await _client.getNearestDevice(
        latitude: latitude,
        longitude: longitude,
        limit: limit,
      );

      if (response.success && response.code == 200 && response.data != null) {
        return response.data!;
      }
      // 如果不是成功状态，返回空列表，表示暂无可用设备
      return <NearestDeviceModel>[];
    } catch (e) {
      // 捕获异常也返回空列表，避免整个页面崩溃
      return <NearestDeviceModel>[];
    }
  }

  /// 获取推荐商品列表
  Future<List<RecommendProductModel>> getRecommendProducts({
    List<String>? tags,
  }) async {
    try {
      final response = await _client.getRecommendProducts(tags: tags);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }
}
