import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/profile/providers/profile_provider.dart';
import 'package:lunchbox/core/services/dialog_service.dart';
import 'package:lunchbox/features/profile/widgets/profile_header.dart';
import 'package:lunchbox/features/profile/widgets/profile_menu_tile.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/routes.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// 用户中心视图 (我的)
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final profileState = ref.watch(profileProvider);
    final user = profileState.value?.currentUser;
    final isLoading = profileState.isLoading;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: RefreshIndicator(
        onRefresh: () => ref.read(profileProvider.notifier).loadUserInfo(),
        child: CustomScrollView(
          slivers: [
            // 红色渐变背景头部
            SliverToBoxAdapter(
              child: Skeletonizer(
                enabled: isLoading,
                child: ProfileHeader(
                  username: user?.nickname ?? '...',
                  walletBalance: user?.balance ?? '0.00',
                  points: user?.integral ?? '0',
                  coupons: user?.userCouponCount.toString() ?? '0',
                  avatarUrl: user?.avatar,
                  onLogout: () => _handleLogout(context, ref),
                ),
              ),
            ),

            // 功能列表菜单
            SliverToBoxAdapter(
              child: _buildMenuSection(context, ref, user?.balance),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 40.h)),
          ],
        ),
      ),
    );
  }

  /// 构建功能列表菜单
  Widget _buildMenuSection(
    BuildContext context,
    WidgetRef ref,
    String? balance,
  ) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.cardColor,
      child: Column(
        children: [
          // 资产与权益
          ProfileMenuTile(
            icon: Symbols.account_balance_wallet,
            title: t.profile.wallet,
            trailingText: balance ?? '0.00',
            trailingColor: theme.colorScheme.primary,
            onTap: () => const WalletRoute().push<void>(context),
          ),
          ProfileMenuTile(
            icon: Symbols.airplane_ticket,
            title: t.profile.coupon,
            onTap: () => const MyCouponsRoute().push<void>(context),
          ),

          // 个人相关
          ProfileMenuTile(
            icon: Symbols.person,
            title: t.profile.personalInfo,
            onTap: () => const ProfileEditRoute().push<void>(context),
          ),

          // 服务与合作
          ProfileMenuTile(
            icon: Symbols.handshake,
            title: t.profile.cooperation,
            onTap: () => const PartnerRoute().push<void>(context),
          ),
          ProfileMenuTile(
            icon: Symbols.help,
            title: t.profile.feedback,
            onTap: () => const FeedbackRoute().push<void>(context),
          ),

          // 关于与设置
          ProfileMenuTile(
            icon: Symbols.info,
            title: t.profile.about,
            onTap: () => const AboutUsRoute().push<void>(context),
          ),
          ProfileMenuTile(
            icon: Symbols.settings,
            title: t.profile.settings,
            onTap: () => const SettingsRoute().push<void>(context),
            showDivider: false,
          ),
        ],
      ),
    );
  }

  /// 处理登出逻辑
  Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    final confirmed = await ref
        .read(dialogServiceProvider)
        .showConfirm(
          title: t.profile.confirmLogout,
          message: t.profile.confirmLogoutContent,
          context: context,
        );

    if (confirmed == true) {
      await ref.read(profileProvider.notifier).logout();
      // GoRouter 会根据 AuthProvider 的状态自动重定向到登录页
      // 但为了保险起见，如果还在当前页，可以手动跳转
      if (context.mounted) {
        const SignInRoute().go(context);
      }
    }
  }
}
