import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/app_routes.dart';
import '../providers/onboarding_notifier.dart';
import '../providers/onboarding_state.dart';

/// Onboarding 引导页视图
class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingNotifierProvider);
    final notifier = ref.read(onboardingNotifierProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 跳过按钮
            _buildSkipButton(context, notifier),

            // 引导页内容
            Expanded(
              child: PageView(
                onPageChanged: notifier.onPageChanged,
                children: [
                  _buildOnboardingPage(
                    context: context,
                    icon: Icons.lunch_dining,
                    title: '欢迎使用饭盒售货机',
                    description: '随时随地，轻松购买美味午餐',
                    color: Theme.of(context).primaryColor,
                  ),
                  _buildOnboardingPage(
                    context: context,
                    icon: Icons.location_on,
                    title: '查找附近设备',
                    description: '快速定位最近的售货机，节省您的时间',
                    color: Colors.orange,
                  ),
                  _buildOnboardingPage(
                    context: context,
                    icon: Icons.payment,
                    title: '便捷支付',
                    description: '支持微信、支付宝等多种支付方式',
                    color: Colors.green,
                  ),
                ],
              ),
            ),

            // 页面指示器和按钮
            _buildBottomSection(context, state, notifier),
          ],
        ),
      ),
    );
  }

  /// 构建跳过按钮
  Widget _buildSkipButton(BuildContext context, OnboardingNotifier notifier) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Align(
        alignment: Alignment.topRight,
        child: TextButton(
          onPressed: () {
            notifier.skipOnboarding();
            context.go(AppRoutes.login);
          },
          child: Text(
            '跳过',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
          ),
        ),
      ),
    );
  }

  /// 构建引导页
  Widget _buildOnboardingPage({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 图标
          Container(
            width: 120.w,
            height: 120.w,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 60.sp, color: color),
          ),

          SizedBox(height: 40.h),

          // 标题
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: 16.h),

          // 描述
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  /// 构建底部区域
  Widget _buildBottomSection(
    BuildContext context,
    OnboardingState state,
    OnboardingNotifier notifier,
  ) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        children: [
          // 页面指示器
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              state.totalPages,
              (index) => _buildPageIndicator(
                context: context,
                isActive: index == state.currentPage,
              ),
            ),
          ),

          SizedBox(height: 24.h),

          // 下一步/开始按钮
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (state.isLastPage) {
                  notifier.completeOnboarding();
                  context.go(AppRoutes.login);
                } else {
                  notifier.nextPage();
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                state.isLastPage ? '开始使用' : '下一步',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建页面指示器
  Widget _buildPageIndicator({
    required BuildContext context,
    required bool isActive,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      width: isActive ? 24.w : 8.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Colors.grey[300],
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}
