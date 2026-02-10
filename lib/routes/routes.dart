import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/widgets/gnav_scaffold.dart';
import 'package:lunchbox/features/auth/auth.dart';
import 'package:lunchbox/features/cart/cart.dart';
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
import 'package:lunchbox/core/utils/page_transition_page.dart';
import 'package:page_transition/page_transition.dart';

part 'routes.g.dart';

// 启动页面
@TypedGoRoute<SplashRoute>(path: AppRoutes.splash)
class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashView();
}

// 引导页
@TypedGoRoute<OnboardingRoute>(path: AppRoutes.onboarding)
class OnboardingRoute extends GoRouteData with $OnboardingRoute {
  const OnboardingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OnboardingView();
}

// 认证相关路由
@TypedGoRoute<LoginRoute>(path: AppRoutes.login)
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      PageTransitionPage(
        key: state.pageKey,
        child: const LoginView(),
        type: PageTransitionType.rightToLeft,
      );
}

@TypedGoRoute<RegisterRoute>(path: AppRoutes.register)
class RegisterRoute extends GoRouteData with $RegisterRoute {
  const RegisterRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      PageTransitionPage(
        key: state.pageKey,
        child: const RegisterView(),
        type: PageTransitionType.rightToLeft,
      );
}

@TypedGoRoute<ForgotPasswordRoute>(path: AppRoutes.forgotPassword)
class ForgotPasswordRoute extends GoRouteData with $ForgotPasswordRoute {
  const ForgotPasswordRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      PageTransitionPage(
        key: state.pageKey,
        child: const ForgotPasswordView(),
        type: PageTransitionType.rightToLeft,
      );
}

// 城市选择
@TypedGoRoute<CitySelectionRoute>(path: AppRoutes.citySelection)
class CitySelectionRoute extends GoRouteData with $CitySelectionRoute {
  const CitySelectionRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      PageTransitionPage(
        key: state.pageKey,
        child: const CitySelectionView(),
        type: PageTransitionType.bottomToTop,
      );
}

// 首页功能入口
@TypedGoRoute<TeamOrderingRoute>(path: AppRoutes.teamOrdering)
class TeamOrderingRoute extends GoRouteData with $TeamOrderingRoute {
  const TeamOrderingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TeamOrderingView();
}

@TypedGoRoute<CommunityRoute>(path: AppRoutes.community)
class CommunityRoute extends GoRouteData with $CommunityRoute {
  const CommunityRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CommunityView();
}

@TypedGoRoute<CouponsRoute>(path: AppRoutes.coupons)
class CouponsRoute extends GoRouteData with $CouponsRoute {
  const CouponsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CouponsView();
}

@TypedGoRoute<InviteRoute>(
  path: AppRoutes.invite,
  routes: [TypedGoRoute<InviteRulesRoute>(path: AppRoutes.inviteRules)],
)
class InviteRoute extends GoRouteData with $InviteRoute {
  const InviteRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const InviteFriendsView();
}

class InviteRulesRoute extends GoRouteData with $InviteRulesRoute {
  const InviteRulesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const InviteRulesView();
}

@TypedGoRoute<LotteryRoute>(
  path: AppRoutes.lottery,
  routes: [TypedGoRoute<MyPrizesRoute>(path: AppRoutes.myPrizes)],
)
class LotteryRoute extends GoRouteData with $LotteryRoute {
  const LotteryRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LotteryView();
}

class MyPrizesRoute extends GoRouteData with $MyPrizesRoute {
  const MyPrizesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MyPrizesView();
}

