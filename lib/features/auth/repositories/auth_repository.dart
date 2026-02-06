import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lunchbox/core/errors/failure.dart';
import 'package:lunchbox/core/network/rest_client.dart';
import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/core/values/app_constants.dart';
import 'package:lunchbox/features/auth/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final restClient = ref.watch(restClientProvider);
  final storageService = ref.watch(storageServiceProvider);
  return AuthRepository(restClient, storageService);
}

class AuthRepository {
  AuthRepository(this._client, this._storageService);

  final RestClient _client;
  final StorageService _storageService;

  TaskEither<Failure, UserModel> login({
    required String username,
    required String password,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await _client.login({
        'username': username,
        'password': password,
      });

      if (response.success && response.data != null) {
        final data = response.data! as Map<String, dynamic>;
        final token = data['token'] as String;
        final userId = data['userId'] as String;

        await _storageService.write(AppConstants.keyAuthToken, token);
        await _storageService.write(AppConstants.keyUserId, userId);

        if (data.containsKey('permissions')) {
          final permissions =
              (data['permissions'] as List<dynamic>?)?.cast<String>() ?? [];
          await _storageService.write(
            AppConstants.keyUserPermissions,
            permissions,
          );
        }

        final user = UserModel.fromJson(data['user'] as Map<String, dynamic>);

        LoggerUtils.i(
          'AuthRepository: Login successful for user: ${user.username}',
        );
        return user;
      } else {
        throw Failure.server(
          message: response.message,
          statusCode: response.code,
        );
      }
    }, _handleError);
  }

  TaskEither<Failure, UserModel> register({
    required String username,
    required String password,
    required String nickname,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await _client.register({
        'username': username,
        'password': password,
        'nickname': nickname,
      });

      if (response.success && response.data != null) {
        final data = response.data! as Map<String, dynamic>;
        final token = data['token'] as String;
        final userId = data['userId'] as String;

        await _storageService.write(AppConstants.keyAuthToken, token);
        await _storageService.write(AppConstants.keyUserId, userId);

        if (data.containsKey('permissions')) {
          final permissions =
              (data['permissions'] as List<dynamic>?)?.cast<String>() ?? [];
          await _storageService.write(
            AppConstants.keyUserPermissions,
            permissions,
          );
        }

        final user = UserModel.fromJson(data['user'] as Map<String, dynamic>);

        LoggerUtils.i(
          'AuthRepository: Registration successful for user: ${user.username}',
        );
        return user;
      } else {
        throw Failure.server(
          message: response.message,
          statusCode: response.code,
        );
      }
    }, _handleError);
  }

  TaskEither<Failure, void> logout() {
    return TaskEither.tryCatch(() async {
      try {
        await _client.logout();
      } catch (e, stackTrace) {
        LoggerUtils.e('AuthRepository: Logout API failed', e, stackTrace);
        // Continue to clear local session even if API fails
      } finally {
        await _storageService.remove(AppConstants.keyAuthToken);
        await _storageService.remove(AppConstants.keyUserId);
        await _storageService.remove(AppConstants.keyUserPermissions);
        await _storageService.remove(AppConstants.keyCart);
        LoggerUtils.i('AuthRepository: Local session cleared');
      }
    }, _handleError);
  }

  TaskEither<Failure, UserModel?> getCurrentUser() {
    return TaskEither.tryCatch(() async {
      final token = _storageService.read<String>(AppConstants.keyAuthToken);
      if (token == null || token.isEmpty) {
        LoggerUtils.w('AuthRepository: No auth token found');
        return null;
      }

      final response = await _client.getUserProfile();
      if (response.success && response.data != null) {
        LoggerUtils.i('AuthRepository: Current user fetched successfully');
        return response.data;
      } else {
        throw Failure.server(
          message: response.message,
          statusCode: response.code,
        );
      }
    }, _handleError);
  }

  TaskEither<Failure, UserModel> updateUserInfo(Map<String, dynamic> data) {
    return TaskEither.tryCatch(() async {
      final response = await _client.updateUserProfile(data);
      if (response.success && response.data != null) {
        LoggerUtils.i('AuthRepository: User info updated successfully');
        return response.data!;
      } else {
        throw Failure.server(
          message: response.message,
          statusCode: response.code,
        );
      }
    }, _handleError);
  }

  TaskEither<Failure, void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await _client.changePassword({
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      });

      if (!response.success) {
        throw Failure.server(
          message: response.message,
          statusCode: response.code,
        );
      }

      LoggerUtils.i('AuthRepository: Password changed successfully');
    }, _handleError);
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

  TaskEither<Failure, void> refreshToken() {
    return TaskEither.tryCatch(() async {
      final token = getAuthToken();
      if (token == null) {
        throw const Failure.unauthorized();
      }

      final response = await _client.refreshToken({'token': token});
      if (response.success && response.data != null) {
        final newToken = response.data!['token'] as String;
        await _storageService.write(AppConstants.keyAuthToken, newToken);
        LoggerUtils.i('AuthRepository: Token refreshed successfully');
      } else {
        throw Failure.server(
          message: response.message,
          statusCode: response.code,
        );
      }
    }, _handleError);
  }

  TaskEither<Failure, void> sendVerificationCode(String phone) {
    return TaskEither.tryCatch(() async {
      final response = await _client.sendVerificationCode({'phone': phone});
      if (!response.success) {
        throw Failure.server(
          message: response.message,
          statusCode: response.code,
        );
      }
    }, _handleError);
  }

  TaskEither<Failure, bool> verifyCode({
    required String phone,
    required String code,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await _client.verifyCode({'phone': phone, 'code': code});
      if (response.success && response.data != null) {
        return response.data!['valid'] as bool;
      } else {
        throw Failure.server(
          message: response.message,
          statusCode: response.code,
        );
      }
    }, _handleError);
  }

  Failure _handleError(Object error, StackTrace stackTrace) {
    LoggerUtils.e('AuthRepository Error', error, stackTrace);
    if (error is Failure) {
      return error;
    }
    if (error is DioException) {
      return Failure.network(
        message: error.message ?? 'Unknown network error',
        statusCode: error.response?.statusCode,
      );
    }
    return Failure.server(message: error.toString(), statusCode: 500);
  }
}
