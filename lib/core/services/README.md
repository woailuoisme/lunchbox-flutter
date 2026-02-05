# Core Services

This directory contains core application services that provide essential functionality across the app.

## ToastService

The `ToastService` provides a unified way to display toast notifications throughout the application.

### Features

- **Four notification types**: Success, Error, Info, and Warning
- **Customizable**: Custom titles, durations, and contexts
- **Consistent styling**: Uses Toastification with fillColored style
- **Automatic positioning**: Top-center alignment
- **Interactive**: Supports drag-to-close, pause-on-hover, and progress bar

### Usage

#### Basic Usage

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lunchbox/core/services/toast_service.dart';

class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toastService = ref.read(toastServiceProvider);
    
    return ElevatedButton(
      onPressed: () {
        // Show success toast
        toastService.showSuccess('操作成功！');
      },
      child: Text('Submit'),
    );
  }
}
```

#### With Custom Title

```dart
toastService.showSuccess(
  '数据已保存',
  title: '保存成功',
);
```

#### With Custom Duration

```dart
toastService.showError(
  '网络连接失败，请检查网络设置',
  autoCloseDuration: Duration(seconds: 10),
);
```

#### With Context (Optional)

```dart
toastService.showInfo(
  '正在加载数据...',
  context: context, // Optional, uses global navigator key if not provided
);
```

### API Reference

#### showSuccess

Displays a success message with a green background and check icon.

```dart
void showSuccess(
  String message, {
  String? title,              // Default: "成功"
  Duration? autoCloseDuration, // Default: 3 seconds
  BuildContext? context,
})
```

#### showError

Displays an error message with a red background and error icon.

```dart
void showError(
  String message, {
  String? title,              // Default: "错误"
  Duration? autoCloseDuration, // Default: 5 seconds
  BuildContext? context,
})
```

#### showInfo

Displays an informational message with a blue background and info icon.

```dart
void showInfo(
  String message, {
  String? title,              // Default: "提示"
  Duration? autoCloseDuration, // Default: 3 seconds
  BuildContext? context,
})
```

#### showWarning

Displays a warning message with an orange background and warning icon.

```dart
void showWarning(
  String message, {
  String? title,              // Default: "警告"
  Duration? autoCloseDuration, // Default: 3 seconds
  BuildContext? context,
})
```

### Integration with Error Handling

The ToastService integrates seamlessly with the error handling system:

```dart
final result = await repository.getData();

result.fold(
  (failure) {
    final message = failure.when(
      network: (msg, _) => '网络错误：$msg',
      server: (msg, _) => '服务器错误：$msg',
      cache: (msg) => '缓存错误：$msg',
      notFound: (resource) => '未找到：$resource',
      unauthorized: () => '未授权，请重新登录',
      validation: (msg, _) => '验证错误：$msg',
    );
    ref.read(toastServiceProvider).showError(message);
  },
  (data) {
    ref.read(toastServiceProvider).showSuccess('数据加载成功');
    // Handle success
  },
);
```

### Configuration

The ToastService uses the following default configurations:

- **Position**: Top center
- **Animation Duration**: 300ms
- **Success/Info/Warning Duration**: 3 seconds
- **Error Duration**: 5 seconds (longer for users to read error messages)
- **Style**: Fill colored
- **Features**: Progress bar, drag-to-close, pause-on-hover, blur effect

### Requirements

- **Requirement 4.1**: Success message display ✓
- **Requirement 4.2**: Error message display ✓
- **Requirement 4.3**: Info message display ✓
- **Requirement 4.4**: Warning message display ✓
- **Requirement 4.5**: Dismissible toasts with appropriate duration ✓
- **Requirement 4.6**: Customizable position, animation, and style ✓

### Testing

See `test/core/services/toast_service_test.dart` for unit tests.

The service is tested for:
- Provider creation
- Navigator key injection
- Method availability
- Basic functionality

Note: Full integration tests with actual toast display should be done in widget/integration tests with proper context setup.
