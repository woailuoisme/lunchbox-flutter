import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/utils/logger_utils.dart';
import '../models/api_response_model.dart';

part 'api_provider.g.dart';

@Riverpod(keepAlive: true)
ApiProvider apiProvider(Ref ref) {
  return ApiProvider();
}

/// API提供者
/// 负责处理与服务器的网络通信
class ApiProvider {
  /// 构造函数
  ApiProvider() {
    _setupDio();
  }
  final Dio _dio = Dio();

  /// 配置Dio实例
  void _setupDio() {
    // 设置基础URL
    _dio.options.baseUrl =
        'https://api.example.com'; // TODO(User): 配置实际的 API 地址

    // 设置超时时间
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);

    // 添加请求拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // 在发送请求前，可以添加认证token等
          // TODO(User): 实现 token 获取逻辑
          // final token = getAuthToken();
          // if (token != null) {
          //   options.headers['Authorization'] = 'Bearer $token';
          // }

          // 记录请求日志
          LoggerUtils.d('API Request: ${options.method} ${options.uri}');
          LoggerUtils.d('Request Headers: ${options.headers}');
          LoggerUtils.d('Request Data: ${options.data}');

          return handler.next(options);
        },
        onResponse: (response, handler) {
          // 记录响应日志
          LoggerUtils.d(
            'API Response: ${response.statusCode} ${response.requestOptions.uri}',
          );
          LoggerUtils.d('Response Data: ${response.data}');

          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // 记录错误日志
          LoggerUtils.e('API Error: ${e.message}');
          LoggerUtils.e('Error Details: ${e.response?.data}');

          return handler.next(e);
        },
      ),
    );
  }

  /// 发送GET请求
  Future<ApiResponseModel<T>> get<T>(
    String path,
    T Function(Object?) fromJsonT, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
      );

      if (response.data is Map<String, dynamic>) {
        return ApiResponseModel.fromJson(
          response.data as Map<String, dynamic>,
          fromJsonT,
        );
      } else {
        return ApiResponseModel.failure('Invalid response format');
      }
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      return ApiResponseModel.failure('Unknown error: $e');
    }
  }

  /// 发送POST请求
  Future<ApiResponseModel<T>> post<T>(
    String path,
    Object? data,
    T Function(Object?) fromJsonT, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      if (response.data is Map<String, dynamic>) {
        return ApiResponseModel.fromJson(
          response.data as Map<String, dynamic>,
          fromJsonT,
        );
      } else {
        return ApiResponseModel.failure('Invalid response format');
      }
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      return ApiResponseModel.failure('Unknown error: $e');
    }
  }

  /// 发送PUT请求
  Future<ApiResponseModel<T>> put<T>(
    String path,
    Object? data,
    T Function(Map<String, dynamic>) fromJsonT, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.put<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      if (response.data is Map<String, dynamic>) {
        return ApiResponseModel.fromJson(
          response.data as Map<String, dynamic>,
          (json) {
            if (json is Map<String, dynamic>) {
              return fromJsonT(json);
            }
            return fromJsonT(json! as Map<String, dynamic>);
          },
        );
      } else {
        return ApiResponseModel.failure('Invalid response format');
      }
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      return ApiResponseModel.failure('Unknown error: $e');
    }
  }

  /// 发送DELETE请求
  Future<ApiResponseModel<T>> delete<T>(
    String path,
    T Function(Map<String, dynamic>) fromJsonT, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.delete<dynamic>(
        path,
        queryParameters: queryParameters,
      );

      if (response.data is Map<String, dynamic>) {
        return ApiResponseModel.fromJson(
          response.data as Map<String, dynamic>,
          (json) {
            if (json is Map<String, dynamic>) {
              return fromJsonT(json);
            }
            return fromJsonT(json! as Map<String, dynamic>);
          },
        );
      } else {
        return ApiResponseModel.failure('Invalid response format');
      }
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      return ApiResponseModel.failure('Unknown error: $e');
    }
  }

  /// 处理网络错误
  ApiResponseModel<T> _handleError<T>(DioException e) {
    String errorMessage = 'Network error';
    int errorCode = -1;

    if (e.response != null) {
      // 服务器返回错误状态码
      errorCode = e.response!.statusCode ?? -1;

      if (e.response!.data is Map<String, dynamic>) {
        final data = e.response!.data as Map<String, dynamic>;
        errorMessage = data['message'] as String? ?? 'Server error';
      } else {
        errorMessage = 'Server returned: $errorCode';
      }
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      errorMessage = 'Connection timeout';
    } else if (e.type == DioExceptionType.unknown) {
      errorMessage = 'No internet connection';
    }

    return ApiResponseModel.failure(errorMessage, code: errorCode);
  }

  /// 上传文件
  Future<ApiResponseModel<T>> uploadFile<T>(
    String path,
    String filePath,
    String fileName,
    T Function(Object?) fromJsonT, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
        ...?data,
      });

      final response = await _dio.post<dynamic>(
        path,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      if (response.data is Map<String, dynamic>) {
        return ApiResponseModel.fromJson(
          response.data as Map<String, dynamic>,
          fromJsonT,
        );
      } else {
        return ApiResponseModel.failure('Invalid response format');
      }
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      return ApiResponseModel.failure('Upload failed: $e');
    }
  }
}
