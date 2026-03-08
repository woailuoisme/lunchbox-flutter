import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/product/entities/product_detail_model.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// 产品详情底部操作栏
class ProductDetailBottomBar extends ConsumerWidget {
  const ProductDetailBottomBar({required this.product, super.key});

  final ProductDetailModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cartState = ref.watch(cartProvider);
    final totalQuantity = cartState.value?.totalQuantity ?? 0;

    return Container(
      padding: EdgeInsets.fromLTRB(
        24.w,
        16.h,
        24.w,
        MediaQuery.of(context).padding.bottom + 16.h,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          // 购物车图标（带角标）
          Badge(
            label: Text(
              totalQuantity.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
            ),
            isLabelVisible: totalQuantity > 0,
            backgroundColor: theme.colorScheme.error,
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            offset: const Offset(4, -4),
            child: Container(
              height: 48.w,
              width: 48.w,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondaryContainer.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: theme.colorScheme.outline.withValues(alpha: 0.1),
                ),
              ),
              child: IconButton(
                onPressed: () {
                  context.push('/cart');
                },
                icon: Icon(Symbols.shopping_cart, size: 24.sp),
                color: theme.colorScheme.onSecondaryContainer,
                tooltip: t.cart.title,
              ),
            ),
          ),
          SizedBox(width: 16.w),

          // 加入购物车按钮
          Expanded(
            child: SizedBox(
              height: 54.h,
              child: ElevatedButton(
                onPressed: product.isEnabled
                    ? () {
                        ref
                            .read(cartProvider.notifier)
                            .addToCart(product.toProductModel());
                        // Haptic feedback could be added here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Icon(
                                  Symbols.check_circle,
                                  color: theme.colorScheme.onInverseSurface,
                                  size: 20.sp,
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Text(
                                    '${t.product.addedToCart}: ${product.name}',
                                    style: TextStyle(
                                      color: theme.colorScheme.onInverseSurface,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            margin: EdgeInsets.fromLTRB(
                              16.w,
                              0,
                              16.w,
                              MediaQuery.of(context).padding.bottom + 80.h,
                            ),
                            duration: 2.seconds,
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(
                  product.isEnabled ? t.product.addToCart : t.device.soldOut,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
