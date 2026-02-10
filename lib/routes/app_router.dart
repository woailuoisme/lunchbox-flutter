import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/providers/providers.dart';
import 'package:lunchbox/features/auth/auth.dart';
import 'package:lunchbox/routes/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

/// GoRouter 配置 Provider
///
/// 提供应用的路由配置，包括：
/// - 认证守卫（redirect 逻辑）
/// - ShellRoute 用于底部导航
/// - 所有应用路由定义
///
/// 验证需求：2.1, 2.4, 2.6
@riverpod
GoRouter goRouter(Ref ref) {
  // 使用共享的 navigator key
  final rootNavigatorKey = ref.watch(navigatorKeyProvider);

  // 监听认证状态变化以触发路由重定向
  final isAuthenticated = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: const SplashRoute().location,
    debugLogDiagnostics: true,

    // 认证守卫：实现 redirect 逻辑
    // 验证需求：2.4
    redirect: (context, state) {
      final isAuthRoute =
          state.matchedLocation == const LoginRoute().location ||
          state.matchedLocation == const RegisterRoute().location ||
          state.matchedLocation == const ForgotPasswordRoute().location ||
          state.matchedLocation == const SplashRoute().location ||
          state.matchedLocation == const OnboardingRoute().location;

      // 如果用户未认证且不在认证相关页面，重定向到登录页
      if (!isAuthenticated && !isAuthRoute) {
        return const LoginRoute().location;
      }

      // 如果用户已认证且在登录页，重定向到首页
      if (isAuthenticated &&
          state.matchedLocation == const LoginRoute().location) {
        return const HomeRoute().location;
      }

      // 不需要重定向
      return null;
    },

    routes: $appRoutes,
  );
}
