import 'package:lunchbox/core/constants/app_constants.dart';
import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/auth/datasources/auth_rest_client.dart';
import 'package:lunchbox/features/auth/entities/user_model.dart';
import 'package:lunchbox/features/profile/datasources/profile_rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart' as google;

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final profileClient = ref.watch(profileRestClientProvider);
  final storageService = ref.watch(storageServiceProvider);
  return AuthRepository(remoteDataSource, profileClient, storageService);
}

class AuthRepository {
  AuthRepository(
    this._remoteDataSource,
    this._profileClient,
    this._storageService,
  );

  final AuthRemoteDataSource _remoteDataSource;
  final ProfileRestClient _profileClient;
  final StorageService _storageService;

  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    final response = await _remoteDataSource.login({
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

      await _writeSession(token: token, userId: userId, permissions: ['user']);

      LoggerUtils.i(
        'AuthRepository: Login successful for user: ${user.username}',
      );
      return user;
    }
    throw response.message;
  }

  Future<UserModel> register({
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await _remoteDataSource.register({
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });

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

      await _writeSession(token: token, userId: userId, permissions: ['user']);

      LoggerUtils.i(
        'AuthRepository: Registration successful for user: ${user.username}',
      );
      return user;
    }
    throw response.message;
  }

  Future<UserModel> loginWithGoogle() async {
    try {
      final signIn = google.GoogleSignIn.instance;

      // Request authentication
      await signIn.authenticate();

      // In 7.0+, results are stream-based. Get the user from events or current state if available.
      final googleUser = await signIn.authenticationEvents
          .where(
            (event) => event is google.GoogleSignInAuthenticationEventSignIn,
          )
          .map(
            (event) =>
                (event as google.GoogleSignInAuthenticationEventSignIn).user,
          )
          .first;

      // Get authentication details
      final googleAuth = googleUser.authentication;
      final idToken = googleAuth.idToken;

      if (idToken == null) {
        throw 'Google ID Token is null';
      }

      // Call backend to verify token and login
      final response = await _remoteDataSource.socialLogin('google', {
        'token': idToken,
      });

      if (response.success && response.data != null) {
        final data = response.data!;
        final token = data.token;
        final userId = data.id.toString();
        final user = UserModel(
          id: userId,
          username: data.telephone ?? googleUser.email,
          phone: data.telephone,
          nickname: googleUser.displayName ?? googleUser.email,
          registeredAt: data.createdAt ?? DateTime.now().toIso8601String(),
          avatar: googleUser.photoUrl,
        );

        await _writeSession(
          token: token,
          userId: userId,
          permissions: ['user'],
        );

        LoggerUtils.i(
          'AuthRepository: Google login successful: ${user.username}',
        );
        return user;
      }
      throw response.message;
    } catch (e) {
      if (e.toString().contains('canceled')) {
        throw 'Google sign in cancelled';
      }
      LoggerUtils.e('AuthRepository: Google sign in failed', e);
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _profileClient.logout();
    } catch (e) {
      LoggerUtils.w(
        'AuthRepository: Logout API failed, continuing local logout',
      );
    }
    // 仅清除认证相关的 Token 和用户信息，保留 keyIsFirstLaunch 等配置数据
    await _storageService.remove(AppConstants.keyAuthToken);
    await _storageService.remove(AppConstants.keyUserId);
    await _storageService.remove(AppConstants.keyUserPermissions);
    // 可选：清除购物车
    await _storageService.remove(AppConstants.keyCart);

    LoggerUtils.i('AuthRepository: User logged out');
  }

  Future<void> resetPassword({
    required String email,
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final response = await _remoteDataSource.resetPassword({
      'email': email,
      'old_password': oldPassword,
      'new_password': newPassword,
      'new_password_confirmation': confirmPassword,
    });

    if (!response.success) {
      throw response.message;
    }
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
