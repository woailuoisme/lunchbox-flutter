import 'package:dio/dio.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logging_interceptor.g.dart';

/// Logging interceptor for Dio HTTP client.
///
/// This interceptor logs all HTTP requests, responses, and errors for debugging
/// and monitoring purposes. It provides detailed information about network calls
/// including headers, body, status codes, and timing.
///
/// **Validates: Requirements 23.1, 23.2**
@Riverpod(keepAlive: true)
LoggingInterceptor loggingInterceptor(Ref ref) {
  return LoggingInterceptor();
}

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    LoggerUtils.d(
      '┌─────────────────────────────────────────────────────────────────',
    );
    LoggerUtils.d('│ REQUEST: ${options.method} ${options.uri}');
    LoggerUtils.d('│ Headers: ${options.headers}');

    if (options.data != null) {
      LoggerUtils.d('│ Body: ${options.data}');
    }

    if (options.queryParameters.isNotEmpty) {
      LoggerUtils.d('│ Query Parameters: ${options.queryParameters}');
    }

    LoggerUtils.d(
      '└─────────────────────────────────────────────────────────────────',
    );

    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    LoggerUtils.d(
      '┌─────────────────────────────────────────────────────────────────',
    );
    LoggerUtils.d(
      '│ RESPONSE: ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.uri}',
    );
    LoggerUtils.d('│ Headers: ${response.headers}');

    if (response.data != null) {
      LoggerUtils.d('│ Body: ${response.data}');
    }

    LoggerUtils.d(
      '└─────────────────────────────────────────────────────────────────',
    );

    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    LoggerUtils.e(
      '┌─────────────────────────────────────────────────────────────────',
    );
    LoggerUtils.e(
      '│ ERROR: ${err.requestOptions.method} ${err.requestOptions.uri}',
    );
    LoggerUtils.e('│ Type: ${err.type}');
    LoggerUtils.e('│ Message: ${err.message}');

    if (err.response != null) {
      LoggerUtils.e('│ Status Code: ${err.response?.statusCode}');
      LoggerUtils.e('│ Response Data: ${err.response?.data}');
    }

    LoggerUtils.e(
      '└─────────────────────────────────────────────────────────────────',
      err,
      err.stackTrace,
    );

    return handler.next(err);
  }
}
