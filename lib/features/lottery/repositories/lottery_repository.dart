import 'package:lunchbox/core/errors/failure.dart';
import 'package:lunchbox/features/lottery/datasources/lottery_rest_client.dart';
import 'package:lunchbox/features/lottery/entities/lottery_prize_model.dart';
import 'package:lunchbox/features/lottery/entities/lottery_record_model.dart';
import 'package:lunchbox/features/lottery/entities/lottery_statistics_model.dart';
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
  Future<List<LotteryPrizeModel>> getLotteryPrizes() async {
    final response = await _client.getLotteryPrizes();
    if (response.success && response.data != null) {
      return response.data!;
    }
    throw Failure.server(message: response.message, statusCode: response.code);
  }

  /// 执行抽奖
  Future<LotteryPrizeModel> drawLottery() async {
    final response = await _client.drawLottery();
    if (response.success && response.data != null) {
      return response.data!;
    }
    throw Failure.server(message: response.message, statusCode: response.code);
  }

  /// 获取用户抽奖记录
  Future<List<LotteryRecordModel>> getLotteryRecords({
    int page = 1,
    int size = 20,
  }) async {
    final response = await _client.getLotteryRecords(page: page, size: size);
    if (response.success && response.data != null) {
      return response.data!;
    }
    throw Failure.server(message: response.message, statusCode: response.code);
  }

  /// 获取用户抽奖统计
  Future<LotteryStatisticsModel> getLotteryStatistics() async {
    final response = await _client.getLotteryStatistics();
    if (response.success && response.data != null) {
      return response.data!;
    }
    throw Failure.server(message: response.message, statusCode: response.code);
  }

  /// 获取单个抽奖记录详情
  Future<LotteryRecordModel> getLotteryRecordDetail(String recordId) async {
    final response = await _client.getLotteryRecordDetail(recordId);
    if (response.success && response.data != null) {
      return response.data!;
    }
    throw Failure.server(message: response.message, statusCode: response.code);
  }
}
