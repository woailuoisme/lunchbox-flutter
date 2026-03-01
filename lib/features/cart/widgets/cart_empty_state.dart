import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 购物车为空时的占位组件
class CartEmptyState extends StatelessWidget {
  const CartEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.3,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Symbols.shopping_cart_off,
              size: 64.sp,
              color: theme.colorScheme.outline,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            t.cart.empty,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            t.cart.emptyHint,
            style: TextStyle(
              fontSize: 14.sp,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 32.h),
          FilledButton.icon(
            onPressed: () => context.go(AppRoutes.home),
            icon: const Icon(Symbols.storefront),
            label: Text(t.cart.goShopping),
            style: FilledButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
