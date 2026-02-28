import 'package:lunchbox/core/constants/app_constants.dart';
import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/auth/datasources/auth_rest_client.dart';
import 'package:lunchbox/features/auth/entities/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:lunchbox/core/errors/failure.dart';

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

  Future<void> sendVerificationCode(String phone) async {
    final response = await _remoteDataSource.sendCode(phone);
    if (!response.success) {
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }
  }

  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    // 临时绕过逻辑：admin/admin 直接登录（用于服务端不可用时）
    if (username == 'admin' && password == 'admin') {
      LoggerUtils.i('AuthRepository: Using admin bypass login');
      final testUser = UserModel(
        id: 'admin_bypass_id',
        username: 'admin',
        nickname: '管理员(离线模式)',
        registeredAt: DateTime(2024),
      );

      await _writeSession(
        token: 'bypass_token_admin',
        userId: testUser.id,
        permissions: ['admin', 'user'],
      );

      return testUser;
    }

    final response = await _remoteDataSource.login({'nickname': username});

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

      await _writeSession(token: token, userId: userId, permissions: ['user']);

      LoggerUtils.i(
        'AuthRepository: Login successful for user: ${user.username}',
      );
      return user;
    }
    throw Failure.server(message: response.message, statusCode: response.code);
  }

  Future<UserModel> loginWithPhone({
    required String phone,
    required String code,
  }) async {
    final response = await _remoteDataSource.loginWithPhone(phone, code);
    if (response.success && response.data != null) {
      return _handleAuthData(
        response.data! as Map<String, dynamic>,
        'Login successful',
      );
    }
    throw Failure.server(message: response.message, statusCode: response.code);
  }

  Future<UserModel> register({
    required String username,
    required String password,
    required String nickname,
  }) async {
    final response = await _remoteDataSource.register({
      'username': username,
      'password': password,
      'nickname': nickname,
    });

    if (response.success && response.data != null) {
      return _handleAuthData(
        response.data! as Map<String, dynamic>,
        'Registration successful',
      );
    }
    throw Failure.server(message: response.message, statusCode: response.code);
  }

  Future<UserModel> loginWithGoogle() async {
    // Mock Google Login
    final user = UserModel(
      id: 'google_user_mock',
      username: 'mock@google.com',
      nickname: 'Google User',
      registeredAt: DateTime.now(),
    );

    await _writeSession(
      token: 'mock_google_token',
      userId: user.id,
      permissions: ['user'],
    );
    return user;
  }

  Future<void> logout() async {
    try {
      await _remoteDataSource.logout();
    } catch (e) {
      LoggerUtils.w(
        'AuthRepository: Logout API failed, continuing local logout',
      );
    }
    await _storageService.clear();
    LoggerUtils.i('AuthRepository: User logged out');
  }

  /// 仅清除 Token
  Future<void> clearToken() async {
    await _storageService.remove(AppConstants.keyAuthToken);
    LoggerUtils.i('AuthRepository: Auth token cleared (401)');
  }

  bool isLoggedIn() {
    return _storageService.read<String>(AppConstants.keyAuthToken) != null;
  }

  UserModel _handleAuthData(Map<String, dynamic> data, String logMessage) {
    final token = data['token'] as String;
    final user = UserModel.fromJson(data['user'] as Map<String, dynamic>);

    _writeSession(
      token: token,
      userId: user.id,
      permissions:
          (data['permissions'] as List<dynamic>?)?.cast<String>() ?? ['user'],
    );

    LoggerUtils.i('AuthRepository: $logMessage for user: ${user.username}');
    return user;
  }

  Future<void> _writeSession({
    required String token,
    required String userId,
    required List<String> permissions,
  }) async {
    await _storageService.write(AppConstants.keyAuthToken, token);
    await _storageService.write(AppConstants.keyUserId, userId);
    await _storageService.write(AppConstants.keyUserPermissions, permissions);
  }
}
