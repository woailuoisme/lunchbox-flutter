import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/profile/widgets/profile_header.dart';
import 'package:lunchbox/features/profile/widgets/profile_menu_tile.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/routes.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 用户中心视图 (我的)
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          // 红色渐变背景头部
          SliverToBoxAdapter(
            child: ProfileHeader(
              username: '166****2309',
              walletBalance: '999962.07',
              points: '300',
              coupons: '9',
              onLogout: () {
                // TODO: Implement logout
              },
            ),
          ),

          // 功能列表菜单
          SliverToBoxAdapter(child: _buildMenuSection(context)),

          SliverToBoxAdapter(child: SizedBox(height: 40.h)),
        ],
      ),
    );
  }

  /// 构建功能列表菜单
  Widget _buildMenuSection(BuildContext context) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.cardColor,
      child: Column(
        children: [
          // 资产与权益
          ProfileMenuTile(
            icon: Symbols.account_balance_wallet,
            title: t.profile.wallet,
            trailingText: '999962.07',
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
}
