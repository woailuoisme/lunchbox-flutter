import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/home/entities/banner_model.dart';
import 'package:lunchbox/features/home/entities/nearest_device_model.dart';
import 'package:lunchbox/features/home/entities/recommend_product_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_rest_client.g.dart';

@Riverpod(keepAlive: true)
HomeRestClient homeRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return HomeRestClient(dio);
}

@RestApi()
abstract class HomeRestClient {
  factory HomeRestClient(Dio dio, {String baseUrl}) = _HomeRestClient;

  @GET('/api/v1/home/carousels')
  Future<ApiResponse<List<BannerModel>>> getBanners({
    @Query('type') String type = 'first',
  });

  @GET('/api/v1/home/nearest_device')
  Future<ApiResponse<List<NearestDeviceModel>>> getNearestDevice({
    @Query('latitude') required double latitude,
    @Query('longitude') required double longitude,
    @Query('limit') int limit = 1,
  });

  @GET('/api/v1/home/recommend_products')
  Future<ApiResponse<List<RecommendProductModel>>> getRecommendProducts({
    @Query('tags[]') List<String>? tags,
  });
}
