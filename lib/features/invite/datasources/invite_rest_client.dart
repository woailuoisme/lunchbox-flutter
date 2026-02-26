import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/invite/entities/invitation_code_model.dart';
import 'package:lunchbox/features/invite/entities/invitation_record_model.dart';
import 'package:lunchbox/features/invite/entities/invitation_verify_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'invite_rest_client.g.dart';

@Riverpod(keepAlive: true)
InviteRestClient inviteRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return InviteRestClient(dio);
}

@RestApi()
abstract class InviteRestClient {
  factory InviteRestClient(Dio dio, {String baseUrl}) = _InviteRestClient;

  /// 生成邀请码
  @GET('/api/v1/user/invitation/generate')
  Future<ApiResponse<InvitationCodeModel>> generateInvitationCode();

  /// 获取邀请记录
  @GET('/api/v1/user/invitation/records')
  Future<ApiResponse<List<InvitationRecordModel>>> getInvitationRecords();

  /// 验证邀请码
  @GET('/api/v1/user/invitation/verify')
  Future<ApiResponse<InvitationVerifyModel>> verifyInvitationCode({
    @Query('code') required String code,
  });
}
