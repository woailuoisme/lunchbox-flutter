# Network Layer

This directory contains the network layer configuration for the Lunchbox application, built on top of Dio HTTP client with Riverpod integration.

## Overview

The network layer provides a centralized, configured Dio instance with automatic authentication, logging, and error handling capabilities.

## Components

### Dio Provider (`dio_provider.dart`)

The main provider that creates and configures a Dio instance with:
- Base URL and timeout configurations from `AppConstants`
- Standard JSON headers
- Three interceptors for authentication, logging, and error handling

**Usage:**
```dart
@riverpod
Future<List<Device>> getDevices(Ref ref) async {
  final dio = ref.read(dioProvider);
  final response = await dio.get('/devices');
  return (response.data as List).map((json) => Device.fromJson(json)).toList();
}
```

### Interceptors

#### 1. AuthInterceptor (`interceptors/auth_interceptor.dart`)

Automatically manages authentication tokens:
- **Request Phase**: Adds `Authorization: Bearer <token>` header to all requests
- **Error Phase**: Handles 401 Unauthorized responses by clearing expired tokens

**Features:**
- Reads token from `StorageService`
- Automatically clears invalid tokens
- Prepares for future token refresh implementation

#### 2. LoggingInterceptor (`interceptors/logging_interceptor.dart`)

Logs all HTTP traffic for debugging:
- **Request Logs**: Method, URL, headers, body, query parameters
- **Response Logs**: Status code, headers, body
- **Error Logs**: Error type, message, status code, response data

**Features:**
- Formatted output with visual separators
- Uses `LoggerUtils` for consistent logging
- Includes full error stack traces

#### 3. ErrorHandlingInterceptor (`interceptors/error_handling_interceptor.dart`)

Transforms DioExceptions into user-friendly error messages:
- **Connection Errors**: Timeout, connection failure, certificate issues
- **HTTP Errors**: 4xx and 5xx status codes with specific messages
- **Server Messages**: Extracts error messages from response body

**Error Message Examples:**
- 401: "未授权，请重新登录"
- 404: "请求的资源不存在"
- 500: "服务器内部错误"
- Connection timeout: "连接超时，请检查网络连接"

## Interceptor Order

Interceptors are executed in the following order:

1. **AuthInterceptor** - Adds authentication before request is sent
2. **LoggingInterceptor** - Logs the authenticated request
3. **ErrorHandlingInterceptor** - Transforms errors into user-friendly messages

This order ensures:
- All requests are authenticated
- All traffic is logged with authentication headers
- All errors are properly handled and logged

## Integration with Repository Layer

The Dio provider is designed to be used in repository implementations:

```dart
@riverpod
DeviceRepository deviceRepository(Ref ref) {
  final dio = ref.read(dioProvider);
  return DeviceRepositoryImpl(
    remoteDataSource: DeviceRemoteDataSourceImpl(dio),
    localDataSource: DeviceLocalDataSourceImpl(),
  );
}
```

## Error Handling Pattern

The network layer works with the `Either<Failure, Success>` pattern:

```dart
Future<Either<Failure, List<Device>>> getDevices() async {
  try {
    final response = await dio.get('/devices');
    return right(response.data);
  } on DioException catch (e) {
    // ErrorHandlingInterceptor has already enhanced the error message
    return left(_mapDioExceptionToFailure(e));
  }
}

Failure _mapDioExceptionToFailure(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.connectionError:
      return Failure.network(
        message: e.message ?? '网络错误',
        statusCode: e.response?.statusCode,
      );
    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode ?? 500;
      if (statusCode == 401) {
        return const Failure.unauthorized();
      } else if (statusCode == 404) {
        return Failure.notFound(resource: '资源');
      } else if (statusCode >= 500) {
        return Failure.server(
          message: e.message ?? '服务器错误',
          statusCode: statusCode,
        );
      } else {
        return Failure.validation(message: e.message ?? '请求错误');
      }
    default:
      return Failure.network(message: e.message ?? '未知错误');
  }
}
```

## Configuration

Network configuration is centralized in `AppConstants`:

```dart
class AppConstants {
  static const String baseUrl = 'https://api.elunchbox.com';
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
```

## Testing

When testing code that uses the Dio provider, override it with a mock:

```dart
test('repository handles network errors', () async {
  final container = ProviderContainer(
    overrides: [
      dioProvider.overrideWithValue(mockDio),
    ],
  );
  
  when(() => mockDio.get(any())).thenThrow(
    DioException(
      requestOptions: RequestOptions(path: '/devices'),
      type: DioExceptionType.connectionTimeout,
    ),
  );
  
  final repository = container.read(deviceRepositoryProvider);
  final result = await repository.getDevices();
  
  expect(result.isLeft(), true);
});
```

## Future Enhancements

- **Token Refresh**: Implement automatic token refresh in AuthInterceptor
- **Retry Logic**: Add retry interceptor for transient failures
- **Cache Interceptor**: Add HTTP cache support for GET requests
- **Request Deduplication**: Prevent duplicate concurrent requests
- **Network Monitoring**: Track network performance metrics

## Requirements Validation

This implementation validates the following requirements:

- **Requirement 23.1**: HTTP requests use Dio interceptors for authentication and error handling
- **Requirement 23.2**: Network layer is optimized with Riverpod integration
