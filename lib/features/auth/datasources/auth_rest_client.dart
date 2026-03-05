import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/auth/entities/login_response_data.dart';
import 'package:lunchbox/features/auth/entities/refresh_token_response_data.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_rest_client.g.dart';

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteDataSource(dio);
}

@RestApi()
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio, {String baseUrl}) =
      _AuthRemoteDataSource;

  @POST('/api/v1/auth/user_login')
  Future<ApiResponse<LoginResponseData>> login(
    @Body() Map<String, dynamic> body,
  );

  @POST('/api/v1/auth/password/reset')
  Future<ApiResponse<void>> resetPassword(@Body() Map<String, dynamic> body);

  @POST('/api/v1/auth/{provider}/token')
  Future<ApiResponse<LoginResponseData>> socialLogin(
    @Path('provider') String provider,
    @Body() Map<String, dynamic> body,
  );

  @POST('/api/v1/auth/register')
  Future<ApiResponse<LoginResponseData>> register(
    @Body() Map<String, dynamic> body,
  );

  @POST('/api/v1/auth/refresh')
  Future<ApiResponse<RefreshTokenResponseData>> refresh();
}
