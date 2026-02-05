import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/storage_service.dart';
import '../../../core/utils/logger_utils.dart';
import '../../../shared/models/api_response_model.dart';
import '../../../shared/services/api_provider.dart';
import '../../../shared/services/base_repository.dart';
import '../../../shared/services/mock_provider.dart';
import '../models/user_model.dart';

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  final apiProvider = ref.watch(apiProviderProvider);
  final mockProvider = ref.watch(mockProviderProvider);
  final storageService = ref.watch(storageServiceProvider);
  return UserRepository(apiProvider, mockProvider, storageService);
}

/// 用户仓库类
/// 负责处理用户相关的数据访问和业务逻辑
class UserRepository extends BaseRepository {
  UserRepository(super.apiService, super.mockService, this._storage);
  static const String userStorageKey = 'user_info';
  static const String tokenStorageKey = 'auth_token';

  final StorageService _storage;

  /// 用户登录
  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    return handleResponse(() async {
      final loginData = {'username': username, 'password': password};

      if (useMockData) {
        final response = await mockService.login(loginData);
        // 保存用户信息和token
        if (response.isSuccess && response.data != null) {
          final data = response.data!;
          final user = UserModel.fromJson(data['user'] as Map<String, dynamic>);
          final token = data['token'] as String;
          _saveUserInfo(user);
          _saveToken(token);
          return ApiResponseModel.success(user);
        }
        return ApiResponseModel.failure(response.message);
      } else {
        final response = await apiService.post('/api/auth/login', loginData, (
          json,
        ) {
          final map = json! as Map<String, dynamic>;
          final data = map['data'];
          return {
            'user': UserModel.fromJson(data['user'] as Map<String, dynamic>),
            'token': data['token'],
          };
        });

        if (response.isSuccess && response.data != null) {
          final user = response.data!['user'] as UserModel;
          final token = response.data!['token'] as String;
          _saveUserInfo(user);
          _saveToken(token);
          return ApiResponseModel.success(user);
        }
        return ApiResponseModel.failure(response.message);
      }
    }, '用户登录');
  }

  /// 用户注册
  Future<UserModel> register({
    required String username,
    required String password,
    required String nickname,
    String? phone,
    String? email,
  }) async {
    return handleResponse(() async {
      final registerData = {
        'username': username,
        'password': password,
        'nickname': nickname,
        'phone': ?phone,
        'email': ?email,
      };

      if (useMockData) {
        final response = await mockService.register(registerData);
        return response;
      } else {
        return apiService.post(
          '/api/auth/register',
          registerData,
          (json) => UserModel.fromJson(
            (json! as Map<String, dynamic>)['data'] as Map<String, dynamic>,
          ),
        );
      }
    }, '用户注册');
  }

  /// 用户登出
  Future<bool> logout() async {
    try {
      if (!useMockData) {
        await apiService.post(
          '/api/auth/logout',
          <String, dynamic>{},
          (json) => <String, dynamic>{},
        );
      }

      // 清除本地存储的用户信息和token
      _clearUserInfo();
      _clearToken();

      return true;
    } catch (e) {
      // 即使API调用失败，也清除本地数据
      _clearUserInfo();
      _clearToken();
      return true;
    }
  }

  /// 获取当前登录用户信息
  Future<UserModel?> getCurrentUser() async {
    final userInfo = _getUserInfo();
    if (userInfo == null) {
      return null;
    }

    // 从服务器获取最新的用户信息
    try {
      if (!useMockData) {
        final updatedUser = await apiService.get(
          '/api/users/profile',
          (json) => UserModel.fromJson(json! as Map<String, dynamic>),
        );

        if (updatedUser.isSuccess && updatedUser.data != null) {
          _saveUserInfo(updatedUser.data!);
          return updatedUser.data!;
        }
      }
    } catch (e) {
      // 如果获取失败，返回本地缓存的用户信息
      LoggerUtils.e('获取用户信息失败', e);
    }

    return userInfo;
  }

  /// 更新用户信息
  Future<UserModel> updateUserProfile({
    String? nickname,
    String? avatar,
    String? phone,
    String? email,
    String? gender,
    DateTime? birthday,
  }) async {
    return handleResponse(() async {
      final updateData = {
        'nickname': ?nickname,
        'avatar': ?avatar,
        'phone': ?phone,
        'email': ?email,
        'gender': ?gender,
        if (birthday != null) 'birthday': birthday.toIso8601String(),
      };

      if (useMockData) {
        // 在Mock数据中模拟更新用户信息
        final currentUser = _getUserInfo();
        if (currentUser == null) {
          throw Exception('用户未登录');
        }

        final updatedUser = currentUser.copyWith(
          nickname: nickname ?? currentUser.nickname,
          avatar: avatar ?? currentUser.avatar,
          phone: phone ?? currentUser.phone,
          email: email ?? currentUser.email,
          gender: gender ?? currentUser.gender,
          birthday: birthday ?? currentUser.birthday,
        );

        _saveUserInfo(updatedUser);
        return ApiResponseModel.success(updatedUser);
      } else {
        final response = await apiService.put(
          '/api/users/profile',
          updateData,
          (json) => UserModel.fromJson(json['data'] as Map<String, dynamic>),
        );

        if (response.isSuccess && response.data != null) {
          _saveUserInfo(response.data!);
        }

        return response;
      }
    }, '更新用户信息');
  }

  /// 修改密码
  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    return handleResponse(() async {
      final passwordData = {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      };

      if (useMockData) {
        // 在Mock数据中模拟修改密码
        return ApiResponseModel.success(true);
      } else {
        return apiService.put(
          '/api/users/password',
          passwordData,
          (json) => json['data'] as bool,
        );
      }
    }, '修改密码');
  }

  /// 添加常用设备
  Future<bool> addFavoriteDevice(String deviceId) async {
    return handleResponse(() async {
      if (useMockData) {
        // 在Mock数据中模拟添加常用设备
        final currentUser = _getUserInfo();
        if (currentUser == null) {
          throw Exception('用户未登录');
        }

        final favoriteDevices = [...currentUser.favoriteDevices, deviceId];
        final updatedUser = currentUser.copyWith(
          favoriteDevices: favoriteDevices,
        );

        _saveUserInfo(updatedUser);
        return ApiResponseModel.success(true);
      } else {
        return apiService.post(
          '/api/users/favorite-devices',
          {'deviceId': deviceId},
          (json) => (json! as Map<String, dynamic>)['data'] as bool,
        );
      }
    }, '添加常用设备');
  }

  /// 移除常用设备
  Future<bool> removeFavoriteDevice(String deviceId) async {
    return handleResponse(() async {
      if (useMockData) {
        // 在Mock数据中模拟移除常用设备
        final currentUser = _getUserInfo();
        if (currentUser == null) {
          throw Exception('用户未登录');
        }

        final favoriteDevices = currentUser.favoriteDevices
            .where((id) => id != deviceId)
            .toList();

        final updatedUser = currentUser.copyWith(
          favoriteDevices: favoriteDevices,
        );

        _saveUserInfo(updatedUser);
        return ApiResponseModel.success(true);
      } else {
        return apiService.delete(
          '/api/users/favorite-devices/$deviceId',
          (json) => json['data'] as bool,
        );
      }
    }, '移除常用设备');
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
}
