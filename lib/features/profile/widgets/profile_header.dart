import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/profile/widgets/profile_asset_item.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/routes.dart';

/// 个人中心红色渐变头部组件
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.username,
    required this.walletBalance,
    required this.points,
    required this.coupons,
    this.avatarUrl,
    this.onLogout,
  });

  final String username;
  final String walletBalance;
  final String points;
  final String coupons;
  final String? avatarUrl;
  final VoidCallback? onLogout;

  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  t.profile.title,
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
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
                      color: theme.colorScheme.onPrimary.withValues(alpha: 0.5),
                      width: 2,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        avatarUrl ?? 'https://picsum.photos/seed/user/200',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    'Hi! $username',
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (onLogout != null)
                  InkWell(
                    onTap: onLogout,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onPrimary.withValues(
                          alpha: 0.2,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: theme.colorScheme.onPrimary.withValues(
                            alpha: 0.3,
                          ),
                        ),
                      ),
                      child: Text(
                        t.common.logout,
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 13.sp,
                        ),
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
                ProfileAssetItem(
                  value: walletBalance,
                  label: t.profile.walletBalance,
                  onTap: () => const WalletRoute().push<void>(context),
                ),
                ProfileAssetItem(
                  value: points,
                  label: t.profile.coin,
                  onTap: () => const MyPointsRoute().push<void>(context),
                ),
                ProfileAssetItem(
                  value: coupons,
                  label: t.profile.couponCount,
                  onTap: () => const MyCouponsRoute().push<void>(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
