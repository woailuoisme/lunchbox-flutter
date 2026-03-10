import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/partner/entities/partner_consult_request.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'partner_rest_client.g.dart';

@Riverpod(keepAlive: true)
PartnerRestClient partnerRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return PartnerRestClient(dio);
}

@RestApi()
abstract class PartnerRestClient {
  factory PartnerRestClient(Dio dio, {String baseUrl}) = _PartnerRestClient;

  /// 提交合作咨询信息
  @POST('/api/v1/common/consult')
  Future<ApiResponse<void>> submitConsult(@Body() PartnerConsultRequest body);
}
