import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/storage_service.dart';
import '../../../core/utils/logger_utils.dart';
import '../../../core/values/app_constants.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final storageService = ref.watch(storageServiceProvider);
  return AuthRepository(remoteDataSource, storageService);
}

class AuthRepository {

  AuthRepository(this._remoteDataSource, this._storageService);
  final AuthRemoteDataSource _remoteDataSource;
  final StorageService _storageService;

  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.login(
        username: username,
        password: password,
      );

      final token = response.data['token'] as String;
      final userId = response.data['userId'] as String;

      await _storageService.write(AppConstants.keyAuthToken, token);
      await _storageService.write(AppConstants.keyUserId, userId);

      if (response.data.containsKey('permissions')) {
        final permissions =
            (response.data['permissions'] as List<dynamic>?)?.cast<String>() ??
            [];
        await _storageService.write(
          AppConstants.keyUserPermissions,
          permissions,
        );
      }

      final user = UserModel.fromJson(response.data['user']);

      LoggerUtils.i(
        'AuthRepository: Login successful for user: ${user.username}',
      );
      return user;
    } catch (e, stackTrace) {
      LoggerUtils.e('AuthRepository: Login failed', e, stackTrace);
      rethrow;
    }
  }

  Future<UserModel> register({
    required String username,
    required String password,
    required String nickname,
  }) async {
    try {
      final response = await _remoteDataSource.register(
        username: username,
        password: password,
        nickname: nickname,
      );

      final token = response.data['token'] as String;
      final userId = response.data['userId'] as String;

      await _storageService.write(AppConstants.keyAuthToken, token);
      await _storageService.write(AppConstants.keyUserId, userId);

      if (response.data.containsKey('permissions')) {
        final permissions =
            (response.data['permissions'] as List<dynamic>?)?.cast<String>() ??
            [];
        await _storageService.write(
          AppConstants.keyUserPermissions,
          permissions,
        );
      }

      final user = UserModel.fromJson(response.data['user']);

      LoggerUtils.i(
        'AuthRepository: Registration successful for user: ${user.username}',
      );
      return user;
    } catch (e, stackTrace) {
      LoggerUtils.e('AuthRepository: Registration failed', e, stackTrace);
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _remoteDataSource.logout();
    } catch (e, stackTrace) {
      LoggerUtils.e('AuthRepository: Logout API failed', e, stackTrace);
    } finally {
      // Always remove local data
      await _storageService.remove(AppConstants.keyAuthToken);
      await _storageService.remove(AppConstants.keyUserId);
      await _storageService.remove(AppConstants.keyUserPermissions);
      await _storageService.remove(AppConstants.keyCart);
      LoggerUtils.i('AuthRepository: Local session cleared');
    }
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      final token = _storageService.read<String>(AppConstants.keyAuthToken);
      if (token == null || token.isEmpty) {
        LoggerUtils.w('AuthRepository: No auth token found');
        return null;
      }

      final response = await _remoteDataSource.getUserInfo();
      final user = UserModel.fromJson(response.data);

      LoggerUtils.i('AuthRepository: Current user fetched successfully');
      return user;
    } catch (e, stackTrace) {
      LoggerUtils.e(
        'AuthRepository: Failed to get current user',
        e,
        stackTrace,
      );
      return null;
    }
  }

  Future<UserModel> updateUserInfo(Map<String, dynamic> data) async {
    try {
      final response = await _remoteDataSource.updateUserInfo(data);
      final user = UserModel.fromJson(response.data);

      LoggerUtils.i('AuthRepository: User info updated successfully');
      return user;
    } catch (e, stackTrace) {
      LoggerUtils.e(
        'AuthRepository: Failed to update user info',
        e,
        stackTrace,
      );
      rethrow;
    }
  }

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      await _remoteDataSource.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );

      LoggerUtils.i('AuthRepository: Password changed successfully');
    } catch (e, stackTrace) {
      LoggerUtils.e('AuthRepository: Failed to change password', e, stackTrace);
      rethrow;
    }
  }

  bool isLoggedIn() {
    final token = _storageService.read<String>(AppConstants.keyAuthToken);
    return token != null && token.isNotEmpty;
  }

  String? getAuthToken() {
    return _storageService.read<String>(AppConstants.keyAuthToken);
  }

  String? getUserId() {
    return _storageService.read<String>(AppConstants.keyUserId);
  }

  Future<void> refreshToken() async {
    try {
      final token = getAuthToken();
      if (token == null) {
        throw Exception('No auth token found');
      }

      final response = await _remoteDataSource.refreshToken(token);
      final newToken = response.data['token'] as String;

      await _storageService.write(AppConstants.keyAuthToken, newToken);

      LoggerUtils.i('AuthRepository: Token refreshed successfully');
    } catch (e, stackTrace) {
      LoggerUtils.e('AuthRepository: Failed to refresh token', e, stackTrace);
      rethrow;
    }
  }

  Future<void> sendVerificationCode(String phone) async {
    await _remoteDataSource.sendVerificationCode(phone);
  }

  Future<bool> verifyCode({required String phone, required String code}) async {
    final response = await _remoteDataSource.verifyCode(
      phone: phone,
      code: code,
    );
    return response.data['valid'] as bool;
  }
}
