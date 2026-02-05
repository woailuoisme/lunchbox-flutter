import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/features/profile/providers/profile_notifier.dart';
import 'package:lunchbox/features/profile/providers/profile_state.dart';
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
                    user?.nickname ?? '未登录',
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
            title: '我的订单',
            onTap: () => context.push(AppRoutes.orderList),
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.favorite,
            title: '收藏设备',
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
            title: '个人信息',
            onTap: () => context.push(AppRoutes.profileEdit),
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.cleaning_services_outlined,
            title: '清除缓存',
            onTap: () => _showClearCacheDialog(context),
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.info_outline,
            title: '关于我们',
            onTap: () => _showAboutDialog(context),
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.logout,
            title: '退出登录',
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
        title: const Text('确认退出'),
        content: const Text('确定要退出登录吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
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
            child: const Text('退出'),
          ),
        ],
      ),
    );
  }

  void _showClearCacheDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('清除缓存'),
        content: const Text('确定要清除所有缓存数据吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO(User): 实现清除缓存逻辑
              Navigator.pop(context);
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('关于我们'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('饭盒售货机'),
            const SizedBox(height: 8),
            Text('版本：1.0.0', style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 16),
            const Text('一个便捷的自动售货机购买应用'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }
}
