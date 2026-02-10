import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/widgets/widgets.dart' as widgets;
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/device/device.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/features/product/providers/product_providers.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';

/// 设备详情视图
class DeviceDetailView extends ConsumerWidget {
  const DeviceDetailView({required this.deviceId, super.key});
  final String deviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceAsync = ref.watch(deviceDetailProvider(deviceId));
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(t.device.menu),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.radio_button_checked),
            onPressed: () {},
          ),
        ],
      ),
      body: deviceAsync.when(
        data: (device) => DefaultTabController(
          length: 2,
          child: Column(
            children: [
              _buildDeviceHeader(context, device, theme),
              _buildTabBar(context, theme),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildMainContent(ref, deviceId, theme),
                    _buildDiscountContent(ref, deviceId, theme),
                  ],
                ),
              ),
            ],
          ),
        ),
        loading: () => const widgets.LoadingWidget(),
        error: (error, stack) => widgets.ErrorWidget(message: error.toString()),
      ),
      floatingActionButton: _buildCartButton(context, ref, theme),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  /// 构建设备信息头部
  Widget _buildDeviceHeader(
    BuildContext context,
    DeviceModel device,
    ThemeData theme,
  ) {
    return Container(
      margin: EdgeInsets.all(12.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: BoxDecoration(
                      color: device.isOnline
                          ? const Color(0xFF00B894)
                          : theme.colorScheme.outline,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    device.isOnline ? t.device.online : t.device.offline,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: device.isOnline
                          ? const Color(0xFF00B894)
                          : theme.colorScheme.outline,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 14.sp,
                    color: theme.colorScheme.primary,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    device.distanceText.isEmpty ? '8.7km' : device.distanceText,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  device.name,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              Icon(
                Icons.play_arrow,
                size: 16.sp,
                color: theme.colorScheme.outline,
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            device.address,
            style: TextStyle(
              fontSize: 12.sp,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  /// 构建 TabBar
  Widget _buildTabBar(BuildContext context, ThemeData theme) {
    return Container(
      color: theme.colorScheme.surface,
      child: TabBar(
        tabs: [
          Tab(text: t.device.classicMenu),
          Tab(text: t.device.limitedDiscount),
        ],
        labelColor: theme.colorScheme.primary,
        unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
        indicatorColor: theme.colorScheme.primary,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 16.sp),
      ),
    );
  }

  /// 构建主要内容（左侧分类 + 右侧产品列表）
  Widget _buildMainContent(WidgetRef ref, String deviceId, ThemeData theme) {
    final categoriesAsync = ref.watch(productCategoriesProvider(deviceId));
    final productsAsync = ref.watch(deviceProductsProvider(deviceId));
    final selectedCategory = ref.watch(productCategoryProvider);

    return Row(
      children: [
        // 左侧分类栏
        SizedBox(
          width: 80.w,
          child: categoriesAsync.when(
            data: (categories) => ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category;

                // 计算分类下的商品数量
                int productCount = 0;
                if (productsAsync.hasValue) {
                  final products = productsAsync.value!;
                  if (category == 'all') {
                    productCount = products.length;
                  } else {
                    productCount = products
                        .where((p) => p.category == category)
                        .length;
                  }
                }

                return InkWell(
                  onTap: () => ref
                      .read(productCategoryProvider.notifier)
                      .update(category),
                  child: Container(
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? theme.colorScheme.surface
                          : Colors.transparent,
                      border: isSelected
                          ? Border(
                              left: BorderSide(
                                color: theme.colorScheme.primary,
                                width: 4.w,
                              ),
                            )
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _getCategoryIcon(category),
                          size: 24,
                          color: isSelected
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onSurfaceVariant,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          _getCategoryName(category),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: isSelected
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurface,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        if (productCount > 0)
                          Text(
                            '($productCount)',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: theme.colorScheme.outline,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
            loading: () => const widgets.LoadingWidget(),
            error: (error, stack) => const SizedBox(),
          ),
        ),

        // 右侧产品列表
        Expanded(
          child: Container(
            color: theme.colorScheme.surface,
            child: _buildProductList(ref, deviceId, selectedCategory, theme),
          ),
        ),
      ],
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'all':
        return Icons.grid_view_rounded;
      case 'food':
        return Icons.restaurant;
      case 'drink':
        return Icons.local_drink;
      case 'snack':
        return Icons.cookie;
      default:
        return Icons.fastfood_outlined;
    }
  }

  /// 构建折扣内容
  Widget _buildDiscountContent(
    WidgetRef ref,
    String deviceId,
    ThemeData theme,
  ) {
    return Container(
      color: theme.colorScheme.surface,
      child: _buildProductList(ref, deviceId, 'discount', theme),
    );
  }

  /// 构建产品列表
  Widget _buildProductList(
    WidgetRef ref,
    String deviceId,
    String category,
    ThemeData theme,
  ) {
    final productsAsync = ref.watch(deviceProductsProvider(deviceId));

    return productsAsync.when(
      data: (products) {
        final filteredProducts = category == 'all'
            ? products
            : category == 'discount'
            ? products.where((p) => p.hasDiscount).toList()
            : products.where((p) => p.category == category).toList();

        if (filteredProducts.isEmpty) {
          return const widgets.EmptyWidget();
        }

        return ListView.builder(
          padding: EdgeInsets.all(12.w),
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            return _buildProductItem(
              context,
              ref,
              filteredProducts[index],
              theme,
            );
          },
        );
      },
      loading: () => const widgets.LoadingWidget(),
      error: (error, stack) => widgets.ErrorWidget(message: error.toString()),
    );
  }

  /// 构建单个产品项
  Widget _buildProductItem(
    BuildContext context,
    WidgetRef ref,
    ProductModel product,
    ThemeData theme,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 产品图片
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: SizedBox(
                  width: 100.w,
                  height: 100.w,
                  child: widgets.AppImage(imageUrl: product.imageUrl),
                ),
              ),
              if (!product.hasStock)
                Container(
                  width: 100.w,
                  height: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        t.device.soldOutLabel,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              if (product.hasDiscount)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.error,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        bottomRight: Radius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      '${product.discountPercentage}% OFF',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: theme.colorScheme.onError,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 12.w),
          // 产品详情
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      t.device.monthlySales(count: product.monthlySales),
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      t.device.stock(count: product.stock),
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '¥${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        if (product.hasDiscount)
                          Text(
                            '¥${product.originalPrice!.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: theme.colorScheme.onSurfaceVariant,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                      ],
                    ),
                    if (product.hasStock)
                      IconButton(
                        onPressed: () {
                          ref.read(cartProvider.notifier).addToCart(product);
                        },
                        icon: Icon(
                          Icons.add_circle,
                          color: theme.colorScheme.primary,
                          size: 30,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      )
                    else
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: theme.disabledColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          t.device.soldOutLabel,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.38,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建购物车按钮
  Widget _buildCartButton(
    BuildContext context,
    WidgetRef ref,
    ThemeData theme,
  ) {
    final cartState = ref.watch(cartProvider);
    final totalQuantity = cartState.totalQuantity;

    return Badge(
      label: Text(totalQuantity.toString()),
      isLabelVisible: totalQuantity > 0,
      child: FloatingActionButton(
        onPressed: () => _showCartBottomSheet(context, theme),
        backgroundColor: theme.colorScheme.secondary,
        child: Icon(Icons.shopping_cart, color: theme.colorScheme.onSecondary),
      ),
    );
  }

  /// 显示购物车底部弹窗
  void _showCartBottomSheet(BuildContext context, ThemeData theme) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _CartBottomSheet(theme: theme),
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

/// 购物车底部弹窗组件
class _CartBottomSheet extends ConsumerWidget {
  const _CartBottomSheet({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    final notifier = ref.read(cartProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.device.selfPickupOrder,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.device.selectedProducts,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                TextButton.icon(
                  onPressed: notifier.clearCart,
                  icon: const Icon(Icons.delete_outline, size: 16),
                  label: Text(t.cart.clear),
                  style: TextButton.styleFrom(
                    foregroundColor: theme.colorScheme.outline,
                  ),
                ),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 400.h),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cartState.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartState.cartItems[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: SizedBox(
                          width: 60.w,
                          height: 60.w,
                          child: widgets.AppImage(
                            imageUrl: item.product.imageUrl,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.product.name,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onSurface,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Text(
                                  '¥${item.product.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                                if (item.product.hasDiscount) ...[
                                  SizedBox(width: 4.w),
                                  Text(
                                    '¥${item.product.originalPrice!.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: theme.colorScheme.onSurfaceVariant,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            Text(
                              '${t.device.subtotal}: ¥${item.subtotal.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => notifier.updateQuantity(
                              item,
                              item.quantity - 1,
                            ),
                            icon: const Icon(Icons.remove_circle_outline),
                            color: theme.colorScheme.outline,
                          ),
                          Text(
                            item.quantity.toString(),
                            style: TextStyle(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          IconButton(
                            onPressed: () => notifier.updateQuantity(
                              item,
                              item.quantity + 1,
                            ),
                            icon: const Icon(Icons.add_circle_outline),
                            color: theme.colorScheme.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.w),
            color: theme.colorScheme.surfaceContainer,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${t.cart.total}: ¥${cartState.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        '${t.device.estimatedPrice}: ¥${cartState.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      Text(
                        '${t.device.originalPrice}: ¥${cartState.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: theme.colorScheme.onSurfaceVariant,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.push(AppRoutes.orderConfirm);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 12.h,
                    ),
                  ),
                  child: Text(
                    t.cart.checkout,
                    style: TextStyle(color: theme.colorScheme.onPrimary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
