import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/providers/providers.dart';
import 'package:lunchbox/features/auth/auth.dart';
import 'package:lunchbox/features/device/device.dart';
import 'package:lunchbox/features/help/help.dart';
import 'package:lunchbox/features/home/home.dart';
import 'package:lunchbox/features/onboarding/onboarding.dart';
import 'package:lunchbox/features/order/order.dart';
import 'package:lunchbox/features/payment/payment.dart';
import 'package:lunchbox/features/product/product.dart';
import 'package:lunchbox/features/profile/profile.dart';
import 'package:lunchbox/features/settings/settings.dart';
import 'package:lunchbox/features/splash/splash.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:lunchbox/core/widgets/gnav_scaffold.dart';
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
          state.matchedLocation == AppRoutes.login ||
          state.matchedLocation == AppRoutes.register ||
          state.matchedLocation == AppRoutes.forgotPassword ||
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
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordView(),
      ),

      // 城市选择
      GoRoute(
        path: AppRoutes.citySelection,
        builder: (context, state) => const CitySelectionView(),
      ),

      // 首页功能入口
      GoRoute(
        path: AppRoutes.teamOrdering,
        builder: (context, state) => const TeamOrderingView(),
      ),
      GoRoute(
        path: AppRoutes.community,
        builder: (context, state) => const CommunityView(),
      ),
      GoRoute(
        path: AppRoutes.coupons,
        builder: (context, state) => const CouponsView(),
      ),
      GoRoute(
        path: AppRoutes.invite,
        builder: (context, state) => const InviteFriendsView(),
        routes: [
          GoRoute(
            path: AppRoutes.inviteRules,
            builder: (context, state) => const InviteRulesView(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.lottery,
        builder: (context, state) => const LotteryView(),
        routes: [
          GoRoute(
            path: AppRoutes.myPrizes,
            builder: (context, state) => const MyPrizesView(),
          ),
        ],
      ),

      GoRoute(
        path: '${AppRoutes.deviceList}/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return DeviceDetailView(deviceId: id);
        },
      ),

      // 产品列表
      GoRoute(
        path: '${AppRoutes.productList}/:deviceId',
        builder: (context, state) {
          final deviceId = state.pathParameters['deviceId']!;
          return ProductListView(deviceId: deviceId);
        },
      ),

      // 产品详情
      GoRoute(
        path: '${AppRoutes.productDetail}/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ProductDetailView(productId: id);
        },
      ),

      // 购物车
      GoRoute(
        path: AppRoutes.cart,
        builder: (context, state) => const CartView(),
      ),

      // 订单确认
      GoRoute(
        path: AppRoutes.orderConfirm,
        builder: (context, state) => const OrderConfirmView(),
      ),

      // 订单详情
      GoRoute(
        path: '${AppRoutes.orderDetail}/:id',
        builder: (context, state) => const OrderDetailView(),
      ),

      // 支付
      GoRoute(
        path: AppRoutes.payment,
        builder: (context, state) {
          final order = state.extra! as OrderModel;
          return PaymentView(order: order);
        },
      ),

      // 个人资料相关
      GoRoute(
        path: AppRoutes.profileEdit,
        builder: (context, state) => const ProfileEditView(),
      ),
      GoRoute(
        path: AppRoutes.favoriteDevices,
        builder: (context, state) => const FavoriteDevicesView(),
      ),
      GoRoute(
        path: AppRoutes.wallet,
        builder: (context, state) => const WalletView(),
      ),
      GoRoute(
        path: AppRoutes.myPoints,
        builder: (context, state) => const MyPointsView(),
      ),
      GoRoute(
        path: AppRoutes.pointsMall,
        builder: (context, state) => const PointsMallView(),
      ),
      GoRoute(
        path: AppRoutes.feedback,
        builder: (context, state) => const FeedbackView(),
      ),
      GoRoute(
        path: AppRoutes.partner,
        builder: (context, state) => const PartnerView(),
      ),
      GoRoute(
        path: AppRoutes.aboutUs,
        builder: (context, state) => const AboutUsView(),
      ),

      // 帮助中心
      GoRoute(
        path: AppRoutes.help,
        builder: (context, state) => const HelpView(),
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
          return GNavScaffold(navigationShell: navigationShell);
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

          // 吃饭分支
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.eat,
                builder: (context, state) => const DeviceListView(),
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
                builder: (context, state) => const ProfileView(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
