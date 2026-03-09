import 'package:lunchbox/core/network/response/paginated_response.dart';
import 'package:lunchbox/features/lottery/datasources/lottery_rest_client.dart';
import 'package:lunchbox/features/lottery/entities/lottery_draw_response.dart';
import 'package:lunchbox/features/lottery/entities/lottery_prize_response.dart';
import 'package:lunchbox/features/lottery/entities/lottery_record_response.dart';
import 'package:lunchbox/features/lottery/entities/lottery_statistics_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lottery_repository.g.dart';

@Riverpod(keepAlive: true)
LotteryRepository lotteryRepository(Ref ref) {
  return LotteryRepository(ref.watch(lotteryRestClientProvider));
}

/// 抽奖仓库类
/// 负责处理抽奖相关的数据访问和业务逻辑
class LotteryRepository {
  LotteryRepository(this._client);

  final LotteryRestClient _client;

  /// 获取抽奖商品列表
  Future<List<LotteryPrizeResponse>> getLotteryPrizes() async {
    final response = await _client.getLotteryPrizes();
    return response.data ?? [];
  }

  /// 执行抽奖
  Future<LotteryDrawResponse?> drawLottery() async {
    final response = await _client.drawLottery();
    return response.data;
  }

  /// 获取用户抽奖记录
  Future<PaginatedResponse<LotteryRecordResponse>?> getLotteryRecords({
    int page = 1,
    int size = 20,
  }) async {
    final response = await _client.getLotteryRecords(page: page, size: size);
    return response.data;
  }

  /// 获取用户抽奖统计
  Future<LotteryStatisticsResponse?> getLotteryStatistics() async {
    final response = await _client.getLotteryStatistics();
    return response.data;
  }

  /// 获取单个抽奖记录详情
  Future<LotteryRecordResponse?> getLotteryRecordDetail(int recordId) async {
    final response = await _client.getLotteryRecordDetail(recordId);
    return response.data;
  }
}
