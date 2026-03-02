import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lunchbox/features/onboarding/providers/onboarding_provider.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Onboarding 引导页视图
class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 使用 watch 确保 OnboardingNotifier 在视图生命周期内不被 AutoDispose 销毁
    ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final bodyStyle = TextStyle(
      fontSize: 16.sp,
      color: colorScheme.onSurfaceVariant,
      height: 1.6,
    );

    final pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w800,
        color: colorScheme.onSurface,
        letterSpacing: -0.5,
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
      pageColor: colorScheme.surface,
      imagePadding: EdgeInsets.only(top: 60.h, bottom: 24.h),
      imageFlex: 3,
      bodyFlex: 2,
      footerPadding: EdgeInsets.symmetric(vertical: 24.h),
    );

    return IntroductionScreen(
      globalBackgroundColor: colorScheme.surface,
      allowImplicitScrolling: true,
      pages: [
        PageViewModel(
          title: t.onboarding.welcomeTitle,
          body: t.onboarding.welcomeBody,
          image: _buildAnimatedImage(
            context,
            Symbols.lunch_dining,
            colorScheme.primary,
            0,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: t.onboarding.findDevicesTitle,
          body: t.onboarding.findDevicesBody,
          image: _buildAnimatedImage(
            context,
            Symbols.location_on,
            colorScheme.primary,
            1,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: t.onboarding.paymentTitle,
          body: t.onboarding.paymentBody,
          image: _buildAnimatedImage(
            context,
            Symbols.credit_card,
            colorScheme.primary,
            2,
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () async {
        await notifier.completeOnboarding();
        if (context.mounted) {
          context.go(AppRoutes.signin);
        }
      },
      onSkip: () async {
        await notifier.completeOnboarding();
        if (context.mounted) {
          context.go(AppRoutes.signin);
        }
      },
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      skip: Text(
        t.common.skip,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: colorScheme.outline,
          fontSize: 15.sp,
        ),
      ),
      next: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Symbols.arrow_forward,
          color: colorScheme.onPrimaryContainer,
          size: 20.sp,
        ),
      ),
      done: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          t.onboarding.getStarted,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorScheme.onPrimary,
            fontSize: 15.sp,
          ),
        ),
      ),
      curve: Curves.easeInOutCubic,
      controlsMargin: EdgeInsets.all(24.w),
      controlsPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      dotsDecorator: DotsDecorator(
        size: Size(8.0.w, 8.0.w),
        color: colorScheme.outlineVariant,
        activeSize: Size(24.0.w, 8.0.w),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0.r)),
        ),
        activeColor: colorScheme.primary,
        spacing: EdgeInsets.symmetric(horizontal: 4.w),
      ),
    );
  }

  /// 构建带动画的引导页图片
  Widget _buildAnimatedImage(
    BuildContext context,
    IconData icon,
    Color color,
    int index,
  ) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 背景装饰圈
          Container(
                width: 200.w,
                height: 200.w,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.05),
                  shape: BoxShape.circle,
                ),
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .scale(
                begin: const Offset(0.8, 0.8),
                end: const Offset(1.1, 1.1),
                duration: 3.seconds,
                curve: Curves.easeInOut,
              ),

          // 中间主图标容器
          Container(
                width: 140.w,
                height: 140.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      color.withValues(alpha: 0.2),
                      color.withValues(alpha: 0.1),
                    ],
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: color.withValues(alpha: 0.2),
                    width: 2,
                  ),
                ),
                child: Icon(icon, size: 70.sp, color: color),
              )
              .animate()
              .fade(duration: 800.ms, delay: 200.ms)
              .scale(
                begin: const Offset(0.5, 0.5),
                end: const Offset(1.0, 1.0),
                duration: 800.ms,
                curve: Curves.easeOutBack,
              )
              .shimmer(
                delay: 1.seconds,
                duration: 2.seconds,
                color: Colors.white.withValues(alpha: 0.3),
              ),
        ],
      ),
    );
  }
}
