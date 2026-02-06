# 错误处理模块

本模块为 Lunchbox 应用提供了基于 fpdart 的 `Either` 类型和 freezed 密封类（sealed classes）的错误处理基础设施。

## 概览

错误处理系统基于函数式编程原则：

- **类型安全的错误**：所有错误都表示为密封类
- **显式的错误处理**：函数返回 `Either<Failure, Success>` 而不是抛出异常
- **模式匹配**：使用 freezed 的 `when` 和 `map` 方法进行详尽的错误处理

## 组件

### Failure 类型

`Failure` 密封类定义了应用中所有可能的错误类型：

#### NetworkFailure

网络相关错误（连接超时、无网络等）
```dart
const failure = Failure.network(
  message: '连接超时',
  statusCode: 408, // 可选
);
```

#### ServerFailure

服务端错误（5xx 错误、API 错误）
```dart
const failure = Failure.server(
  message: '内部服务器错误',
  statusCode: 500,
);
```

#### CacheFailure

本地缓存/存储错误
```dart
const failure = Failure.cache(
  message: '读取缓存失败',
);
```

#### NotFoundFailure

资源未找到错误（404 错误）
```dart
const failure = Failure.notFound(
  resource: '设备',
);
```

#### UnauthorizedFailure

认证/授权错误（401, 403 错误）
```dart
const failure = Failure.unauthorized();
```

#### ValidationFailure

输入验证错误
```dart
const failure = Failure.validation(
  message: '验证失败',
  fieldErrors: {
    'email': '无效的邮箱格式',
    'password': '密码太短',
  },
);
```

## 使用示例

### Repository 模式

```dart
abstract class DeviceRepository {
  Future<Either<Failure, List<Device>>> getDevices();
  Future<Either<Failure, Device>> getDeviceById(String id);
}

class DeviceRepositoryImpl implements DeviceRepository {
  final DeviceRemoteDataSource remoteDataSource;
  
  @override
  Future<Either<Failure, List<Device>>> getDevices() async {
    try {
      final models = await remoteDataSource.getDevices();
      final devices = models.map((m) => m.toEntity()).toList();
      return right(devices);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(Failure.network(
          message: '连接超时',
          statusCode: e.response?.statusCode,
        ));
      }
      return left(Failure.server(
        message: e.message ?? '服务器错误',
        statusCode: e.response?.statusCode ?? 500,
      ));
    } catch (e) {
      return left(Failure.network(message: e.toString()));
    }
  }
}
```

### Provider 模式

```dart
@riverpod
class DeviceList extends _$DeviceList {
  @override
  Future<List<Device>> build() async {
    final repository = ref.read(deviceRepositoryProvider);
    final result = await repository.getDevices();
    
    return result.fold(
      (failure) => throw failure, // AsyncValue 会捕获这个异常
      (devices) => devices,
    );
  }
}
```

### UI 错误处理

```dart
class DeviceListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devicesAsync = ref.watch(deviceListProvider);
    
    return devicesAsync.when(
      data: (devices) => DeviceListView(devices: devices),
      loading: () => const LoadingIndicator(),
      error: (error, stackTrace) {
        final message = error is Failure
            ? error.toUserMessage()
            : '未知错误';
        
        return ErrorView(
          message: message,
          onRetry: () => ref.refresh(deviceListProvider.future),
        );
      },
    );
  }
}
```

### 模式匹配

```dart
// 使用 when 进行详尽匹配
final message = failure.when(
  network: (msg, code) => '网络错误：$msg',
  server: (msg, code) => '服务器错误：$msg',
  cache: (msg) => '缓存错误：$msg',
  notFound: (resource) => '未找到：$resource',
  unauthorized: () => '未授权',
  validation: (msg, errors) => '验证错误：$msg',
);

// 使用 maybeWhen 进行部分匹配
final message = failure.maybeWhen(
  network: (msg, code) => '网络问题',
  unauthorized: () => '请重新登录',
  orElse: () => '发生错误',
);
```

### 扩展方法

#### 转换为用户消息
```dart
final failure = Failure.network(message: '连接失败');
print(failure.toUserMessage()); // "网络错误：连接失败"
```

#### 类型检查
```dart
if (failure.isNetworkFailure) {
  // 处理网络错误
}
```

#### Either 扩展
```dart
// 获取值或抛出异常
final data = result.getOrThrow();

// 获取值或返回 null
final data = result.getOrNull();

// 获取值或返回默认值
final data = result.getOrDefault(defaultValue);

// 映射失败
final mapped = result.mapFailure(
  (f) => Failure.cache(message: f.toUserMessage())
);

// 获取失败或返回 null
final failure = result.getFailureOrNull();
if (failure != null) {
  print('错误: ${failure.toUserMessage()}');
}
```

## 最佳实践

1. **对于可能失败的操作始终使用 Either**
    * Repository 方法应返回 `Either<Failure, T>`
    * 不要在 Repository 层抛出异常

2. **使用模式匹配进行错误处理**
    * 使用 `when` 或 `maybeWhen` 处理不同的错误类型
    * 为每种错误类型提供用户友好的消息

3. **在 UI 层将 Failure 转换为用户消息**
    * 使用 `toUserMessage()` 扩展方法
    * 向用户显示本地化的错误消息

4. **适当地记录错误**
    * 记录技术细节以便调试
    * 向用户显示友好的消息

5. **全局处理未授权错误**
    * 重定向到登录页面
    * 清除认证状态

## 测试

本模块包含全面的单元测试：

* `failure_test.dart`：测试 Failure 类和模式匹配
* `failure_extensions_test.dart`：测试扩展方法

运行测试：
```bash
flutter test test/core/errors/
```

## 需求验证

本模块验证了以下需求：

* **需求 5.1**：Repository 操作返回 `Either<Failure, Success>`
* **需求 5.5**：Failure 映射到用户友好的消息
* **需求 5.6**：用于类型安全错误层级的密封类
