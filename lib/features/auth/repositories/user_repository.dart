import 'dart:convert';

import 'package:lunchbox/core/errors/errors.dart';
import 'package:lunchbox/core/services/services.dart';
import 'package:lunchbox/features/auth/datasources/auth_rest_client.dart';
import 'package:lunchbox/features/auth/entities/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:lunchbox/core/errors/repository_error_handler_mixin.dart';

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  final authDataSource = ref.watch(authRemoteDataSourceProvider);
  final storageService = ref.watch(storageServiceProvider);
  return UserRepository(authDataSource, storageService);
}

/// 用户仓库类
/// 负责处理用户相关的数据访问和业务逻辑
class UserRepository with RepositoryErrorHandlerMixin {
  UserRepository(this._client, this._storage);

  final AuthRemoteDataSource _client;
  final StorageService _storage;

  static const String userStorageKey = 'user_info';
  static const String tokenStorageKey = 'auth_token';

  /// 用户登录
  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _client.login({'nickname': username});

      if (response.success && response.data != null) {
        final data = response.data! as Map<String, dynamic>;
        final token = data['token'] as String;
        final userId = data['id'].toString();
        final user = UserModel(
          id: userId,
          username: data['telephone'] as String,
          phone: data['telephone'] as String,
          nickname: data['telephone'] as String,
          registeredAt: DateTime.parse(data['created_at'] as String),
        );

        _saveUserInfo(user);
        _saveToken(token);
        return user;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }

  /// 用户注册
  Future<UserModel> register({
    required String username,
    required String password,
    required String nickname,
    String? phone,
    String? email,
  }) async {
    try {
      final registerData = {
        'username': username,
        'password': password,
        'nickname': nickname,
        'phone': phone,
        'email': email,
      };

      final response = await _client.register(registerData);

      if (response.success && response.data != null) {
        final data = response.data! as Map<String, dynamic>;
        return _handleAuthResponse(data);
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }

  /// 用户登出
  Future<bool> logout() async {
    try {
      try {
        await _client.logout();
      } catch (e) {
        // Ignore API error on logout
      }
      _clearUserInfo();
      return true;
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }

  /// 获取当前用户信息
  Future<UserModel?> getCurrentUser() async {
    try {
      final response = await _client.getMe();
      if (response.success && response.data != null) {
        final data = response.data! as Map<String, dynamic>;
        final user = UserModel.fromJson(data);
        _saveUserInfo(user);
        return user;
      }
      return _getCachedUser();
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }

  UserModel _handleAuthResponse(Map<String, dynamic> data) {
    final user = UserModel.fromJson(data['user'] as Map<String, dynamic>);
    final token = data['token'] as String;

    _saveUserInfo(user);
    _saveToken(token);

    return user;
  }

  void _saveUserInfo(UserModel user) {
    _storage.write(userStorageKey, jsonEncode(user.toJson()));
  }

  void _saveToken(String token) {
    _storage.write(tokenStorageKey, token);
  }

  void _clearUserInfo() {
    _storage.remove(userStorageKey);
    _storage.remove(tokenStorageKey);
  }

  UserModel? _getCachedUser() {
    final userData = _storage.read<String>(userStorageKey);
    if (userData != null) {
      return UserModel.fromJson(jsonDecode(userData) as Map<String, dynamic>);
    }
    return null;
  }
}
