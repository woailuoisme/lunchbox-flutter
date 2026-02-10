import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:lunchbox/features/auth/entities/user_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_remote_data_source.g.dart';

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteDataSource(dio);
}

@RestApi()
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio, {String baseUrl}) =
      _AuthRemoteDataSource;

  @POST('/api/auth/login')
  Future<ApiResponse<dynamic>> login(@Body() Map<String, dynamic> body);

  @POST('/api/auth/register')
  Future<ApiResponse<dynamic>> register(@Body() Map<String, dynamic> body);

  @POST('/api/auth/logout')
  Future<ApiResponse<void>> logout();

  @GET('/api/users/profile')
  Future<ApiResponse<UserModel>> getUserProfile();

  @PUT('/api/users/profile')
  Future<ApiResponse<UserModel>> updateUserProfile(
    @Body() Map<String, dynamic> body,
  );

  @PUT('/api/users/password')
  Future<ApiResponse<bool>> changePassword(@Body() Map<String, dynamic> body);

  @POST('/api/auth/refresh')
  Future<ApiResponse<dynamic>> refreshToken(@Body() Map<String, dynamic> body);

  @POST('/api/auth/send-code')
  Future<ApiResponse<void>> sendVerificationCode(
    @Body() Map<String, dynamic> body,
  );

  @POST('/api/auth/verify-code')
  Future<ApiResponse<dynamic>> verifyCode(@Body() Map<String, dynamic> body);

  @POST('/api/users/favorite-devices')
  Future<ApiResponse<bool>> addFavoriteDevice(
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/api/users/favorite-devices/{deviceId}')
  Future<ApiResponse<bool>> removeFavoriteDevice(
    @Path('deviceId') String deviceId,
  );
}
