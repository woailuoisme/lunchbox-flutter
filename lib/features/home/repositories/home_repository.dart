import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lunchbox/core/errors/errors.dart';
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
  TaskEither<Failure, List<BannerModel>> getBanners({String type = 'first'}) {
    return TaskEither.tryCatch(() async {
      final response = await _client.getBanners(type: type);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 获取最近的设备
  TaskEither<Failure, List<NearestDeviceModel>> getNearestDevice({
    required double latitude,
    required double longitude,
    int limit = 1,
  }) {
    return TaskEither.tryCatch(
      () async {
        try {
          final response = await _client.getNearestDevice(
            latitude: latitude,
            longitude: longitude,
            limit: limit,
          );

          if (response.success &&
              response.code == 200 &&
              response.data != null) {
            return response.data!;
          }
          // 如果不是成功状态，返回空列表，表示暂无可用设备
          return <NearestDeviceModel>[];
        } catch (e) {
          // 捕获异常也返回空列表，避免整个页面崩溃
          return <NearestDeviceModel>[];
        }
      },
      (error, stackTrace) {
        // 网络错误或其他严重错误，仍然返回空列表，避免中断 UI
        // 也可以选择记录日志
        return const Failure.server(
          message: 'Failed to get nearest device',
          statusCode: 500,
        );
      },
    );
  }

  /// 获取推荐商品列表
  TaskEither<Failure, List<RecommendProductModel>> getRecommendProducts({
    List<String>? tags,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await _client.getRecommendProducts(tags: tags);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  Failure _handleError(Object error, StackTrace stackTrace) {
    if (error is DioException) {
      return Failure.network(
        message: error.message ?? 'Unknown network error',
        statusCode: error.response?.statusCode,
      );
    }
    return Failure.server(message: error.toString(), statusCode: 500);
  }
}
