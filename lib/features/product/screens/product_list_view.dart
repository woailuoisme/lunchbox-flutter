import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/device/device.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/features/product/providers/product_providers.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

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
      appBar: AppBar(title: Text(t.product.title), centerTitle: true),
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
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
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
                  color: device.isOnline
                      ? theme.colorScheme.primaryContainer
                      : theme.colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      device.isOnline ? Symbols.check_circle : Symbols.error,
                      size: 10.sp,
                      color: device.isOnline
                          ? theme.colorScheme.primary
                          : theme.colorScheme.error,
                      fill: 1.0,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      device.isOnline
                          ? t.device.statusOnline
                          : t.device.statusOffline,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: device.isOnline
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
                size: 14.sp,
                color: theme.colorScheme.primary,
              ),
              SizedBox(width: 4.w),
              Text(
                '57.2km',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      device.name,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Symbols.store,
                          size: 14.sp,
                          color: theme.colorScheme.outline,
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            device.location.address ?? '',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: theme.colorScheme.outline,
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
    );
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
              width: 90.w,
              child: Container(
                color: theme.colorScheme.surfaceContainerLow,
                child: categoriesAsync.when(
                  data: (categories) => ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return _CategoryItem(category: category);
                    },
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
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
                              size: 48.sp,
                              color: theme.disabledColor,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              t.order.noOrders,
                              style: TextStyle(color: theme.disabledColor),
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.separated(
                      padding: EdgeInsets.only(
                        left: 12.w,
                        right: 12.w,
                        top: 12.h,
                        bottom: 100.h, // 留出底部购物车栏空间
                      ),
                      itemCount: products.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        return _ProductItem(product: products[index]);
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text(e.toString())),
                ),
              ),
            ),
          ],
        ),

        // 底部购物车栏
        if (!cartState.isEmpty)
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 24.h + MediaQuery.of(context).padding.bottom,
            child: _buildCartBar(context, cartState),
          ),
      ],
    );
  }

  Widget _buildCartBar(BuildContext context, CartState cartState) {
    final theme = Theme.of(context);
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface,
        borderRadius: BorderRadius.circular(28.h),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.push('/cart'),
          borderRadius: BorderRadius.circular(28.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                // 购物车图标和数量
                Badge(
                  label: Text(
                    cartState.totalQuantity.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: theme.colorScheme.primary,
                  child: Icon(
                    Symbols.shopping_cart,
                    color: theme.colorScheme.surface,
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 16.w),
                // 总价
                Text(
                  '¥${cartState.totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: theme.colorScheme.surface,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                // 去结算按钮
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(20.h),
                  ),
                  child: Text(
                    t.cart.checkout,
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
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
        height: 56.h,
        alignment: Alignment.center,
        color: isSelected ? theme.scaffoldBackgroundColor : Colors.transparent,
        child: Stack(
          children: [
            Center(
              child: Text(
                _getCategoryName(category),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            if (isSelected)
              Positioned(
                left: 0,
                top: 16.h,
                bottom: 16.h,
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
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 图片
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: SizedBox(
                width: 88.w,
                height: 88.w,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AppImage(
                      imageUrl: product.imageUrl,
                      width: 88.w,
                      height: 88.w,
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
            SizedBox(width: 12.w),
            // 内容
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${t.product.monthlySales} ${product.monthlySales}',
                    style: TextStyle(fontSize: 11.sp, color: theme.hintColor),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${t.product.stock}: ${product.stock}',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: product.hasStock
                          ? theme.hintColor
                          : theme.colorScheme.error,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '¥',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: theme.colorScheme.error,
                                    ),
                                  ),
                                  TextSpan(
                                    text: product.price.toStringAsFixed(2),
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: theme.colorScheme.error,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (product.hasDiscount)
                              Text(
                                '¥${product.originalPrice!.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: theme.hintColor,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                          ],
                        ),
                      ),
                      _buildActionButtons(
                        context,
                        ref,
                        theme,
                        quantity,
                        cartItem,
                      ),
                    ],
                  ),
                ],
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
        size: 20.sp,
        color: theme.disabledColor,
      );
    }

    if (quantity > 0 && cartItem != null) {
      return Container(
        height: 32.h,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest.withValues(
            alpha: 0.5,
          ),
          borderRadius: BorderRadius.circular(16.h),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                ref.read(cartProvider.notifier).decreaseQuantity(cartItem);
              },
              borderRadius: BorderRadius.circular(16.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Icon(
                  Symbols.remove,
                  size: 18.sp,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            Text(
              quantity.toString(),
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
            InkWell(
              onTap: () {
                ref.read(cartProvider.notifier).increaseQuantity(cartItem);
              },
              borderRadius: BorderRadius.circular(16.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Icon(
                  Symbols.add,
                  size: 18.sp,
                  color: theme.colorScheme.onSurface,
                ),
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
        width: 32.w,
        height: 32.w,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(16.w),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withValues(alpha: 0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          Symbols.add,
          color: theme.colorScheme.onPrimary,
          size: 20.sp,
        ),
      ),
    );
  }
}
