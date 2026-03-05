import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/providers/providers.dart';
import 'package:lunchbox/core/services/services.dart';
import 'package:lunchbox/features/auth/auth.dart';
import 'package:lunchbox/features/splash/splash.dart';
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
  final hasInitialized = ref.watch(splashProvider).hasInitialized;
  final analytics = ref.watch(firebaseAnalyticsProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: const SplashRoute().location,
    debugLogDiagnostics: true,
    observers: [FirebaseAnalyticsObserver(analytics: analytics)],

    // 认证守卫：实现 redirect 逻辑
    // 验证需求：2.4
    redirect: (context, state) {
      final isSplashRoute =
          state.matchedLocation == const SplashRoute().location;

      // 如果已经初始化完成，不允许再回到 Splash 屏
      if (hasInitialized && isSplashRoute) {
        final navigationPath = ref.read(splashProvider).navigationPath;

        // 确保 navigationPath 与当前的认证状态同步
        // 避免登出后由于 SplashNotifier 中的 navigationPath 仍然是 /home 而导致的重定向错误
        if (!isAuthenticated && navigationPath == const HomeRoute().location) {
          return const SignInRoute().location;
        }
        if (isAuthenticated && navigationPath == const SignInRoute().location) {
          return const HomeRoute().location;
        }

        return navigationPath ??
            (isAuthenticated
                ? const HomeRoute().location
                : const SignInRoute().location);
      }

      final isAuthRoute =
          state.matchedLocation == const SignInRoute().location ||
          state.matchedLocation == const SignUpRoute().location ||
          state.matchedLocation == const ForgotPasswordRoute().location ||
          isSplashRoute ||
          state.matchedLocation == const OnboardingRoute().location;

      // 如果用户未认证且不在认证相关页面，重定向到登录页
      if (!isAuthenticated && !isAuthRoute) {
        return const SignInRoute().location;
      }

      // 如果用户已认证且在登录页，重定向到首页
      if (isAuthenticated &&
          state.matchedLocation == const SignInRoute().location) {
        return const HomeRoute().location;
      }

      // 不需要重定向
      return null;
    },

    routes: $appRoutes,
  );
}
