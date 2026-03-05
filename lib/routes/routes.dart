import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/widgets/gnav_scaffold.dart';
import 'package:lunchbox/features/auth/auth.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/device/device.dart';
import 'package:lunchbox/features/home/home.dart';
import 'package:lunchbox/features/invite/invite.dart';
import 'package:lunchbox/features/lottery/lottery.dart';
import 'package:lunchbox/features/onboarding/onboarding.dart';
import 'package:lunchbox/features/order/order.dart';
import 'package:lunchbox/features/payment/payment.dart';
import 'package:lunchbox/features/product/product.dart';
import 'package:lunchbox/features/profile/profile.dart';
import 'package:lunchbox/features/personal_info/personal_info.dart';
import 'package:lunchbox/features/feedback/feedback.dart';
import 'package:lunchbox/features/partner/partner.dart';
import 'package:lunchbox/features/team_ordering/team_ordering.dart';
import 'package:lunchbox/features/coupons/coupons.dart';
import 'package:lunchbox/features/my_coupons/my_coupons.dart';
import 'package:lunchbox/features/community/community.dart';
import 'package:lunchbox/features/welcome_gift/welcome_gift.dart';
import 'package:lunchbox/features/points/screens/my_points_view.dart';
import 'package:lunchbox/features/points/screens/points_mall_view.dart';
import 'package:lunchbox/features/wallet/screens/wallet_rules_view.dart';
import 'package:lunchbox/features/wallet/screens/wallet_view.dart';
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
@TypedGoRoute<SignInRoute>(path: AppRoutes.signin)
class SignInRoute extends GoRouteData with $SignInRoute {
  const SignInRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      PageTransitionPage(
        key: state.pageKey,
        child: const SimpleSignInView(),
        type: PageTransitionType.rightToLeft,
      );
}

@TypedGoRoute<ComplexSignInRoute>(path: AppRoutes.complexSignIn)
class ComplexSignInRoute extends GoRouteData with $ComplexSignInRoute {
  const ComplexSignInRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      PageTransitionPage(
        key: state.pageKey,
        child: const SignInView(),
        type: PageTransitionType.rightToLeft,
      );
}

@TypedGoRoute<SignUpRoute>(path: AppRoutes.signup)
class SignUpRoute extends GoRouteData with $SignUpRoute {
  const SignUpRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      PageTransitionPage(
        key: state.pageKey,
        child: const SignUpView(),
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

@TypedGoRoute<ResetPasswordRoute>(path: AppRoutes.resetPassword)
class ResetPasswordRoute extends GoRouteData with $ResetPasswordRoute {
  const ResetPasswordRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ResetPasswordView();
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

@TypedGoRoute<MyCouponsRoute>(path: AppRoutes.myCoupons)
class MyCouponsRoute extends GoRouteData with $MyCouponsRoute {
  const MyCouponsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MyCouponsView();
}

@TypedGoRoute<WelcomeGiftRoute>(path: AppRoutes.welcomeGift)
class WelcomeGiftRoute extends GoRouteData with $WelcomeGiftRoute {
  const WelcomeGiftRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WelcomeGiftView();
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
  const PaymentRoute({this.$extra});

  final OrderModel? $extra;

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

@TypedGoRoute<WalletRoute>(path: AppRoutes.wallet)
class WalletRoute extends GoRouteData with $WalletRoute {
  const WalletRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const WalletView();
}

@TypedGoRoute<WalletRulesRoute>(path: AppRoutes.walletRules)
class WalletRulesRoute extends GoRouteData with $WalletRulesRoute {
  const WalletRulesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WalletRulesView();
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

@TypedGoRoute<SettingsRoute>(
  path: AppRoutes.settings,
  routes: [
    TypedGoRoute<AboutRoute>(path: AppRoutes.about),
    TypedGoRoute<DeviceInfoRoute>(path: AppRoutes.deviceInfo),
    TypedGoRoute<DebugRoute>(path: AppRoutes.debug),
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

class DebugRoute extends GoRouteData with $DebugRoute {
  const DebugRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const DebugView();
}

// 主应用 Shell
@TypedStatefulShellRoute<MainShellRoute>(
  branches: [
    TypedStatefulShellBranch<HomeBranch>(
      routes: [TypedGoRoute<HomeRoute>(path: AppRoutes.home)],
    ),
    TypedStatefulShellBranch<DeviceBranch>(
      routes: [TypedGoRoute<DeviceRoute>(path: AppRoutes.device)],
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

class DeviceBranch extends StatefulShellBranchData {
  const DeviceBranch();
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

class DeviceRoute extends GoRouteData with $DeviceRoute {
  const DeviceRoute();

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
