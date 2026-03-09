import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 抽奖页面底部按钮组件
///
/// 包含跳转到“我的奖品”页面的按钮
class LotteryBottomButtons extends StatelessWidget {
  /// 构造函数
  const LotteryBottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        width: double.infinity,
        child: FilledButton.icon(
          onPressed: () {
            context.push('${AppRoutes.lottery}/${AppRoutes.myPrizes}');
          },
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            padding: EdgeInsets.symmetric(vertical: 14.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            elevation: 2,
          ),
          icon: const Icon(Symbols.card_giftcard, size: 20),
          label: Text(t.lottery.prizes),
        ),
      ),
    );
  }
}
