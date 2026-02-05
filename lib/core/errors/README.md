# Error Handling Module

This module provides the error handling infrastructure for the Lunchbox application using fpdart's `Either` type and freezed sealed classes.

## Overview

The error handling system is based on functional programming principles:
- **Type-safe errors**: All errors are represented as sealed classes
- **Explicit error handling**: Functions return `Either<Failure, Success>` instead of throwing exceptions
- **Pattern matching**: Use freezed's `when` and `map` methods for exhaustive error handling

## Components

### Failure Types

The `Failure` sealed class defines all possible error types in the application:

#### NetworkFailure
Network-related failures (connection timeout, no internet, etc.)
```dart
const failure = Failure.network(
  message: 'Connection timeout',
  statusCode: 408, // Optional
);
```

#### ServerFailure
Server-side failures (5xx errors, API errors)
```dart
const failure = Failure.server(
  message: 'Internal server error',
  statusCode: 500,
);
```

#### CacheFailure
Local cache/storage failures
```dart
const failure = Failure.cache(
  message: 'Failed to read from cache',
);
```

#### NotFoundFailure
Resource not found failures (404 errors)
```dart
const failure = Failure.notFound(
  resource: 'Device',
);
```

#### UnauthorizedFailure
Authentication/authorization failures (401, 403 errors)
```dart
const failure = Failure.unauthorized();
```

#### ValidationFailure
Input validation failures
```dart
const failure = Failure.validation(
  message: 'Validation failed',
  fieldErrors: {
    'email': 'Invalid email format',
    'password': 'Password too short',
  },
);
```

## Usage Examples

### Repository Pattern

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
          message: 'Connection timeout',
          statusCode: e.response?.statusCode,
        ));
      }
      return left(Failure.server(
        message: e.message ?? 'Server error',
        statusCode: e.response?.statusCode ?? 500,
      ));
    } catch (e) {
      return left(Failure.network(message: e.toString()));
    }
  }
}
```

### Provider Pattern

```dart
@riverpod
class DeviceList extends _$DeviceList {
  @override
  Future<List<Device>> build() async {
    final repository = ref.read(deviceRepositoryProvider);
    final result = await repository.getDevices();
    
    return result.fold(
      (failure) => throw failure, // AsyncValue will catch this
      (devices) => devices,
    );
  }
}
```

### UI Error Handling

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

### Pattern Matching

```dart
// Using when for exhaustive matching
final message = failure.when(
  network: (msg, code) => '网络错误：$msg',
  server: (msg, code) => '服务器错误：$msg',
  cache: (msg) => '缓存错误：$msg',
  notFound: (resource) => '未找到：$resource',
  unauthorized: () => '未授权',
  validation: (msg, errors) => '验证错误：$msg',
);

// Using maybeWhen for partial matching
final message = failure.maybeWhen(
  network: (msg, code) => '网络问题',
  unauthorized: () => '请重新登录',
  orElse: () => '发生错误',
);
```

### Extension Methods

#### Convert to User Message
```dart
final failure = Failure.network(message: 'Connection failed');
print(failure.toUserMessage()); // "网络错误：Connection failed"
```

#### Type Checking
```dart
if (failure.isNetworkFailure) {
  // Handle network error
}
```

#### Either Extensions
```dart
// Get value or throw
final data = result.getOrThrow();

// Get value or null
final data = result.getOrNull();

// Get value or default
final data = result.getOrDefault(defaultValue);

// Map failure
final mapped = result.mapFailure(
  (f) => Failure.cache(message: f.toUserMessage())
);

// Get failure or null
final failure = result.getFailureOrNull();
if (failure != null) {
  print('Error: ${failure.toUserMessage()}');
}
```

## Best Practices

1. **Always use Either for operations that can fail**
   - Repository methods should return `Either<Failure, T>`
   - Don't throw exceptions in repository layer

2. **Use pattern matching for error handling**
   - Use `when` or `maybeWhen` to handle different error types
   - Provide user-friendly messages for each error type

3. **Convert failures to user messages in UI layer**
   - Use `toUserMessage()` extension method
   - Display localized error messages to users

4. **Log errors appropriately**
   - Log technical details for debugging
   - Show user-friendly messages to users

5. **Handle unauthorized errors globally**
   - Redirect to login screen
   - Clear authentication state

## Testing

The module includes comprehensive unit tests:
- `failure_test.dart`: Tests for Failure class and pattern matching
- `failure_extensions_test.dart`: Tests for extension methods

Run tests:
```bash
flutter test test/core/errors/
```

## Requirements Validation

This module validates the following requirements:
- **Requirement 5.1**: Repository operations return `Either<Failure, Success>`
- **Requirement 5.5**: Failures map to user-friendly messages
- **Requirement 5.6**: Sealed class for type-safe error hierarchy
