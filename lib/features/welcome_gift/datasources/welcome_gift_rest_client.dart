import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_item_model.dart';
import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_log_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'welcome_gift_rest_client.g.dart';

@Riverpod(keepAlive: true)
WelcomeGiftRestClient welcomeGiftRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return WelcomeGiftRestClient(dio);
}

@RestApi()
abstract class WelcomeGiftRestClient {
  factory WelcomeGiftRestClient(Dio dio, {String baseUrl}) =
      _WelcomeGiftRestClient;

  /// 获取新人礼包列表
  @GET('/api/v1/welcome_gift/items')
  Future<ApiResponse<List<WelcomeGiftItemModel>>> getWelcomeGiftItems();

  /// 领取新人礼包
  @POST('/api/v1/welcome_gift/claim')
  Future<ApiResponse<void>> claimWelcomeGift(@Body() Map<String, dynamic> body);

  /// 获取用户领取记录
  @GET('/api/v1/welcome_gift/logs')
  Future<ApiResponse<List<WelcomeGiftLogModel>>> getWelcomeGiftLogs();
}
