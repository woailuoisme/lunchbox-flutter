import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/core/network/response/paginated_response.dart';
import 'package:lunchbox/features/lottery/entities/lottery_draw_response.dart';
import 'package:lunchbox/features/lottery/entities/lottery_prize_response.dart';
import 'package:lunchbox/features/lottery/entities/lottery_record_response.dart';
import 'package:lunchbox/features/lottery/entities/lottery_statistics_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lottery_rest_client.g.dart';

@Riverpod(keepAlive: true)
LotteryRestClient lotteryRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return LotteryRestClient(dio);
}

@RestApi()
abstract class LotteryRestClient {
  factory LotteryRestClient(Dio dio, {String baseUrl}) = _LotteryRestClient;

  /// 获取抽奖商品列表
  @GET('/api/v1/lottery/prizes')
  Future<ApiResponse<List<LotteryPrizeResponse>>> getLotteryPrizes();

  /// 执行抽奖
  @POST('/api/v1/lottery/draw')
  Future<ApiResponse<LotteryDrawResponse>> drawLottery();

  /// 获取用户抽奖记录
  @GET('/api/v1/lottery/records')
  Future<ApiResponse<PaginatedResponse<LotteryRecordResponse>>>
  getLotteryRecords({@Query('page') int? page, @Query('size') int? size});

  /// 获取用户抽奖统计
  @GET('/api/v1/lottery/statistics')
  Future<ApiResponse<LotteryStatisticsResponse>> getLotteryStatistics();

  /// 获取单个抽奖记录详情
  @GET('/api/v1/lottery/records/{record_id}')
  Future<ApiResponse<LotteryRecordResponse>> getLotteryRecordDetail(
    @Path('record_id') int recordId,
  );
}
