import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:lunchbox/core/constants/app_constants.dart';
import 'package:lunchbox/core/network/interceptors/auth_interceptor.dart';
import 'package:lunchbox/core/network/interceptors/connectivity_interceptor.dart';
import 'package:lunchbox/core/network/interceptors/error_handling_interceptor.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_dio/sentry_dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

part 'dio_provider.g.dart';

/// Provides a configured Dio instance for HTTP requests.
///
/// This provider creates a Dio client with:
/// - Base URL and timeout configurations
/// - Connectivity interceptor to check for network before requests
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

  // 使用 Http2Adapter 支持 HTTP/2 协议
  dio.httpClientAdapter = Http2Adapter(
    ConnectionManager(
      idleTimeout: const Duration(seconds: 15),
      onClientCreate: (_, config) {
        // 如果启用了测试模式，忽略证书校验
        if (AppConstants.useTestMode) {
          config.onBadCertificate = (_) => true;
        }
      },
    ),
  );

  // Add interceptors in order:
  // 1. Connectivity interceptor - checks for network before requests
  // 2. Auth interceptor - adds authentication tokens
  // 3. Logging (if enabled) - logs requests/responses for debugging
  // 4. Error handling interceptor - transforms errors to user-friendly messages
  dio.interceptors.add(ref.read(connectivityInterceptorProvider));
  dio.interceptors.add(ref.read(authInterceptorProvider));

  if (AppConstants.dioDebug) {
    dio.interceptors.add(
      TalkerDioLogger(
        talker: LoggerUtils.instance,
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: false,
          printResponseMessage: true,
          printRequestData: true,
          printResponseData: true,
          printResponseTime: true,
        ),
      ),
    );
  }

  dio.interceptors.add(ref.read(errorHandlingInterceptorProvider));

  // Sentry 必须在所有拦截器和配置完成后最后调用
  // 详见: https://pub.dev/packages/sentry_dio
  dio.addSentry();

  return dio;
}
