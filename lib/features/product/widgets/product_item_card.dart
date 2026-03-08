import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/product/entities/category_product_model.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 产品列表项组件
class ProductItemCard extends ConsumerWidget {
  const ProductItemCard({required this.product, super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cartState = ref.watch(cartProvider);
    final cartItems = cartState.value?.cartItems ?? [];

    // 在购物车中查找该商品以获取数量
    final cartItem = cartItems
        .where((CartItemModel item) => item.productId == product.id.toString())
        .firstOrNull;
    final quantity = cartItem?.quantity ?? 0;

    return InkWell(
      onTap: () => context.push('/product/${product.id}'),
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 左侧：图片和价格
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'product_image_${product.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: SizedBox(
                      width: 96.w,
                      height: 96.w,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          AppImage(
                            imageUrl: product.imageUrl,
                            width: 96.w,
                            height: 96.w,
                          ),
                          if (!product.hasStock)
                            Container(
                              color: Colors.black54,
                              alignment: Alignment.center,
                              child: Text(
                                t.device.soldOut,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '¥',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.error,
                            ),
                          ),
                          TextSpan(
                            text: product.price.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w900,
                              color: theme.colorScheme.error,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (product.hasDiscount) ...[
                      SizedBox(width: 4.w),
                      Text(
                        '¥${product.originalPrice!.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: theme.hintColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ).animate().fadeIn(duration: 400.ms),
            SizedBox(width: 16.w),
            // 右侧：内容和操作
            Expanded(
              child: SizedBox(
                height: 96.w + 30.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 2.h,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.secondaryContainer
                                    .withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Text(
                                '${t.product.monthlySales} ${product.sales}',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: theme.colorScheme.onSecondaryContainer,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            if (!product.hasStock) ...[
                              SizedBox(width: 8.w),
                              Text(
                                '${t.product.stock}: ${product.stock}',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: theme.colorScheme.error,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: _buildActionButtons(
                        context,
                        ref,
                        theme,
                        quantity,
                        cartItem,
                      ),
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn(duration: 400.ms, delay: 100.ms),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    WidgetRef ref,
    ThemeData theme,
    int quantity,
    CartItemModel? cartItem,
  ) {
    if (!product.hasStock) {
      return Icon(
        Symbols.remove_shopping_cart,
        size: 24.sp,
        color: theme.disabledColor,
      );
    }

    if (quantity > 0 && cartItem != null) {
      final isDark = theme.brightness == Brightness.dark;
      final foregroundColor = isDark
          ? theme.colorScheme.onSurface
          : theme.colorScheme.primary;

      return Container(
        height: 36.h,
        decoration: BoxDecoration(
          color: isDark
              ? theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3)
              : theme.colorScheme.primary.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(18.h),
          border: Border.all(
            color: isDark
                ? theme.colorScheme.outline.withValues(alpha: 0.1)
                : theme.colorScheme.primary.withValues(alpha: 0.1),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                ref.read(cartProvider.notifier).decreaseQuantity(cartItem);
              },
              borderRadius: BorderRadius.circular(18.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Icon(
                  Symbols.remove,
                  size: 20.sp,
                  color: foregroundColor,
                ),
              ),
            ),
            Text(
              quantity.toString(),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: foregroundColor,
              ),
            ),
            InkWell(
              onTap: () {
                ref.read(cartProvider.notifier).increaseQuantity(cartItem);
              },
              borderRadius: BorderRadius.circular(18.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Icon(Symbols.add, size: 20.sp, color: foregroundColor),
              ),
            ),
          ],
        ),
      );
    }

    return InkWell(
      onTap: () {
        ref.read(cartProvider.notifier).addToCart(product);
      },
      child: Container(
        width: 36.w,
        height: 36.w,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(18.w),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          Symbols.add,
          color: theme.colorScheme.onPrimary,
          size: 24.sp,
        ),
      ),
    );
  }
}
