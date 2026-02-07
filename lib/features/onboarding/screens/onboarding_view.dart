import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lunchbox/features/onboarding/providers/onboarding_notifier.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';

/// Onboarding 引导页视图
class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 使用 watch 确保 OnboardingNotifier 在视图生命周期内不被 AutoDispose 销毁
    // 只有 watch 会建立监听关系并保持 Provider 活跃
    ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);

    final bodyStyle = TextStyle(fontSize: 16.sp, color: Colors.grey[600]);

    final pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      pageColor: Theme.of(context).scaffoldBackgroundColor,
      imagePadding: EdgeInsets.only(top: 24.h),
      imageFlex: 2,
    );

    return IntroductionScreen(
      globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      allowImplicitScrolling: true,

      pages: [
        PageViewModel(
          title: t.onboarding.welcomeTitle,
          body: t.onboarding.welcomeBody,
          image: _buildImage(
            context,
            Icons.lunch_dining,
            Theme.of(context).primaryColor,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: t.onboarding.findDevicesTitle,
          body: t.onboarding.findDevicesBody,
          image: _buildImage(context, Icons.location_on, Colors.orange),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: t.onboarding.paymentTitle,
          body: t.onboarding.paymentBody,
          image: _buildImage(context, Icons.credit_card, Colors.green),
          decoration: pageDecoration,
        ),
      ],
      onDone: () async {
        await notifier.completeOnboarding();
        if (context.mounted) {
          context.go(AppRoutes.login);
        }
      },
      onSkip: () async {
        await notifier.completeOnboarding();
        if (context.mounted) {
          context.go(AppRoutes.login);
        }
      },
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      skip: Text(
        t.common.skip,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      next: const Icon(Icons.arrow_forward),
      done: Text(
        t.onboarding.getStarted,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: EdgeInsets.all(16.w),
      controlsPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      dotsDecorator: DotsDecorator(
        size: Size(10.0.w, 10.0.w),
        color: const Color(0xFFBDBDBD),
        activeSize: Size(22.0.w, 10.0.w),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0.r)),
        ),
        activeColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildImage(BuildContext context, IconData icon, Color color) {
    return Center(
      child: Container(
        width: 120.w,
        height: 120.w,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 60.sp, color: color),
      ),
    );
  }
}
