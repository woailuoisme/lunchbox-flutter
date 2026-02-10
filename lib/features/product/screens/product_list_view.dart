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
    final cartState = ref.watch(cartProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(t.product.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => context.push('/cart'),
            icon: Badge(
              label: Text(cartState.totalQuantity.toString()),
              isLabelVisible: cartState.totalQuantity > 0,
              backgroundColor: theme.colorScheme.error,
              child: const Icon(Symbols.shopping_cart),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Symbols.more_horiz)),
        ],
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
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      color: theme.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8.w,
                height: 8.w,
                decoration: BoxDecoration(
                  color: device.isOnline
                      ? theme.colorScheme.primary
                      : theme.colorScheme.error,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                device.isOnline
                    ? t.device.statusOnline
                    : t.device.statusOffline,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: device.isOnline
                      ? theme.colorScheme.primary
                      : theme.colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              // 距离暂时mock，或者需要从device中获取（如果有）
              Text(
                '57.2km',
                style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      device.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.titleMedium?.color,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      device.location.address ?? '',
                      style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(Symbols.arrow_right, color: theme.hintColor, size: 20.sp),
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
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 左侧分类栏
        SizedBox(
          width: 86.w,
          child: categoriesAsync.when(
            data: (categories) => ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return _CategoryItem(category: category);
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, s) => Center(
              child: Icon(
                Symbols.error,
                size: 24.sp,
                color: theme.colorScheme.error,
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
                    bottom: 80.h, // 留出FAB空间
                  ),
                  itemCount: products.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    return _ProductItem(product: products[index]);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text(e.toString())),
            ),
          ),
        ),
      ],
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
        height: 50.h,
        alignment: Alignment.center,
        color: isSelected
            ? theme.scaffoldBackgroundColor
            : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        child: Row(
          children: [
            if (isSelected)
              Container(
                width: 4.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4.r),
                    bottomRight: Radius.circular(4.r),
                  ),
                ),
              ),
            Expanded(
              child: Text(
                _getCategoryName(category),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? theme.textTheme.bodyMedium?.color
                      : theme.hintColor,
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

    return InkWell(
      onTap: () => context.push('/product/${product.id}'),
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 图片
            ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: SizedBox(
                width: 80.w,
                height: 80.w,
                child: Stack(
                  children: [
                    AppImage(
                      imageUrl: product.imageUrl,
                      width: 80.w,
                      height: 80.w,
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
            SizedBox(width: 10.w),
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
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${t.product.monthlySales} ${product.monthlySales}',
                    style: TextStyle(fontSize: 10.sp, color: theme.hintColor),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${t.product.stock}: ${product.stock}',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: product.hasStock
                          ? theme.hintColor
                          : theme.colorScheme.error,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        '¥${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.error,
                        ),
                      ),
                      if (product.hasDiscount) ...[
                        SizedBox(width: 4.w),
                        Text(
                          '¥${product.originalPrice!.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: theme.hintColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                      const Spacer(),
                      _buildAddButton(context, ref, theme),
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

  Widget _buildAddButton(BuildContext context, WidgetRef ref, ThemeData theme) {
    if (!product.hasStock) {
      return Icon(
        Symbols.remove_shopping_cart,
        size: 24.sp,
        color: theme.disabledColor,
      );
    }

    return InkWell(
      onTap: () {
        ref.read(cartProvider.notifier).addToCart(product);
      },
      child: Container(
        width: 28.w,
        height: 28.w,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(14.w),
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
