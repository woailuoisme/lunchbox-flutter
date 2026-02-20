import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lunchbox/core/errors/errors.dart';
import 'package:lunchbox/core/network/network.dart';
import 'package:lunchbox/core/services/services.dart';
import 'package:lunchbox/core/utils/utils.dart';
import 'package:lunchbox/features/auth/entities/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  final restClient = ref.watch(restClientProvider);
  final storageService = ref.watch(storageServiceProvider);
  return UserRepository(restClient, storageService);
}

/// 用户仓库类
/// 负责处理用户相关的数据访问和业务逻辑
class UserRepository {
  UserRepository(this._client, this._storage);

  final RestClient _client;
  final StorageService _storage;

  static const String userStorageKey = 'user_info';
  static const String tokenStorageKey = 'auth_token';

  /// 用户登录
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
        return _handleAuthResponse(data);
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 用户注册
  TaskEither<Failure, UserModel> register({
    required String username,
    required String password,
    required String nickname,
    String? phone,
    String? email,
  }) {
    return TaskEither.tryCatch(() async {
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
    }, _handleError);
  }

  /// 用户登出
  TaskEither<Failure, bool> logout() {
    return TaskEither.tryCatch(() async {
      try {
        await _client.logout();
      } catch (e) {
        // Ignore API error on logout
      } finally {
        _clearUserInfo();
        _clearToken();
      }
      return true;
    }, _handleError);
  }

  /// 获取当前登录用户信息
  TaskEither<Failure, UserModel?> getCurrentUser() {
    return TaskEither.tryCatch(() async {
      final userInfo = _getUserInfo();
      if (userInfo == null) {
        return null;
      }

      try {
        final response = await _client.getUserProfile();
        if (response.success && response.data != null) {
          _saveUserInfo(response.data!);
          return response.data;
        }
      } catch (e) {
        LoggerUtils.e('获取用户信息失败', e);
      }
      return userInfo;
    }, _handleError);
  }

  /// 更新用户信息
  TaskEither<Failure, UserModel> updateUserProfile({
    String? nickname,
    String? avatar,
    String? phone,
    String? email,
    String? gender,
    DateTime? birthday,
  }) {
    return TaskEither.tryCatch(() async {
      final updateData = {
        'nickname': ?nickname,
        'avatar': ?avatar,
        'phone': ?phone,
        'email': ?email,
        'gender': ?gender,
        if (birthday != null) 'birthday': birthday.toIso8601String(),
      };

      final response = await _client.updateUserProfile(updateData);
      if (response.success && response.data != null) {
        _saveUserInfo(response.data!);
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 修改密码
  TaskEither<Failure, bool> changePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await _client.changePassword({
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      });

      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 添加常用设备
  TaskEither<Failure, bool> addFavoriteDevice(String deviceId) {
    return TaskEither.tryCatch(() async {
      final response = await _client.addFavoriteDevice({'deviceId': deviceId});
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 移除常用设备
  TaskEither<Failure, bool> removeFavoriteDevice(String deviceId) {
    return TaskEither.tryCatch(() async {
      final response = await _client.removeFavoriteDevice(deviceId);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 检查用户是否已登录
  bool isLoggedIn() {
    return _getToken() != null;
  }

  /// 保存用户信息到本地存储
  void _saveUserInfo(UserModel userInfo) {
    _storage.write(userStorageKey, jsonEncode(userInfo.toJson()));
  }

  /// 从本地存储获取用户信息
  UserModel? _getUserInfo() {
    final jsonStr = _storage.read<String>(userStorageKey);
    if (jsonStr == null) {
      return null;
    }
    try {
      final userData = jsonDecode(jsonStr);
      return UserModel.fromJson(userData as Map<String, dynamic>);
    } catch (e) {
      LoggerUtils.e('Failed to parse user info', e);
      return null;
    }
  }

  /// 清除本地存储的用户信息
  void _clearUserInfo() {
    _storage.remove(userStorageKey);
  }

  /// 保存认证token到本地存储
  void _saveToken(String token) {
    _storage.write(tokenStorageKey, token);
  }

  /// 从本地存储获取认证token
  String? _getToken() {
    return _storage.read<String>(tokenStorageKey);
  }

  /// 清除本地存储的认证token
  void _clearToken() {
    _storage.remove(tokenStorageKey);
  }

  UserModel _handleAuthResponse(Map<String, dynamic> data) {
    final user = _parseUser(data);
    _saveUserInfo(user);
    final token = data['token'] as String?;
    if (token != null && token.isNotEmpty) {
      _saveToken(token);
    }
    return user;
  }

  UserModel _parseUser(Map<String, dynamic> data) {
    final rawUser = data['user'];
    if (rawUser is Map<String, dynamic>) {
      return UserModel.fromJson(rawUser);
    }
    return UserModel.fromJson(data);
  }

  Failure _handleError(Object error, StackTrace stackTrace) {
    if (error is DioException) {
      return Failure.network(
        message: error.message ?? 'Unknown network error',
        statusCode: error.response?.statusCode,
      );
    }
    return Failure.server(message: error.toString(), statusCode: 500);
  }
}
