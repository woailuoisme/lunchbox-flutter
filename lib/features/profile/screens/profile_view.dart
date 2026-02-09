import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/routes/app_routes.dart';

/// 用户中心视图 (我的)
///
/// 按照最新 UI 截图重构，包含红色渐变头部、资产概览和功能列表
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
          SliverToBoxAdapter(child: _buildHeader(context)),

          // 功能列表菜单
          SliverToBoxAdapter(child: _buildMenuSection(context)),

          SliverToBoxAdapter(child: SizedBox(height: 40.h)),
        ],
      ),
    );
  }

  /// 构建红色渐变头部
  ///
  /// 包含背景渐变、状态栏占位、用户信息以及资产信息（钱包、币、券）
  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withValues(alpha: 0.8),
          ],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 50.h),
          // 标题栏
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 40),
                Text(
                  '个人中心',
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Icons removed
              ],
            ),
          ),
          SizedBox(height: 30.h),
          // 用户信息
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                Container(
                  width: 64.w,
                  height: 64.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: theme.colorScheme.onPrimary.withValues(alpha: 0.5),
                      width: 2,
                    ),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://picsum.photos/seed/user/200',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    'Hi! 166****2309',
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: theme.colorScheme.onPrimary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    '退出',
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          // 资产信息容器 (磨砂玻璃效果感)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.symmetric(vertical: 24.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface.withValues(alpha: 0.12),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Row(
              children: [
                _buildAssetItem(
                  context,
                  '999962.07',
                  '钱包余额',
                  onTap: () => context.push(AppRoutes.wallet),
                ),
                _buildAssetItem(
                  context,
                  '300',
                  '乖乖币',
                  onTap: () => context.push(AppRoutes.myPoints),
                ),
                _buildAssetItem(
                  context,
                  '9',
                  '优惠券',
                  onTap: () => context.push(AppRoutes.coupons),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建资产单项
  ///
  /// 展示资产数值及名称，使用白色文字以配合红色背景
  Widget _buildAssetItem(
    BuildContext context,
    String value,
    String label, {
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                color: theme.colorScheme.onPrimary.withValues(alpha: 0.8),
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建功能列表菜单
  ///
  /// 垂直展示钱包、优惠券、设置等功能项
  Widget _buildMenuSection(BuildContext context) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.cardColor,
      child: Column(
        children: [
          _buildMenuTile(
            context: context,
            icon: Symbols.account_balance_wallet,
            title: '我的钱包',
            trailingText: '999962.07',
            trailingColor: theme.colorScheme.primary,
            onTap: () => context.push(AppRoutes.wallet),
          ),
          _buildMenuTile(
            context: context,
            icon: Symbols.airplane_ticket,
            title: '优惠券',
            onTap: () => context.push(AppRoutes.coupons),
          ),
          _buildMenuTile(
            context: context,
            icon: Symbols.help,
            title: '问题反馈',
            onTap: () => context.push(AppRoutes.feedback),
          ),
          _buildMenuTile(
            context: context,
            icon: Symbols.person,
            title: '个人信息',
            onTap: () => context.push(AppRoutes.profileEdit),
          ),
          _buildMenuTile(
            context: context,
            icon: Symbols.handshake,
            title: '合作商加盟',
            onTap: () => context.push(AppRoutes.partner),
          ),
          _buildMenuTile(
            context: context,
            icon: Symbols.info,
            title: '关于我们',
            onTap: () => context.push(AppRoutes.aboutUs),
          ),
          _buildMenuTile(
            context: context,
            icon: Symbols.settings,
            title: '设置',
            onTap: () => context.push(AppRoutes.settings),
          ),
        ],
      ),
    );
  }

  /// 构建菜单项
  ///
  /// 单个功能行，包含图标、标题、可选的尾部文字及右箭头
  Widget _buildMenuTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    String? trailingText,
    Color? trailingColor,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: theme.dividerColor, width: 1.h),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 24.sp, color: theme.colorScheme.primary),
            SizedBox(width: 16.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 15.sp,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
            const Spacer(),
            if (trailingText != null)
              Text(
                trailingText,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: trailingColor ?? theme.hintColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            SizedBox(width: 4.w),
            Icon(
              Symbols.chevron_right,
              size: 20.sp,
              color: theme.disabledColor,
            ),
          ],
        ),
      ),
    );
  }
}
