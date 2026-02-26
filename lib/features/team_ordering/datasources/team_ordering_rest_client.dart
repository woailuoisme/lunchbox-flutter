import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'team_ordering_rest_client.g.dart';

@Riverpod(keepAlive: true)
TeamOrderingRestClient teamOrderingRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return TeamOrderingRestClient(dio);
}

@RestApi()
abstract class TeamOrderingRestClient {
  factory TeamOrderingRestClient(Dio dio, {String baseUrl}) =
      _TeamOrderingRestClient;

  /// 提交合作咨询
  @POST('/api/v1/common/consult')
  Future<ApiResponse<void>> submitConsult(@Body() Map<String, dynamic> body);
}
