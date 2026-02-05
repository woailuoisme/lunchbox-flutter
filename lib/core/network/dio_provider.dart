import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/interceptors/auth_interceptor.dart';
import 'package:lunchbox/core/network/interceptors/error_handling_interceptor.dart';
import 'package:lunchbox/core/values/app_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

/// Provides a configured Dio instance for HTTP requests.
///
/// This provider creates a Dio client with:
/// - Base URL and timeout configurations
/// - Authentication interceptor for token management
/// - PrettyDioLogger for debugging (controlled by AppConstants.dioDebug)
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
  // 2. Logging (if enabled) - logs requests/responses for debugging
  // 3. Error handling interceptor - transforms errors to user-friendly messages
  dio.interceptors.add(ref.read(authInterceptorProvider));

  if (AppConstants.dioDebug) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
  }

  dio.interceptors.add(ref.read(errorHandlingInterceptorProvider));

  return dio;
}
