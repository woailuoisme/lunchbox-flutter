import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/features/profile/providers/profile_notifier.dart';
import 'package:lunchbox/features/profile/providers/profile_state.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';

/// 用户中心视图
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfileState state = ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 用户信息头部
          _buildUserHeader(context, state, notifier),

          // 功能菜单
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 8.h),
                _buildMenuSection(context, state),
                SizedBox(height: 8.h),
                _buildSettingsSection(context, notifier),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建用户信息头部
  Widget _buildUserHeader(
    BuildContext context,
    ProfileState state,
    ProfileNotifier notifier,
  ) {
    final user = state.currentUser;
    return SliverAppBar(
      expandedHeight: 200.h,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withValues(alpha: 0.8),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 头像
                  GestureDetector(
                    onTap: () => context.push(AppRoutes.profileEdit),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: CircleAvatar(
                        radius: 40.r,
                        backgroundColor: Colors.white,
                        backgroundImage: user?.avatar != null
                            ? CachedNetworkImageProvider(user!.avatar!)
                            : null,
                        child: user?.avatar == null
                            ? Icon(
                                Icons.person,
                                size: 40.sp,
                                color: Colors.grey,
                              )
                            : null,
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // 用户名
                  Text(
                    user?.nickname ?? t.profile.notLoggedIn,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  // 用户名
                  Text(
                    user?.username ?? '',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 构建功能菜单区域
  Widget _buildMenuSection(BuildContext context, ProfileState state) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.receipt_long,
            title: t.order.myOrders,
            onTap: () => context.push(AppRoutes.orderList),
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.favorite,
            title: t.profile.favoriteDevices,
            trailing: state.favoriteDevices.isNotEmpty
                ? Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      '${state.favoriteDevices.length}',
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    ),
                  )
                : const SizedBox.shrink(),
            onTap: () => context.push(AppRoutes.favoriteDevices),
          ),
        ],
      ),
    );
  }

  /// 构建设置区域
  Widget _buildSettingsSection(BuildContext context, ProfileNotifier notifier) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.person_outline,
            title: t.profile.personalInfo,
            onTap: () => context.push(AppRoutes.profileEdit),
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.cleaning_services_outlined,
            title: t.settings.clearCache,
            onTap: () => _showClearCacheDialog(context),
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.info_outline,
            title: t.settings.aboutUs,
            onTap: () => _showAboutDialog(context),
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.logout,
            title: t.profile.logout,
            titleColor: Colors.red,
            onTap: () => _showLogoutDialog(context, notifier),
          ),
        ],
      ),
    );
  }

  /// 构建菜单项
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    Color? titleColor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: [
            Icon(icon, size: 24.sp, color: titleColor ?? Colors.grey[700]),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: titleColor ?? Colors.black87,
                ),
              ),
            ),
            if (trailing != null)
              trailing
            else
              Icon(Icons.chevron_right, size: 20.sp, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  /// 构建分割线
  Widget _buildDivider() {
    return Divider(height: 1.h, indent: 52.w, endIndent: 16.w);
  }

  void _showLogoutDialog(BuildContext context, ProfileNotifier notifier) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.profile.confirmLogout),
        content: Text(t.profile.confirmLogoutContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              notifier.logout();
              Navigator.pop(context);
              context.go(AppRoutes.login);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(t.common.logout),
          ),
        ],
      ),
    );
  }

  void _showClearCacheDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.settings.clearCache),
        content: Text(t.profile.clearCacheConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO(User): 实现清除缓存逻辑
              Navigator.pop(context);
            },
            child: Text(t.common.confirm),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.settings.aboutUs),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t.common.appName),
            const SizedBox(height: 8),
            Text(
              t.profile.version(version: '1.0.0'),
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            Text(t.profile.appDescription),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.ok),
          ),
        ],
      ),
    );
  }
}
