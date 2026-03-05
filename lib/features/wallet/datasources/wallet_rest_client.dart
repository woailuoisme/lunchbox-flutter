import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/wallet/entities/top_up_rule_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wallet_rest_client.g.dart';

@Riverpod(keepAlive: true)
WalletRestClient walletRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return WalletRestClient(dio);
}

@RestApi()
abstract class WalletRestClient {
  factory WalletRestClient(Dio dio, {String baseUrl}) = _WalletRestClient;

  /// 获取充值规则
  @GET('/api/v1/common/top_up_rules')
  Future<ApiResponse<List<TopUpRuleModel>>> getTopUpRules();

  /// 申请充值
  @POST('/api/v1/user/top_up')
  Future<ApiResponse<Map<String, dynamic>>> topUp(
    @Body() Map<String, dynamic> body,
  );

  /// 获取充值记录
  @GET('/api/v1/user/top_up_records')
  Future<ApiResponse<List<Map<String, dynamic>>>> getTopUpRecords();
}
