import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/features/splash/providers/splash_provider.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    // 移除原生启动页
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Listen for navigation events
    ref.listen(splashProvider, (previous, next) {
      final path = next.value?.navigationPath;
      if (path != null) {
        context.go(path);
      }
    });

    final splashAsync = ref.watch(splashProvider);
    final state = splashAsync.value ?? const SplashState();
    final controller = ref.read(splashProvider.notifier);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (splashAsync.hasError) {
              return _buildErrorView(
                context,
                state,
                splashAsync.error.toString(),
                controller,
              );
            }
            return _buildSplashView(context, state);
          },
        ),
      ),
    );
  }

  Widget _buildSplashView(BuildContext context, SplashState state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLogo(context),
          SizedBox(height: 40.h),
          _buildAppName(context),
          SizedBox(height: 60.h),
          _buildLoadingIndicator(context, state),
          SizedBox(height: 20.h),
          _buildLoadingText(context, state),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      width: 120.w,
      height: 120.w,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Symbols.lunch_dining,
          size: 60.sp,
          color: colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildAppName(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Column(
      children: [
        Text(
          t.common.appName,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: colorScheme.onPrimary,
            letterSpacing: 2,
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }

  Widget _buildLoadingIndicator(BuildContext context, SplashState state) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return SizedBox(
      width: 200.w,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: LinearProgressIndicator(
              value: state.initializationProgress,
              backgroundColor: colorScheme.onPrimary.withValues(alpha: 0.3),
              valueColor: AlwaysStoppedAnimation<Color>(colorScheme.onPrimary),
              minHeight: 6.h,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '${(state.initializationProgress * 100).toInt()}%',
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 12.sp,
              color: colorScheme.onPrimary.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingText(BuildContext context, SplashState state) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final progress = state.initializationProgress;
    String message = t.splash.starting;

    if (progress >= 0.2 && progress < 0.4) {
      message = t.splash.checkingServices;
    } else if (progress >= 0.4 && progress < 0.6) {
      message = t.splash.loadingConfig;
    } else if (progress >= 0.6 && progress < 0.8) {
      message = t.splash.checkingAuth;
    } else if (progress >= 0.8 && progress < 1.0) {
      message = t.splash.preparingData;
    } else if (progress >= 1.0) {
      message = t.splash.ready;
    }

    return Text(
      message,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontSize: 14.sp,
        color: colorScheme.onPrimary.withValues(alpha: 0.9),
      ),
    );
  }

  Widget _buildErrorView(
    BuildContext context,
    SplashState state,
    String errorMessage,
    SplashNotifier controller,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Symbols.error, size: 80.sp, color: colorScheme.onPrimary),
            SizedBox(height: 24.h),
            Text(
              t.splash.failed,
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimary,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 14.sp,
                color: colorScheme.onPrimary.withValues(alpha: 0.9),
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => controller.retryInitialization(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.onPrimary,
                    foregroundColor: colorScheme.primary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    t.common.retry,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                OutlinedButton(
                  onPressed: () => controller.skipError(),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: colorScheme.onPrimary,
                    side: BorderSide(color: colorScheme.onPrimary),
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    t.common.skip,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
