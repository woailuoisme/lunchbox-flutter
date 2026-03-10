import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 新人礼包头部组件
class WelcomeGiftHeader extends StatelessWidget {
  const WelcomeGiftHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        SizedBox(height: 24.h),
        // 礼包图标
        Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.primaryContainer,
                    colorScheme.primary.withValues(alpha: 0.1),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Symbols.card_giftcard_rounded,
                size: 40.sp,
                color: colorScheme.primary,
              ),
            )
            .animate(onPlay: (controller) => controller.repeat(reverse: true))
            .scale(
              duration: 2.seconds,
              begin: const Offset(1, 1),
              end: const Offset(1.1, 1.1),
            )
            .then()
            .moveY(duration: 2.seconds, begin: 0, end: -5),

        SizedBox(height: 16.h),
        Text(
          t.welcome_gift.title,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),

        SizedBox(height: 8.h),
        Text(
              t.welcome_gift.subtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            )
            .animate()
            .fadeIn(delay: 200.ms, duration: 600.ms)
            .slideY(begin: 0.2, end: 0),
        SizedBox(height: 8.h),
      ],
    );
  }
}
