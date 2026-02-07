import 'package:dio/dio.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'error_handling_interceptor.g.dart';

/// Error handling interceptor for Dio HTTP client.
///
/// This interceptor transforms DioExceptions into more user-friendly error
/// messages and handles common error scenarios like timeouts, connection
/// failures, and server errors.
///
/// **Validates: Requirements 23.1, 23.2**
@Riverpod(keepAlive: true)
ErrorHandlingInterceptor errorHandlingInterceptor(Ref ref) {
  return ErrorHandlingInterceptor();
}

class ErrorHandlingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Enhance error with more context
    final enhancedError = _enhanceError(err);

    // Log the error
    LoggerUtils.e(
      'Network Error: ${enhancedError.message}',
      enhancedError,
      enhancedError.stackTrace,
    );

    return handler.next(enhancedError);
  }

  /// Enhances DioException with more detailed error messages
  DioException _enhanceError(DioException err) {
    String message;

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        message = t.network.errors.connectionTimeout;
        break;
      case DioExceptionType.sendTimeout:
        message = t.network.errors.sendTimeout;
        break;
      case DioExceptionType.receiveTimeout:
        message = t.network.errors.receiveTimeout;
        break;
      case DioExceptionType.badCertificate:
        message = t.network.errors.badCertificate;
        break;
      case DioExceptionType.badResponse:
        message = _handleBadResponse(err);
        break;
      case DioExceptionType.cancel:
        message = t.network.errors.cancel;
        break;
      case DioExceptionType.connectionError:
        message = t.network.errors.connectionError;
        break;
      case DioExceptionType.unknown:
        message = t.network.errors.unknown(
          error: err.message ?? t.network.errors.retryLater,
        );
        break;
    }

    return DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: err.error,
      stackTrace: err.stackTrace,
      message: message,
    );
  }

  /// Handles bad response errors (4xx, 5xx status codes)
  String _handleBadResponse(DioException err) {
    final statusCode = err.response?.statusCode;
    final data = err.response?.data;

    // Try to extract error message from response
    String? serverMessage;
    if (data is Map<String, dynamic>) {
      serverMessage =
          data['message'] as String? ??
          data['error'] as String? ??
          data['msg'] as String?;
    }

    switch (statusCode) {
      case 400:
        return serverMessage ?? t.network.errors.badRequest;
      case 401:
        return serverMessage ?? t.network.errors.unauthorized;
      case 403:
        return serverMessage ?? t.network.errors.forbidden;
      case 404:
        return serverMessage ?? t.network.errors.notFound;
      case 408:
        return t.network.errors.timeout;
      case 409:
        return serverMessage ?? t.network.errors.conflict;
      case 422:
        if (data is Map<String, dynamic> && data['errors'] is Map) {
          final errors = data['errors'] as Map<String, dynamic>;
          final errorMessages = <String>[];
          errors.forEach((key, value) {
            if (value is List) {
              errorMessages.addAll(value.map((e) => e.toString()));
            } else {
              errorMessages.add(value.toString());
            }
          });
          if (errorMessages.isNotEmpty) {
            return errorMessages.join('\n');
          }
        }
        return serverMessage ?? t.network.errors.validationFailed;
      case 429:
        return t.network.errors.tooManyRequests;
      case 500:
        return serverMessage ?? t.network.errors.internalServerError;
      case 502:
        return t.network.errors.badGateway;
      case 503:
        return t.network.errors.serviceUnavailable;
      case 504:
        return t.network.errors.gatewayTimeout;
      default:
        if (statusCode != null && statusCode >= 500) {
          return serverMessage ??
              t.network.errors.serverError(code: statusCode.toString());
        } else if (statusCode != null && statusCode >= 400) {
          return serverMessage ??
              t.network.errors.requestError(code: statusCode.toString());
        }
        return serverMessage ?? t.network.errors.failed;
    }
  }
}
