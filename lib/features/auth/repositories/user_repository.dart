import 'dart:convert';

import 'package:lunchbox/core/services/services.dart';
import 'package:lunchbox/features/auth/datasources/auth_rest_client.dart';
import 'package:lunchbox/features/auth/entities/user_model.dart';
import 'package:lunchbox/features/profile/datasources/profile_rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  final authDataSource = ref.watch(authRemoteDataSourceProvider);
  final profileClient = ref.watch(profileRestClientProvider);
  final storageService = ref.watch(storageServiceProvider);
  return UserRepository(authDataSource, profileClient, storageService);
}

/// 用户仓库类
/// 负责处理用户相关的数据访问和业务逻辑
class UserRepository {
  UserRepository(this._client, this._profileClient, this._storage);

  final AuthRemoteDataSource _client;
  final ProfileRestClient _profileClient;
  final StorageService _storage;

  static const String userStorageKey = 'user_info';
  static const String tokenStorageKey = 'auth_token';

  /// 用户登录
  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    final response = await _client.login({
      'nickname': username,
      'password': password,
    });

    if (response.success && response.data != null) {
      final data = response.data!;
      final token = data.token;
      final userId = data.id.toString();
      final user = UserModel(
        id: userId,
        username: data.telephone ?? username,
        phone: data.telephone,
        nickname: data.telephone ?? username,
        registeredAt: data.createdAt ?? '',
      );

      _saveUserInfo(user);
      _saveToken(token);
      return user;
    }
    throw response.message;
  }

  /// 用户注册
  Future<UserModel> register({
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    final registerData = {
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };

    final response = await _client.register(registerData);

    if (response.success && response.data != null) {
      final data = response.data!;
      final token = data.token;
      final userId = data.id.toString();
      final user = UserModel(
        id: userId,
        username: data.telephone ?? email,
        phone: data.telephone,
        nickname: data.telephone ?? email,
        registeredAt: data.createdAt ?? '',
      );

      _saveUserInfo(user);
      _saveToken(token);
      return user;
    }
    throw response.message;
  }

  /// 用户登出
  Future<bool> logout() async {
    try {
      await _profileClient.logout();
    } catch (e) {
      // Ignore API error on logout
    }
    _clearUserInfo();
    return true;
  }

  /// 获取当前用户信息
  Future<UserModel?> getCurrentUser() async {
    final response = await _profileClient.getProfile();
    if (response.success && response.data != null) {
      final user = UserModel.fromProfile(response.data!);
      _saveUserInfo(user);
      return user;
    }
    return _getCachedUser();
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
