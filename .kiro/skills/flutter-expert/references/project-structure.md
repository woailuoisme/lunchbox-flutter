# Project Structure

## Feature-Based Structure (Flattened)

```
lib/
├── main.dart
├── app.dart
├── core/
│   ├── base/
│   │   ├── base_state.dart
│   │   └── base_view.dart
│   ├── constants/
│   │   ├── colors.dart
│   │   └── strings.dart
│   ├── theme/
│   │   ├── app_theme.dart
│   │   └── text_styles.dart
│   ├── utils/
│   │   ├── extensions.dart
│   │   ├── logger_utils.dart
│   │   └── validators.dart
│   └── errors/
│       └── failures.dart
├── features/
│   ├── auth/
│   │   ├── datasources/        # Remote/Local data sources
│   │   ├── models/             # Data models (DTOs)
│   │   ├── repositories/       # Repository implementations & interfaces
│   │   ├── entities/           # Domain entities
│   │   ├── usecases/           # Business logic use cases
│   │   ├── providers/          # Riverpod notifiers/providers
│   │   ├── screens/            # UI Screens
│   │   └── widgets/            # Feature-specific widgets
│   └── home/
│       ├── datasources/
│       ├── models/
│       ├── repositories/
│       ├── entities/
│       ├── providers/
│       ├── screens/
│       └── widgets/
├── shared/
│   ├── widgets/
│   │   ├── buttons/
│   │   ├── inputs/
│   │   └── cards/
│   ├── services/
│   │   ├── api_service.dart
│   │   └── storage_service.dart
│   └── models/
│       └── api_response_model.dart
└── routes/
    └── app_routes.dart
```

## pubspec.yaml Essentials

```yaml
dependencies:
  flutter:
    sdk: flutter
  # State Management
  flutter_riverpod: ^3.1.0
  riverpod_annotation: ^4.0.0
  # Navigation
  go_router: ^17.1.0
  # Networking
  dio: ^5.9.0
  # Code Generation
  freezed_annotation: ^3.1.0
  json_annotation: ^4.9.0
  # Storage
  shared_preferences: ^2.5.0
  # UI
  flutter_screenutil: ^5.9.0
  flutter_animate: ^4.5.0
  # Utils
  logger: ^2.6.0
  intl: ^0.20.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.0
  riverpod_generator: ^4.0.0
  freezed: ^3.2.0
  json_serializable: ^6.9.0
  flutter_lints: ^6.0.0
```

## Feature Directory Responsibilities

| Directory | Responsibility |
|-----------|----------------|
| **datasources/** | Handles data fetching from API or local storage. Directly talks to external sources. |
| **models/** | Data Transfer Objects (DTOs), usually with JSON serialization. |
| **repositories/** | Abstracts data sources. Implements the business logic for data retrieval and manipulation. |
| **entities/** | Pure domain objects used in the UI and business logic. |
| **usecases/** | Specific business rules or actions (encapsulates logic). |
| **providers/** | State management (Riverpod Notifiers). Connects repositories/usecases to the UI. |
| **screens/** | Full-page widgets (Views). |
| **widgets/** | Reusable widgets specific to this feature. |

## Main Entry Point

```dart
// main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize other services (Storage, etc.)
  runApp(const ProviderScope(child: MyApp()));
}

// app.dart
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp.router(
        routerConfig: router,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark, // If available
        themeMode: ThemeMode.light,
        // Localization setup
        localizationsDelegates: const [
          // ...
        ],
      ),
    );
  }
}
```
