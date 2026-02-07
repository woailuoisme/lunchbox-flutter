import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 用户中心视图 (我的)
///
/// 按照最新 UI 截图重构，包含红色渐变头部、资产概览和功能列表
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: CustomScrollView(
        slivers: [
          // 红色渐变背景头部
          SliverToBoxAdapter(child: _buildHeader()),

          // 功能列表菜单
          SliverToBoxAdapter(child: _buildMenuSection()),

          SliverToBoxAdapter(child: SizedBox(height: 40.h)),
        ],
      ),
    );
  }

  /// 构建红色渐变头部
  ///
  /// 包含背景渐变、状态栏占位、用户信息以及资产信息（钱包、币、券）
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFFF5252),
            const Color(0xFFFF8A80).withValues(alpha: 0.9),
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
                  '我的',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.more_horiz, color: Colors.white, size: 24.sp),
                    SizedBox(width: 12.w),
                    Icon(
                      Icons.radio_button_checked,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ],
                ),
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
                      color: Colors.white.withValues(alpha: 0.5),
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
                      color: Colors.white,
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
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    '退出',
                    style: TextStyle(color: Colors.white, fontSize: 13.sp),
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
              color: Colors.white.withValues(alpha: 0.12),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Row(
              children: [
                _buildAssetItem('999962.07', '钱包余额'),
                _buildAssetItem('300', '乖乖币'),
                _buildAssetItem('9', '优惠券'),
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
  Widget _buildAssetItem(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }

  /// 构建功能列表菜单
  ///
  /// 垂直展示钱包、优惠券、设置等功能项
  Widget _buildMenuSection() {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          _buildMenuTile(
            icon: Icons.account_balance_wallet_outlined,
            title: '我的钱包',
            trailingText: '999962.07',
            trailingColor: const Color(0xFFFF5252),
          ),
          _buildMenuTile(icon: Icons.assignment_outlined, title: '优惠券'),
          _buildMenuTile(icon: Icons.help_outline, title: '问题反馈'),
          _buildMenuTile(icon: Icons.person_outline, title: '个人信息'),
          _buildMenuTile(icon: Icons.handshake_outlined, title: '合作商加盟'),
          _buildMenuTile(icon: Icons.info_outline, title: '关于我们'),
          _buildMenuTile(icon: Icons.settings_outlined, title: '设置'),
        ],
      ),
    );
  }

  /// 构建菜单项
  ///
  /// 单个功能行，包含图标、标题、可选的尾部文字及右箭头
  Widget _buildMenuTile({
    required IconData icon,
    required String title,
    String? trailingText,
    Color? trailingColor,
  }) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: const Color(0xFFF5F5F5), width: 1.h),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24.sp, color: const Color(0xFF666666)),
          SizedBox(width: 16.w),
          Text(
            title,
            style: TextStyle(fontSize: 15.sp, color: const Color(0xFF333333)),
          ),
          const Spacer(),
          if (trailingText != null)
            Text(
              trailingText,
              style: TextStyle(
                fontSize: 16.sp,
                color: trailingColor ?? const Color(0xFF999999),
                fontWeight: FontWeight.bold,
              ),
            ),
          SizedBox(width: 4.w),
          Icon(
            Icons.chevron_right,
            size: 20.sp,
            color: const Color(0xFFCCCCCC),
          ),
        ],
      ),
    );
  }
}
