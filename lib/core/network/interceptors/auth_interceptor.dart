import 'package:dio/dio.dart';
import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/core/constants/app_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_interceptor.g.dart';

/// Authentication interceptor for Dio HTTP client.
///
/// This interceptor automatically adds authentication tokens to outgoing requests
/// and handles token refresh when receiving 401 Unauthorized responses.
///
/// **Validates: Requirements 23.1, 23.2**
@Riverpod(keepAlive: true)
AuthInterceptor authInterceptor(Ref ref) {
  return AuthInterceptor(ref);
}

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._ref);
  final Ref _ref;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Get the auth token from storage
    final storage = _ref.read(storageServiceProvider);
    final token = storage.read<String>(AppConstants.keyAuthToken);

    // Add Authorization header if token exists
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Handle 401 Unauthorized - token expired or invalid
    if (err.response?.statusCode == 401) {
      // TODO(User): Implement token refresh logic when auth repository is available
      // For now, just clear the token and let the app redirect to login
      final storage = _ref.read(storageServiceProvider);
      await storage.remove(AppConstants.keyAuthToken);
      await storage.remove(AppConstants.keyUserId);
    }

    return handler.next(err);
  }
}
