import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../values/app_constants.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_handling_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

part 'dio_provider.g.dart';

/// Provides a configured Dio instance for HTTP requests.
///
/// This provider creates a Dio client with:
/// - Base URL and timeout configurations
/// - Authentication interceptor for token management
/// - Logging interceptor for debugging
/// - Error handling interceptor for user-friendly error messages
///
/// The provider is kept alive to maintain a single Dio instance throughout
/// the app lifecycle for better performance and connection pooling.
///
/// **Validates: Requirements 23.1, 23.2**
@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final options = BaseOptions(
    baseUrl: AppConstants.baseUrl,
    connectTimeout: AppConstants.connectTimeout,
    receiveTimeout: AppConstants.receiveTimeout,
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
  );

  final dio = Dio(options);

  // Add interceptors in order:
  // 1. Auth interceptor - adds authentication tokens
  // 2. Logging interceptor - logs requests/responses for debugging
  // 3. Error handling interceptor - transforms errors to user-friendly messages
  dio.interceptors.addAll([
    ref.read(authInterceptorProvider),
    ref.read(loggingInterceptorProvider),
    ref.read(errorHandlingInterceptorProvider),
  ]);

  return dio;
}
