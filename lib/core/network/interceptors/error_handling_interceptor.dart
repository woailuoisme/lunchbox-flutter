import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/logger_utils.dart';

part 'error_handling_interceptor.g.dart';

/// Error handling interceptor for Dio HTTP client.
///
/// This interceptor transforms DioExceptions into more user-friendly error
/// messages and handles common error scenarios like timeouts, connection
/// failures, and server errors.
///
/// **Validates: Requirements 23.1, 23.2**
@riverpod
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
        message = '连接超时，请检查网络连接';
        break;
      case DioExceptionType.sendTimeout:
        message = '发送请求超时，请检查网络连接';
        break;
      case DioExceptionType.receiveTimeout:
        message = '接收响应超时，请检查网络连接';
        break;
      case DioExceptionType.badCertificate:
        message = '证书验证失败';
        break;
      case DioExceptionType.badResponse:
        message = _handleBadResponse(err);
        break;
      case DioExceptionType.cancel:
        message = '请求已取消';
        break;
      case DioExceptionType.connectionError:
        message = '网络连接失败，请检查网络设置';
        break;
      case DioExceptionType.unknown:
        message = '未知错误：${err.message ?? "请稍后重试"}';
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
        return serverMessage ?? '请求参数错误';
      case 401:
        return serverMessage ?? '未授权，请重新登录';
      case 403:
        return serverMessage ?? '没有权限访问该资源';
      case 404:
        return serverMessage ?? '请求的资源不存在';
      case 408:
        return '请求超时，请重试';
      case 409:
        return serverMessage ?? '请求冲突';
      case 422:
        return serverMessage ?? '请求数据验证失败';
      case 429:
        return '请求过于频繁，请稍后重试';
      case 500:
        return serverMessage ?? '服务器内部错误';
      case 502:
        return '网关错误，请稍后重试';
      case 503:
        return '服务暂时不可用，请稍后重试';
      case 504:
        return '网关超时，请稍后重试';
      default:
        if (statusCode != null && statusCode >= 500) {
          return serverMessage ?? '服务器错误（$statusCode）';
        } else if (statusCode != null && statusCode >= 400) {
          return serverMessage ?? '请求错误（$statusCode）';
        }
        return serverMessage ?? '网络请求失败';
    }
  }
}