// 设备详情 (注意：原路由是 /devices/:id，这里使用 /devices/:id)
@TypedGoRoute<DeviceDetailRoute>(path: '${AppRoutes.deviceList}/:id')
class DeviceDetailRoute extends GoRouteData with $DeviceDetailRoute {
  const DeviceDetailRoute({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      DeviceDetailView(deviceId: id);
}

// 产品列表 /products/:deviceId
@TypedGoRoute<ProductListRoute>(path: '${AppRoutes.productList}/:deviceId')
class ProductListRoute extends GoRouteData with $ProductListRoute {
  const ProductListRoute({required this.deviceId});

  final String deviceId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProductListView(deviceId: deviceId);
}

// 产品详情 /product/:id
@TypedGoRoute<ProductDetailRoute>(path: '${AppRoutes.productDetail}/:id')
class ProductDetailRoute extends GoRouteData with $ProductDetailRoute {
  const ProductDetailRoute({required this.id});

  final String id;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      PageTransitionPage(
        key: state.pageKey,
        child: ProductDetailView(productId: id),
        type: PageTransitionType.rightToLeftWithFade,
      );
}

// 购物车
@TypedGoRoute<CartRoute>(path: AppRoutes.cart)
class CartRoute extends GoRouteData with $CartRoute {
  const CartRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      PageTransitionPage(
        key: state.pageKey,
        child: const CartView(),
        type: PageTransitionType.rightToLeft,
      );
}

// 订单确认
@TypedGoRoute<OrderConfirmRoute>(path: AppRoutes.orderConfirm)
class OrderConfirmRoute extends GoRouteData with $OrderConfirmRoute {
  const OrderConfirmRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      PageTransitionPage(
        key: state.pageKey,
        child: const OrderConfirmView(),
        type: PageTransitionType.rightToLeft,
      );
}

// 订单详情 /order/:id
@TypedGoRoute<OrderDetailRoute>(path: '${AppRoutes.orderDetail}/:id')
class OrderDetailRoute extends GoRouteData with $OrderDetailRoute {
  const OrderDetailRoute({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OrderDetailView();
}

// 支付
@TypedGoRoute<PaymentRoute>(path: AppRoutes.payment)
class PaymentRoute extends GoRouteData with $PaymentRoute {
  const PaymentRoute({required this.$extra});

  final OrderModel $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      PaymentView(order: $extra);
}

// 个人资料相关
@TypedGoRoute<ProfileEditRoute>(path: AppRoutes.profileEdit)
class ProfileEditRoute extends GoRouteData with $ProfileEditRoute {
  const ProfileEditRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfileEditView();
}

@TypedGoRoute<FavoriteDevicesRoute>(path: AppRoutes.favoriteDevices)
class FavoriteDevicesRoute extends GoRouteData with $FavoriteDevicesRoute {
  const FavoriteDevicesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const FavoriteDevicesView();
}

@TypedGoRoute<WalletRoute>(path: AppRoutes.wallet)
class WalletRoute extends GoRouteData with $WalletRoute {
  const WalletRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const WalletView();
}

@TypedGoRoute<MyPointsRoute>(path: AppRoutes.myPoints)
class MyPointsRoute extends GoRouteData with $MyPointsRoute {
  const MyPointsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MyPointsView();
}

@TypedGoRoute<PointsMallRoute>(path: AppRoutes.pointsMall)
class PointsMallRoute extends GoRouteData with $PointsMallRoute {
  const PointsMallRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PointsMallView();
}

@TypedGoRoute<FeedbackRoute>(path: AppRoutes.feedback)
class FeedbackRoute extends GoRouteData with $FeedbackRoute {
  const FeedbackRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const FeedbackView();
}

@TypedGoRoute<PartnerRoute>(path: AppRoutes.partner)
class PartnerRoute extends GoRouteData with $PartnerRoute {
  const PartnerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PartnerView();
}

@TypedGoRoute<AboutUsRoute>(path: AppRoutes.aboutUs)
class AboutUsRoute extends GoRouteData with $AboutUsRoute {
  const AboutUsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AboutUsView();
}

// 帮助中心
@TypedGoRoute<HelpRoute>(path: AppRoutes.help)
class HelpRoute extends GoRouteData with $HelpRoute {
  const HelpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HelpView();
}

// 设置相关路由
@TypedGoRoute<SettingsRoute>(
  path: AppRoutes.settings,
  routes: [
    TypedGoRoute<AboutRoute>(path: AppRoutes.about),
    TypedGoRoute<DeviceInfoRoute>(path: AppRoutes.deviceInfo),
  ],
)
class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsView();
}

class AboutRoute extends GoRouteData with $AboutRoute {
  const AboutRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AboutView();
}

class DeviceInfoRoute extends GoRouteData with $DeviceInfoRoute {
  const DeviceInfoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DeviceInfoView();
}

// 主应用 Shell
@TypedStatefulShellRoute<MainShellRoute>(
  branches: [
    TypedStatefulShellBranch<HomeBranch>(
      routes: [TypedGoRoute<HomeRoute>(path: AppRoutes.home)],
    ),
    TypedStatefulShellBranch<EatBranch>(
      routes: [TypedGoRoute<EatRoute>(path: AppRoutes.eat)],
    ),
    TypedStatefulShellBranch<OrderListBranch>(
      routes: [TypedGoRoute<OrderListRoute>(path: AppRoutes.orderList)],
    ),
    TypedStatefulShellBranch<ProfileBranch>(
      routes: [TypedGoRoute<ProfileRoute>(path: AppRoutes.profile)],
    ),
  ],
)
class MainShellRoute extends StatefulShellRouteData {
  const MainShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return GNavScaffold(navigationShell: navigationShell);
  }
}

class HomeBranch extends StatefulShellBranchData {
  const HomeBranch();
}

class EatBranch extends StatefulShellBranchData {
  const EatBranch();
}

class OrderListBranch extends StatefulShellBranchData {
  const OrderListBranch();
}

class ProfileBranch extends StatefulShellBranchData {
  const ProfileBranch();
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeView();
}

class EatRoute extends GoRouteData with $EatRoute {
  const EatRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DeviceListView();
}

class OrderListRoute extends GoRouteData with $OrderListRoute {
  const OrderListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OrderListView();
}

class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfileView();
}
