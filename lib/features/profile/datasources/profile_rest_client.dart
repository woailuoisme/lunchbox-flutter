import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/auth/entities/user_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_rest_client.g.dart';

@Riverpod(keepAlive: true)
ProfileRestClient profileRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ProfileRestClient(dio);
}

@RestApi()
abstract class ProfileRestClient {
  factory ProfileRestClient(Dio dio, {String baseUrl}) = _ProfileRestClient;

  /// 获取用户个人信息
  @GET('/api/v1/auth/me')
  Future<ApiResponse<UserModel>> getProfile();

  /// 用户登出
  @POST('/api/v1/auth/logout')
  Future<ApiResponse<void>> logout();
}
