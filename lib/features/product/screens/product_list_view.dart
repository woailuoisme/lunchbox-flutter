import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/device/device.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/features/product/providers/product_provider.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';

final _dummyProduct = ProductModel(
  id: 'dummy',
  name: '美味的便当名称',
  description: '这是一份美味的便当描述信息，用于展示骨架屏效果。',
  price: 29.90,
  originalPrice: 39.90,
  imageUrl: 'https://via.placeholder.com/300',
  updateTime: DateTime.now(),
  stock: 100,
  monthlySales: 500,
  isHot: true,
  isPromotion: true,
  category: 'food',
);

/// 产品列表视图
class ProductListView extends ConsumerWidget {
  const ProductListView({required this.deviceId, super.key});
  final String deviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceAsync = ref.watch(deviceDetailProvider(deviceId));
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          t.product.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
      body: deviceAsync.when(
        data: (device) => Column(
          children: [
            _buildDeviceHeader(context, device),
            Expanded(child: _ProductContent(deviceId: deviceId)),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('${t.common.loadFailed}: $error')),
      ),
    );
  }

  /// 构建设备头部信息
  Widget _buildDeviceHeader(BuildContext context, DeviceModel device) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: device.isEnabled
                      ? theme.colorScheme.primaryContainer.withValues(
                          alpha: 0.5,
                        )
                      : theme.colorScheme.errorContainer.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      device.isEnabled ? Symbols.check_circle : Symbols.error,
                      size: 14.sp,
                      color: device.isEnabled
                          ? theme.colorScheme.primary
                          : theme.colorScheme.error,
                      fill: 1.0,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      device.isEnabled
                          ? t.device.statusOnline
                          : t.device.statusOffline,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: device.isEnabled
                            ? theme.colorScheme.onPrimaryContainer
                            : theme.colorScheme.onErrorContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Icon(
                Symbols.location_on,
                size: 16.sp,
                color: theme.colorScheme.primary,
                fill: 1.0,
              ),
              SizedBox(width: 4.w),
              Text(
                device.distanceKm ?? device.distance ?? '57.2km',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      device.name,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        color: theme.colorScheme.onSurface,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Icon(
                          Symbols.store,
                          size: 16.sp,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        SizedBox(width: 6.w),
                        Expanded(
                          child: Text(
                            device.fullAddress,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.1, end: 0);
  }
}

class _ProductContent extends ConsumerWidget {
  const _ProductContent({required this.deviceId});

  final String deviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(productCategoriesProvider(deviceId));
    final productsAsync = ref.watch(filteredProductsProvider(deviceId));
    final cartState = ref.watch(cartProvider);
    final theme = Theme.of(context);

    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 左侧分类栏
            SizedBox(
              width: 96.w,
              child: Container(
                color: theme.colorScheme.surfaceContainerLow.withValues(
                  alpha: 0.5,
                ),
                child: categoriesAsync.when(
                  data: (categories) => ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return _CategoryItem(category: category)
                          .animate()
                          .fadeIn(delay: (50 * index).ms)
                          .slideX(begin: -0.2, end: 0);
                    },
                  ),
                  loading: () => Skeletonizer(
                    enabled: true,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return _CategoryItem(category: 'Category $index');
                      },
                    ),
                  ),
                  error: (e, s) => Center(
                    child: Icon(
                      Symbols.error,
                      size: 24.sp,
                      color: theme.colorScheme.error,
                    ),
                  ),
                ),
              ),
            ),

            // 右侧商品列表
            Expanded(
              child: Container(
                color: theme.scaffoldBackgroundColor,
                child: productsAsync.when(
                  data: (products) {
                    if (products.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Symbols.inventory_2,
                              size: 64.sp,
                              color: theme.disabledColor.withValues(alpha: 0.3),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              t.order.noOrders,
                              style: TextStyle(
                                color: theme.disabledColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 400.ms);
                    }
                    return ListView.separated(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                        top: 16.h,
                        bottom: 100.h, // 留出底部购物车栏空间
                      ),
                      itemCount: products.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16.h),
                      itemBuilder: (context, index) {
                        return _ProductItem(product: products[index])
                            .animate()
                            .fadeIn(delay: (50 * index).ms)
                            .slideY(begin: 0.1, end: 0);
                      },
                    );
                  },
                  loading: () => Skeletonizer(
                    enabled: true,
                    child: ListView.separated(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                        top: 16.h,
                        bottom: 100.h,
                      ),
                      itemCount: 6,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16.h),
                      itemBuilder: (context, index) {
                        return _ProductItem(product: _dummyProduct);
                      },
                    ),
                  ),
                  error: (e, _) => Center(child: Text(e.toString())),
                ),
              ),
            ),
          ],
        ),

        // 底部购物车栏
        if (!cartState.isEmpty)
          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 24.h + MediaQuery.of(context).padding.bottom,
            child: _buildCartBar(context, cartState)
                .animate()
                .fadeIn(duration: 300.ms)
                .slideY(begin: 1, end: 0, curve: Curves.easeOutBack),
          ),
      ],
    );
  }

  Widget _buildCartBar(BuildContext context, CartState cartState) {
    final theme = Theme.of(context);
    return Container(
      height: 64.h,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // Dark background for contrast
        borderRadius: BorderRadius.circular(32.h),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.push('/cart'),
          borderRadius: BorderRadius.circular(32.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                // 购物车图标和数量
                Badge(
                      label: Text(
                        cartState.totalQuantity.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                      backgroundColor: theme.colorScheme.error,
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Icon(
                        Symbols.shopping_cart,
                        color: Colors.white,
                        size: 28.sp,
                      ),
                    )
                    .animate(target: cartState.totalQuantity > 0 ? 1 : 0)
                    .scale(
                      begin: const Offset(1, 1),
                      end: const Offset(1.2, 1.2),
                      duration: 100.ms,
                      curve: Curves.easeInOut,
                    )
                    .then()
                    .scale(
                      begin: const Offset(1.2, 1.2),
                      end: const Offset(1, 1),
                      duration: 100.ms,
                    ),
                SizedBox(width: 16.w),
                // 总价
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.cart.total,
                      style: TextStyle(color: Colors.white70, fontSize: 10.sp),
                    ),
                    Text(
                      '¥${cartState.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // 去结算按钮
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(24.h),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.primary.withValues(alpha: 0.4),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    t.cart.checkout,
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryItem extends ConsumerWidget {
  const _CategoryItem({required this.category});

  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(productCategoryProvider);
    final isSelected = selectedCategory == category;
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        ref.read(productCategoryProvider.notifier).update(category);
      },
      child: Container(
        height: 64.h, // Taller for better touch target
        alignment: Alignment.center,
        color: isSelected ? theme.scaffoldBackgroundColor : Colors.transparent,
        child: Stack(
          children: [
            // Active Indicator Background
            if (isSelected)
              Positioned(
                left: 0,
                top: 12.h,
                bottom: 12.h,
                child: Container(
                  width: 4.w,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4.r),
                      bottomRight: Radius.circular(4.r),
                    ),
                  ),
                ),
              ),

            Center(
              child: AnimatedDefaultTextStyle(
                duration: 200.ms,
                style: TextStyle(
                  fontSize: isSelected ? 15.sp : 14.sp,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurfaceVariant,
                ),
                child: Text(
                  _getCategoryName(category),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getCategoryName(String category) {
    switch (category) {
      case 'all':
        return t.product.categoryAll;
      case 'food':
        return t.product.categoryFood;
      case 'drink':
        return t.product.categoryDrink;
      case 'snack':
        return t.product.categorySnack;
      default:
        return category;
    }
  }
}

class _ProductItem extends ConsumerWidget {
  const _ProductItem({required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cartState = ref.watch(cartProvider);

    // Find item in cart to get quantity
    final cartItem = cartState.cartItems
        .where((item) => item.productId == product.id)
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
            ),
            SizedBox(width: 16.w),
            // 右侧：内容和操作
            Expanded(
              child: SizedBox(
                height: 96.w + 30.h, // 确保高度足够容纳右侧内容
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
                                '${t.product.monthlySales} ${product.monthlySales}',
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
            ),
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
