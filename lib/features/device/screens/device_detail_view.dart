import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/values/app_colors.dart';
import 'package:lunchbox/core/widgets/widgets.dart' as widgets;
import 'package:lunchbox/features/device/providers/cart_notifier.dart';
import 'package:lunchbox/features/device/entities/device_model.dart';
import 'package:lunchbox/features/device/providers/device_providers.dart';
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

    return Scaffold(
      backgroundColor: AppColors.background,
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
              _buildDeviceHeader(context, device),
              _buildTabBar(context),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildMainContent(ref, deviceId),
                    _buildDiscountContent(ref, deviceId),
                  ],
                ),
              ),
            ],
          ),
        ),
        loading: () => const widgets.LoadingWidget(),
        error: (error, stack) => widgets.ErrorWidget(message: error.toString()),
      ),
      floatingActionButton: _buildCartButton(context, ref),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  /// 构建设备信息头部
  Widget _buildDeviceHeader(BuildContext context, DeviceModel device) {
    return Container(
      margin: EdgeInsets.all(12.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
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
                    decoration: const BoxDecoration(
                      color: AppColors.deviceOnline,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    device.isOnline ? t.device.online : t.device.offline,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.deviceOnline,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 14.sp,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    device.distanceText.isEmpty ? '8.7km' : device.distanceText,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textSecondary,
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
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Icon(Icons.play_arrow, size: 16.sp, color: AppColors.textHint),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            device.address,
            style: TextStyle(fontSize: 12.sp, color: AppColors.textHint),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  /// 构建 TabBar
  Widget _buildTabBar(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        tabs: [
          Tab(text: t.device.classicMenu),
          Tab(text: t.device.limitedDiscount),
        ],
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.textSecondary,
        indicatorColor: AppColors.primary,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 16.sp),
      ),
    );
  }

  /// 构建主要内容（左侧分类 + 右侧产品列表）
  Widget _buildMainContent(WidgetRef ref, String deviceId) {
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
                      color: isSelected ? Colors.white : Colors.transparent,
                      border: isSelected
                          ? Border(
                              left: BorderSide(
                                color: AppColors.primary,
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
                              ? AppColors.primary
                              : AppColors.textSecondary,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          _getCategoryName(category),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.textPrimary,
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
                              color: AppColors.textHint,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => const SizedBox(),
          ),
        ),

        // 右侧产品列表
        Expanded(
          child: Container(
            color: Colors.white,
            child: _buildProductList(ref, deviceId, selectedCategory),
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
  Widget _buildDiscountContent(WidgetRef ref, String deviceId) {
    return Container(
      color: Colors.white,
      child: _buildProductList(ref, deviceId, 'discount'),
    );
  }

  /// 构建产品列表
  Widget _buildProductList(WidgetRef ref, String deviceId, String category) {
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
            return _buildProductItem(context, ref, filteredProducts[index]);
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
                      color: AppColors.error,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        bottomRight: Radius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      '${product.discountPercentage}% OFF',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
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
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 12.sp, color: AppColors.textHint),
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
                        color: AppColors.textHint,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      t.device.stock(count: product.stock),
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.textHint,
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
                            color: AppColors.primary,
                          ),
                        ),
                        if (product.hasDiscount)
                          Text(
                            '¥${product.originalPrice!.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.textHint,
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
                        icon: const Icon(
                          Icons.add_circle,
                          color: AppColors.primary,
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
                          color: AppColors.textDisabled,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          t.device.soldOutLabel,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
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
  Widget _buildCartButton(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    final totalQuantity = cartState.totalQuantity;

    return Badge(
      label: Text(totalQuantity.toString()),
      isLabelVisible: totalQuantity > 0,
      child: FloatingActionButton(
        onPressed: () => _showCartBottomSheet(context),
        backgroundColor: AppColors.secondary,
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
    );
  }

  /// 显示购物车底部弹窗
  void _showCartBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const _CartBottomSheet(),
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
  const _CartBottomSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    final notifier = ref.read(cartProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
                    color: AppColors.textSecondary,
                  ),
                ),
                TextButton.icon(
                  onPressed: notifier.clearCart,
                  icon: const Icon(Icons.delete_outline, size: 16),
                  label: Text(t.cart.clear),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.textHint,
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
                                    color: AppColors.primary,
                                  ),
                                ),
                                if (item.product.hasDiscount) ...[
                                  SizedBox(width: 4.w),
                                  Text(
                                    '¥${item.product.originalPrice!.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.textHint,
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
                                color: AppColors.primary,
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
                            color: AppColors.textHint,
                          ),
                          Text(item.quantity.toString()),
                          IconButton(
                            onPressed: () => notifier.updateQuantity(
                              item,
                              item.quantity + 1,
                            ),
                            icon: const Icon(Icons.add_circle_outline),
                            color: AppColors.primary,
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
            color: const Color(0xFFF1F8E9),
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
                        ),
                      ),
                      Text(
                        '${t.device.estimatedPrice}: ¥${cartState.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        '${t.device.originalPrice}: ¥${cartState.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.textHint,
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
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 12.h,
                    ),
                  ),
                  child: Text(
                    t.cart.checkout,
                    style: const TextStyle(color: Colors.white),
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
