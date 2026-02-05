import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/features/splash/providers/splash_notifier.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen for navigation events
    ref.listen(splashProvider, (previous, next) {
      if (next.navigationPath != null) {
        context.go(next.navigationPath!);
      }
    });

    final state = ref.watch(splashProvider);
    final controller = ref.read(splashProvider.notifier);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (state.initializationError != null) {
              return _buildErrorView(context, state, controller);
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
    return Container(
      width: 120.w,
      height: 120.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.lunch_dining,
          size: 60.sp,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget _buildAppName(BuildContext context) {
    return Column(
      children: [
        Text(
          '饭盒售货机',
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'E-Lunchbox',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white.withValues(alpha: 0.8),
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingIndicator(BuildContext context, SplashState state) {
    return SizedBox(
      width: 200.w,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: LinearProgressIndicator(
              value: state.initializationProgress,
              backgroundColor: Colors.white.withValues(alpha: 0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              minHeight: 6.h,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '${(state.initializationProgress * 100).toInt()}%',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingText(BuildContext context, SplashState state) {
    final progress = state.initializationProgress;
    String message = '正在启动...';

    if (progress >= 0.2 && progress < 0.4) {
      message = '检查服务状态...';
    } else if (progress >= 0.4 && progress < 0.6) {
      message = '加载配置...';
    } else if (progress >= 0.6 && progress < 0.8) {
      message = '检查登录状态...';
    } else if (progress >= 0.8 && progress < 1.0) {
      message = '准备数据...';
    } else if (progress >= 1.0) {
      message = '启动完成';
    }

    return Text(
      message,
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.white.withValues(alpha: 0.9),
      ),
    );
  }

  Widget _buildErrorView(
    BuildContext context,
    SplashState state,
    SplashNotifier controller,
  ) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 80.sp, color: Colors.white),
            SizedBox(height: 24.h),
            Text(
              '启动失败',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              state.initializationError ?? '未知错误',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => controller.retryInitialization(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    '重试',
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
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    '跳过',
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
