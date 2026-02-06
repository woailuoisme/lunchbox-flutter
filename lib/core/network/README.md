# 网络层

此目录包含 Lunchbox 应用的网络层配置，基于 Dio HTTP 客户端并集成了 Riverpod。

## 概览

网络层提供了一个集中的、配置完善的 Dio 实例，具有自动身份验证、日志记录和错误处理功能。

## 组件

### Dio Provider (`dio_provider.dart`)

这是创建并配置 Dio 实例的主要 Provider，包含以下配置：

- 来自 `AppConstants` 的 Base URL 和超时设置
- 标准 JSON 请求头
- 用于身份验证、日志记录和错误处理的三个拦截器

**使用示例：**
```dart
@riverpod
Future<List<Device>> getDevices(Ref ref) async {
  final dio = ref.read(dioProvider);
  final response = await dio.get('/devices');
  return (response.data as List).map((json) => Device.fromJson(json)).toList();
}
```

### 拦截器 (Interceptors)

#### 1. AuthInterceptor (`interceptors/auth_interceptor.dart`)

自动管理身份验证令牌：

- **请求阶段**：为所有请求添加 `Authorization: Bearer <token>` 请求头
- **错误阶段**：通过清除过期令牌来处理 401 Unauthorized 响应

**功能特性：**

- 从 `StorageService` 读取令牌
- 自动清除无效令牌
- 为未来的令牌刷新 (Token Refresh) 实现预留了空间

#### 2. LoggingInterceptor (`interceptors/logging_interceptor.dart`)

记录所有 HTTP 流量以便调试：

- **请求日志**：方法、URL、请求头、主体、查询参数
- **响应日志**：状态码、响应头、响应体
- **错误日志**：错误类型、消息、状态码、响应数据

**功能特性：**

- 带有视觉分隔符的格式化输出
- 使用 `LoggerUtils` 保持日志一致性
- 包含完整的错误堆栈跟踪

#### 3. ErrorHandlingInterceptor (`interceptors/error_handling_interceptor.dart`)

将 DioExceptions 转换为用户友好的错误消息：

- **连接错误**：超时、连接失败、证书问题
- **HTTP 错误**：带有特定消息的 4xx 和 5xx 状态码
- **服务器消息**：从响应体中提取错误消息

**错误消息示例：**
- 401: "未授权，请重新登录"
- 404: "请求的资源不存在"
- 500: "服务器内部错误"
- 连接超时: "连接超时，请检查网络连接"

## 拦截器顺序

拦截器按以下顺序执行：

1. **AuthInterceptor** - 在发送请求前添加身份验证
2. **LoggingInterceptor** - 记录已添加身份验证信息的请求
3. **ErrorHandlingInterceptor** - 将错误转换为用户友好的消息

此顺序确保：

- 所有请求都经过身份验证
- 所有流量（包括身份验证头）都被记录
- 所有错误都能得到妥善处理和记录

## 与 Repository 层集成

Dio Provider 旨在用于 Repository 的实现中：

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

## 错误处理模式

网络层配合 `Either<Failure, Success>` 模式工作：

```dart
Future<Either<Failure, List<Device>>> getDevices() async {
  try {
    final response = await dio.get('/devices');
    return right(response.data);
  } on DioException catch (e) {
    // ErrorHandlingInterceptor 已经增强了错误消息
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

## 配置

网络配置集中在 `AppConstants` 中：

```dart
class AppConstants {
  static const String baseUrl = 'https://api.elunchbox.com';
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
```

## 测试

测试使用 Dio Provider 的代码时，请使用 Mock 实例进行覆盖：

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

## 未来增强

- **令牌刷新 (Token Refresh)**：在 AuthInterceptor 中实现自动令牌刷新
- **重试逻辑 (Retry Logic)**：为瞬时失败添加重试拦截器
- **缓存拦截器 (Cache Interceptor)**：为 GET 请求添加 HTTP 缓存支持
- **请求去重 (Request Deduplication)**：防止重复的并发请求
- **网络监控 (Network Monitoring)**：跟踪网络性能指标

## 需求验证

此实现验证了以下需求：

- **需求 23.1**：HTTP 请求使用 Dio 拦截器进行身份验证和错误处理
- **需求 23.2**：网络层通过集成 Riverpod 进行了优化
