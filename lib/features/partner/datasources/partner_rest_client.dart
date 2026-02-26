import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
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

  /// 申请合伙人
  @POST('/api/v1/user/partner/apply')
  Future<ApiResponse<void>> applyPartner(@Body() Map<String, dynamic> body);
}
