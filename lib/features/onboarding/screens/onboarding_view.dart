import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lunchbox/features/onboarding/providers/onboarding_provider.dart';
import 'package:lunchbox/features/onboarding/widgets/onboarding_animated_image.dart';
import 'package:lunchbox/features/onboarding/widgets/onboarding_button.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Onboarding 引导页视图
///
/// 结构化重构：将 UI 组件拆分为独立 Widget，支持更清晰的状态管理和视图定义。
class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 确保组件生命周期与 Notifier 同步
    ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // 统一配置页面样式
    final pageDecoration = _buildPageDecoration(colorScheme);

    return IntroductionScreen(
      globalBackgroundColor: colorScheme.surface,
      allowImplicitScrolling: true,
      pages: _buildPages(context, colorScheme, pageDecoration),
      onDone: () => _handleOnboardingComplete(context, notifier),
      onSkip: () => _handleOnboardingComplete(context, notifier),
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      // 使用提取出的独立组件
      skip: OnboardingSkipButton(
        text: t.common.skip,
        color: colorScheme.outline,
      ),
      next: OnboardingNextButton(
        backgroundColor: colorScheme.primaryContainer,
        iconColor: colorScheme.onPrimaryContainer,
      ),
      done: OnboardingDoneButton(
        text: t.onboarding.getStarted,
        backgroundColor: colorScheme.primary,
        textColor: colorScheme.onPrimary,
      ),
      curve: Curves.easeInOutCubic,
      controlsMargin: EdgeInsets.all(24.w),
      dotsDecorator: _buildDotsDecorator(colorScheme),
    );
  }

  /// 构建页面装饰样式
  PageDecoration _buildPageDecoration(ColorScheme colorScheme) {
    return PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w800,
        color: colorScheme.onSurface,
        letterSpacing: -0.5,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 16.sp,
        color: colorScheme.onSurfaceVariant,
        height: 1.6,
      ),
      bodyPadding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
      pageColor: colorScheme.surface,
      imagePadding: EdgeInsets.only(top: 60.h, bottom: 24.h),
      imageFlex: 3,
      bodyFlex: 2,
    );
  }

  /// 构建引导页具体内容列表
  List<PageViewModel> _buildPages(
    BuildContext context,
    ColorScheme colorScheme,
    PageDecoration decoration,
  ) {
    return [
      PageViewModel(
        title: t.onboarding.welcomeTitle,
        body: t.onboarding.welcomeBody,
        image: OnboardingAnimatedImage(
          icon: Symbols.lunch_dining,
          color: colorScheme.primary,
        ),
        decoration: decoration,
      ),
      PageViewModel(
        title: t.onboarding.findDevicesTitle,
        body: t.onboarding.findDevicesBody,
        image: OnboardingAnimatedImage(
          icon: Symbols.location_on,
          color: colorScheme.primary,
        ),
        decoration: decoration,
      ),
      PageViewModel(
        title: t.onboarding.paymentTitle,
        body: t.onboarding.paymentBody,
        image: OnboardingAnimatedImage(
          icon: Symbols.credit_card,
          color: colorScheme.primary,
        ),
        decoration: decoration,
      ),
    ];
  }

  /// 构建进度点指示器样式
  DotsDecorator _buildDotsDecorator(ColorScheme colorScheme) {
    return DotsDecorator(
      size: Size(8.0.w, 8.0.w),
      color: colorScheme.outlineVariant,
      activeSize: Size(24.0.w, 8.0.w),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0.r)),
      ),
      activeColor: colorScheme.primary,
      spacing: EdgeInsets.symmetric(horizontal: 4.w),
    );
  }

  /// 统一处理完成/跳过逻辑
  Future<void> _handleOnboardingComplete(
    BuildContext context,
    OnboardingNotifier notifier,
  ) async {
    await notifier.completeOnboarding();
    if (context.mounted) {
      context.go(AppRoutes.signin);
    }
  }
}
