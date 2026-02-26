import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/auth/entities/user_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'personal_info_rest_client.g.dart';

@Riverpod(keepAlive: true)
PersonalInfoRestClient personalInfoRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return PersonalInfoRestClient(dio);
}

@RestApi()
abstract class PersonalInfoRestClient {
  factory PersonalInfoRestClient(Dio dio, {String baseUrl}) =
      _PersonalInfoRestClient;

  /// 更新用户信息
  @PUT('/api/v1/user/profile')
  Future<ApiResponse<UserModel>> updateProfile(
    @Body() Map<String, dynamic> body,
  );
}
