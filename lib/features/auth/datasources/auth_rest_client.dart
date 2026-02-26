import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
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

  @POST('/api/v1/auth/test_login')
  Future<ApiResponse<dynamic>> login(@Body() Map<String, dynamic> body);

  @POST('/api/v1/auth/send_code')
  Future<ApiResponse<dynamic>> sendCode(@Field('telephone') String phone);

  @POST('/api/v1/auth/login_with_phone')
  Future<ApiResponse<dynamic>> loginWithPhone(
    @Field('telephone') String phone,
    @Field('code') String code,
  );

  @POST('/api/auth/register')
  Future<ApiResponse<dynamic>> register(@Body() Map<String, dynamic> body);

  @POST('/api/auth/logout')
  Future<ApiResponse<void>> logout();

  @GET('/api/v1/auth/me')
  Future<ApiResponse<dynamic>> getMe();
}
