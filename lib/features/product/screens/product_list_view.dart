import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:lunchbox/features/cart/providers/cart_notifier.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/features/product/providers/product_providers.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 产品列表视图
class ProductListView extends ConsumerWidget {
  const ProductListView({required this.deviceId, super.key});
  final String deviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(filteredProductsProvider(deviceId));
    final availableOnly = ref.watch(productFilterAvailableProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.product.title),
        actions: [
          // 排序按钮
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort),
            onSelected: (value) {
              ref.read(productSortProvider.notifier).update(value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'default',
                child: Text(t.product.sortDefault),
              ),
              PopupMenuItem(
                value: 'price_asc',
                child: Text(t.product.sortPriceAsc),
              ),
              PopupMenuItem(
                value: 'price_desc',
                child: Text(t.product.sortPriceDesc),
              ),
              PopupMenuItem(value: 'name', child: Text(t.product.sortName)),
            ],
          ),
          // 过滤按钮
          IconButton(
            icon: Icon(
              availableOnly ? Icons.filter_alt : Icons.filter_alt_outlined,
            ),
            onPressed: () {
              ref.read(productFilterAvailableProvider.notifier).toggle();
            },
            tooltip: t.product.filterOnlyAvailable,
          ),
          // 购物车按钮
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              context.push('/cart'); // 假设有这个路由，或者使用 goRouter 的路径
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 类别选择器
          _buildCategorySelector(ref, deviceId),

          // 产品列表
          Expanded(
            child: productsAsync.when(
              data: (products) {
                if (products.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 64.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          t.order.noOrders,
                          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(rawProductsProvider(deviceId));
                  },
                  child: GridView.builder(
                    padding: EdgeInsets.all(16.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return _buildProductCard(context, ref, product);
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) =>
                  Center(child: Text('${t.common.loadFailed}: $error')),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建类别选择器
  Widget _buildCategorySelector(WidgetRef ref, String deviceId) {
    final categoriesAsync = ref.watch(productCategoriesProvider(deviceId));
    final selectedCategory = ref.watch(productCategoryProvider);

    return categoriesAsync.when(
      data: (categories) {
        if (categories.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = selectedCategory == category;

              return Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: ChoiceChip(
                  label: Text(_getCategoryName(category)),
                  selected: isSelected,
                  onSelected: (_) {
                    ref.read(productCategoryProvider.notifier).update(category);
                  },
                ),
              );
            },
          ),
        );
      },
      loading: () => const SizedBox(
        height: 50,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, _) => const SizedBox.shrink(),
    );
  }

  /// 获取类别显示名称
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

  /// 构建产品卡片
  Widget _buildProductCard(
    BuildContext context,
    WidgetRef ref,
    ProductModel product,
  ) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          context.push('/product/${product.id}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 产品图片
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[200],
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[200],
                      child: Icon(Icons.image_not_supported, size: 48.sp),
                    ),
                  ),
                ),

                // 标签
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (product.isHot) _buildBadge(t.product.hot, Colors.red),
                      if (product.isPromotion)
                        _buildBadge(t.product.promotion, Colors.orange),
                      if (!product.hasStock)
                        _buildBadge(t.device.soldOut, Colors.grey),
                    ],
                  ),
                ),
              ],
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 产品名称
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),

                    // 价格
                    Row(
                      children: [
                        Text(
                          '¥${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        if (product.hasDiscount) ...[
                          SizedBox(width: 4.w),
                          Text(
                            '¥${product.originalPrice!.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ],
                    ),
                    SizedBox(height: 4.h),

                    // 添加到购物车按钮
                    SizedBox(
                      width: double.infinity,
                      height: 32.h,
                      child: ElevatedButton(
                        onPressed: product.hasStock
                            ? () {
                                ref
                                    .read(cartProvider.notifier)
                                    .addToCart(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${t.product.addedToCart}: ${product.name}',
                                    ),
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          product.hasStock
                              ? t.product.addToCart
                              : t.device.soldOut,
                          style: TextStyle(fontSize: 12.sp),
                        ),
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

  /// 构建标签
  Widget _buildBadge(String text, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 4.h),
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
}
