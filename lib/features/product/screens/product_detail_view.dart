import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/features/product/providers/product_providers.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 产品详情视图
class ProductDetailView extends ConsumerWidget {
  const ProductDetailView({required this.productId, super.key});
  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productDetailProvider(productId));
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: productAsync.when(
        data: (product) => CustomScrollView(
          slivers: [
            // 产品图片
            SliverAppBar(
              expandedHeight: 300.h,
              pinned: true,
              backgroundColor: theme.appBarTheme.backgroundColor,
              foregroundColor: theme.appBarTheme.foregroundColor,
              flexibleSpace: FlexibleSpaceBar(
                background: AppImage(imageUrl: product.imageUrl),
              ),
              actions: [
                IconButton(icon: const Icon(Symbols.share), onPressed: () {}),
                IconButton(
                  icon: const Icon(Symbols.more_horiz),
                  onPressed: () {},
                ),
              ],
            ),

            // 产品信息
            SliverToBoxAdapter(
              child: Container(
                color: theme.colorScheme.surface,
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBasicInfo(context, product),
                    SizedBox(height: 24.h),
                    _buildDescription(context, product),
                    SizedBox(height: 80.h), // 底部留白
                  ],
                ),
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('${t.common.loadFailed}: $error')),
      ),

      // 底部操作栏
      bottomNavigationBar: productAsync.value != null
          ? _buildBottomBar(context, ref, productAsync.value!)
          : null,
    );
  }

  /// 构建基本信息
  Widget _buildBasicInfo(BuildContext context, ProductModel product) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 产品名称
        Text(
          product.name,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: theme.textTheme.titleLarge?.color,
          ),
        ),
        SizedBox(height: 8.h),

        // 标签（如果有）
        if (product.isHot || product.isPromotion)
          Row(
            children: [
              if (product.isHot)
                _buildTag(context, t.product.hot, theme.colorScheme.error),
              if (product.isPromotion) ...[
                SizedBox(width: 8.w),
                _buildTag(
                  context,
                  t.product.promotion,
                  theme.colorScheme.tertiary,
                ),
              ],
            ],
          ),
        if (product.isHot || product.isPromotion) SizedBox(height: 12.h),

        // 价格和销量
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '¥',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.error,
              ),
            ),
            Text(
              product.price.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.error,
              ),
            ),
            if (product.hasDiscount) ...[
              SizedBox(width: 8.w),
              Text(
                '¥${product.originalPrice!.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: theme.hintColor,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: theme.colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  '${product.discountPercentage}% OFF',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: theme.colorScheme.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Text(
              '${t.product.monthlySales} ${product.monthlySales}',
              style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
            ),
            const Spacer(),
            Text(
              product.hasStock ? t.product.stockFull : t.device.soldOut,
              style: TextStyle(
                fontSize: 12.sp,
                color: product.hasStock
                    ? theme.hintColor
                    : theme.colorScheme.error,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTag(BuildContext context, String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// 构建描述
  Widget _buildDescription(BuildContext context, ProductModel product) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.product.detail,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: theme.textTheme.titleMedium?.color,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          product.description.isEmpty
              ? '暂无详细介绍' // TODO: add to translations
              : product.description,
          style: TextStyle(
            fontSize: 14.sp,
            color: theme.textTheme.bodyMedium?.color,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  /// 构建底部操作栏
  Widget _buildBottomBar(
    BuildContext context,
    WidgetRef ref,
    ProductModel product,
  ) {
    final theme = Theme.of(context);
    final cartState = ref.watch(cartProvider);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            // 购物车图标（带角标）
            Badge(
              label: Text(cartState.totalQuantity.toString()),
              isLabelVisible: cartState.totalQuantity > 0,
              backgroundColor: theme.colorScheme.error,
              child: IconButton(
                onPressed: () {
                  context.push('/cart');
                },
                icon: Icon(Symbols.shopping_cart, size: 28.sp),
              ),
            ),
            SizedBox(width: 16.w),

            // 加入购物车按钮
            Expanded(
              child: SizedBox(
                height: 44.h,
                child: ElevatedButton(
                  onPressed: product.hasStock
                      ? () {
                          ref.read(cartProvider.notifier).addToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${t.product.addedToCart}: ${product.name}',
                              ),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.h),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    product.hasStock ? t.product.addToCart : t.device.soldOut,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
