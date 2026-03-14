import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Onboarding 引导页动画图片组件
///
/// 采用叠加容器和微动画，营造高级感视觉效果。
class OnboardingAnimatedImage extends StatelessWidget {
  const OnboardingAnimatedImage({
    super.key,
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 背景装饰圈：循环缩放动画
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

          // 中间主图标容器：进入时弹性缩放 + 闪烁光影
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
