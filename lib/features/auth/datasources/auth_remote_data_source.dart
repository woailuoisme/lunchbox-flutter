import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/api_service.dart';

part 'auth_remote_data_source.g.dart';

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final apiService = ref.watch(apiServiceProvider);
  return AuthRemoteDataSource(apiService);
}

class AuthRemoteDataSource {
  AuthRemoteDataSource(this._apiService);
  final ApiService _apiService;

  Future<Response<dynamic>> login({
    required String username,
    required String password,
  }) {
    return _apiService.post<dynamic>(
      '/auth/login',
      data: {'username': username, 'password': password},
    );
  }

  Future<Response<dynamic>> register({
    required String username,
    required String password,
    required String nickname,
  }) {
    return _apiService.post<dynamic>(
      '/auth/register',
      data: {'username': username, 'password': password, 'nickname': nickname},
    );
  }

  Future<void> logout() {
    return _apiService.post<void>('/auth/logout');
  }

  Future<Response<dynamic>> getUserInfo() {
    return _apiService.get<dynamic>('/user/profile');
  }

  Future<Response<dynamic>> updateUserInfo(Map<String, dynamic> data) {
    return _apiService.put<dynamic>('/user/profile', data: data);
  }

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    return _apiService.post<void>(
      '/user/change-password',
      data: {'oldPassword': oldPassword, 'newPassword': newPassword},
    );
  }

  Future<Response<dynamic>> refreshToken(String token) {
    return _apiService.post<dynamic>('/auth/refresh', data: {'token': token});
  }

  Future<void> sendVerificationCode(String phone) {
    return _apiService.post<void>('/auth/send-code', data: {'phone': phone});
  }

  Future<Response<dynamic>> verifyCode({
    required String phone,
    required String code,
  }) {
    return _apiService.post<dynamic>(
      '/auth/verify-code',
      data: {'phone': phone, 'code': code},
    );
  }
}
