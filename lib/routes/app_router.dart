import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/providers/providers.dart';
import 'package:lunchbox/features/auth/auth.dart';
import 'package:lunchbox/features/device/device.dart';
import 'package:lunchbox/features/home/home.dart';
import 'package:lunchbox/features/onboarding/onboarding.dart';
import 'package:lunchbox/features/order/order.dart';
import 'package:lunchbox/features/profile/profile.dart';
import 'package:lunchbox/features/settings/settings.dart';
import 'package:lunchbox/features/splash/splash.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:lunchbox/shared/shared.dart';
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
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,

    // 认证守卫：实现 redirect 逻辑
    // 验证需求：2.4
    redirect: (context, state) {
      final isAuthRoute =
          state.matchedLocation.startsWith('/auth') ||
          state.matchedLocation == AppRoutes.splash ||
          state.matchedLocation == AppRoutes.onboarding;

      // 如果用户未认证且不在认证相关页面，重定向到登录页
      if (!isAuthenticated && !isAuthRoute) {
        return AppRoutes.login;
      }

      // 如果用户已认证且在登录页，重定向到首页
      if (isAuthenticated && state.matchedLocation == AppRoutes.login) {
        return AppRoutes.home;
      }

      // 不需要重定向
      return null;
    },

    routes: [
      // 启动页面（不需要认证）
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashView(),
      ),

      // 引导页
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),

      // 认证相关路由（不需要认证）
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginView(),
      ),

      // 设备详情页（需要认证，但不在底部导航中）
      GoRoute(
        path: '${AppRoutes.deviceList}/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return DeviceDetailView(deviceId: id);
        },
      ),
      // 设置相关路由
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsView(),
        routes: [
          GoRoute(
            path: 'about',
            builder: (context, state) => const AboutView(),
          ),
          GoRoute(
            path: 'device-info',
            builder: (context, state) => const DeviceInfoView(),
          ),
        ],
      ),

      // 主应用 Shell：使用 StatefulShellRoute 实现底部导航
      // 验证需求：2.6
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavbar(navigationShell: navigationShell);
        },
        branches: [
          // 首页分支
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeView(),
              ),
            ],
          ),

          // 订单分支
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.orderList,
                builder: (context, state) => const OrderListView(),
              ),
            ],
          ),

          // 个人中心分支
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) => const ProfileViewRiverpod(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
