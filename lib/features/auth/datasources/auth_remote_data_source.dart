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

  Future<Response> login({required String username, required String password}) {
    return _apiService.post(
      '/auth/login',
      data: {'username': username, 'password': password},
    );
  }

  Future<Response> register({
    required String username,
    required String password,
    required String nickname,
  }) {
    return _apiService.post(
      '/auth/register',
      data: {'username': username, 'password': password, 'nickname': nickname},
    );
  }

  Future<void> logout() {
    return _apiService.post('/auth/logout');
  }

  Future<Response> getUserInfo() {
    return _apiService.get('/user/profile');
  }

  Future<Response> updateUserInfo(Map<String, dynamic> data) {
    return _apiService.put('/user/profile', data: data);
  }

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    return _apiService.post(
      '/user/change-password',
      data: {'oldPassword': oldPassword, 'newPassword': newPassword},
    );
  }

  Future<Response> refreshToken(String token) {
    return _apiService.post('/auth/refresh', data: {'token': token});
  }

  Future<void> sendVerificationCode(String phone) {
    return _apiService.post('/auth/send-code', data: {'phone': phone});
  }

  Future<Response> verifyCode({required String phone, required String code}) {
    return _apiService.post(
      '/auth/verify-code',
      data: {'phone': phone, 'code': code},
    );
  }
}
