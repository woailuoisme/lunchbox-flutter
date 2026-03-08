import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/home/providers/home_provider.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/routes.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// 首页功能矩阵组件
class HomeFunctionGrid extends ConsumerWidget {
  const HomeFunctionGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final homeState = ref.watch(homeProvider);
    final isLoading = homeState.isLoading;

    final items = [
      {
        'icon': Symbols.card_giftcard,
        'label': t.home.grid.welfare,
        'color': colorScheme.primary,
      },
      {
        'icon': Symbols.headset_mic,
        'label': t.home.grid.service,
        'color': colorScheme.primary,
      },
      {
        'icon': Symbols.confirmation_number,
        'label': t.home.grid.coupon,
        'color': colorScheme.primary,
      },
      {
        'icon': Symbols.stars,
        'label': t.home.grid.lottery,
        'color': colorScheme.primary,
      },
      {
        'icon': Symbols.person_add,
        'label': t.home.grid.invite,
        'color': colorScheme.primary,
      },
    ];

    return Skeletonizer(
      enabled: isLoading,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child:
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: items.map((item) {
                    return GestureDetector(
                      onTap: () {
                        if (item['label'] == t.home.grid.lottery) {
                          const LotteryRoute().push<void>(context);
                        } else if (item['label'] == t.home.grid.welfare) {
                          const CommunityRoute().push<void>(context);
                        } else if (item['label'] == t.home.grid.coupon) {
                          const CouponsRoute().push<void>(context);
                        } else if (item['label'] == t.home.grid.invite) {
                          const InviteRoute().push<void>(context);
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 48.w,
                            height: 48.w,
                            decoration: BoxDecoration(
                              color: (item['color']! as Color).withValues(
                                alpha: 0.1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              item['icon']! as IconData,
                              color: item['color']! as Color,
                              size: 26.sp,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            item['label']! as String,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                )
                .animate(target: isLoading ? 0 : 1)
                .fadeIn(duration: 600.ms, delay: 200.ms)
                .slideY(begin: 0.1, end: 0, curve: Curves.easeOutQuad),
      ),
    );
  }
}
