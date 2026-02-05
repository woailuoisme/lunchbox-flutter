# GoRouter Navigation

## Basic Setup (GoRouter 17.0+)

```dart
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Use Riverpod to provide the router
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authState.isLoggedIn;
      final isAuthRoute = state.uri.path.startsWith('/auth');

      if (!isLoggedIn && !isAuthRoute) {
        return '/auth/login';
      }
      
      if (isLoggedIn && isAuthRoute) {
        return '/';
      }
      
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'details/:id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return DetailsScreen(id: id);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/auth/login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
});

// In app.dart
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}
```

## Navigation Methods

```dart
// Navigate and replace history
context.go('/details/123');

// Navigate and add to stack
context.push('/details/123');

// Go back
context.pop();

// Replace current route
context.pushReplacement('/home');

// Navigate with extra data
context.push('/details/123', extra: {'title': 'Item'});

// Access extra in destination
final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
```

## Shell Routes (Persistent UI)

```dart
final goRouter = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/profile', builder: (_, __) => const ProfileScreen()),
          ],
        ),
      ],
    ),
  ],
);
```

## Query Parameters

```dart
GoRoute(
  path: '/search',
  builder: (context, state) {
    final query = state.uri.queryParameters['q'] ?? '';
    final page = int.tryParse(state.uri.queryParameters['page'] ?? '1') ?? 1;
    return SearchScreen(query: query, page: page);
  },
),

// Navigate with query params
context.go(Uri(path: '/search', queryParameters: {'q': 'flutter', 'page': '2'}).toString());
```

## Quick Reference

| Method | Behavior |
|--------|----------|
| `context.go()` | Navigate, replace stack (declarative) |
| `context.push()` | Navigate, add to stack (imperative) |
| `context.pop()` | Go back |
| `StatefulShellRoute` | Persistent bottom navigation |
| `:param` | Path parameter |
| `?key=value` | Query parameter |
