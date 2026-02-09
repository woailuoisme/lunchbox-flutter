import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
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
            ),

            // 产品信息
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBasicInfo(context, product),
                    SizedBox(height: 16.h),
                    _buildDescription(context, product),
                    SizedBox(height: 16.h),
                    if (product.specifications != null)
                      _buildSpecifications(context, product),
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
      bottomNavigationBar: _buildBottomBar(context, ref, productAsync.value),
    );
  }

  /// 构建基本信息
  Widget _buildBasicInfo(BuildContext context, ProductModel product) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 标签
        Row(
          children: [
            if (product.isHot)
              _buildBadge(t.product.hot, theme.colorScheme.error),
            if (product.isPromotion)
              _buildBadge(t.product.promotion, theme.colorScheme.tertiary),
            if (product.hasDiscount)
              _buildBadge(
                t.product.discountOff(
                  percent: product.discountPercentage.toString(),
                ),
                theme.colorScheme.secondary,
              ),
          ],
        ),
        SizedBox(height: 8.h),

        // 产品名称
        Text(
          product.name,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: theme.textTheme.titleLarge?.color,
          ),
        ),
        SizedBox(height: 12.h),

        // 价格
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '¥${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
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
                  decorationColor: theme.hintColor,
                ),
              ),
            ],
          ],
        ),

        // 库存
        SizedBox(height: 8.h),
        Text(
          product.hasStock ? t.product.stockFull : t.product.stockEmpty,
          style: TextStyle(
            fontSize: 14.sp,
            color: product.hasStock
                ? theme.colorScheme.primary
                : theme.colorScheme.error,
          ),
        ),
      ],
    );
  }

  /// 构建徽章
  Widget _buildBadge(String text, Color color) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: color),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 10.sp, color: color),
      ),
    );
  }

  /// 构建描述
  Widget _buildDescription(BuildContext context, ProductModel product) {
    final theme = Theme.of(context);
    if (product.description.isEmpty) {
      return const SizedBox.shrink();
    }

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
        SizedBox(height: 8.h),
        Text(
          product.description,
          style: TextStyle(
            fontSize: 14.sp,
            color: theme.textTheme.bodyMedium?.color,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  /// 构建规格
  Widget _buildSpecifications(BuildContext context, ProductModel product) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.product.specifications,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: theme.textTheme.titleMedium?.color,
          ),
        ),
        SizedBox(height: 8.h),
        // 这里假设 specifications 是 Map 或 String，根据实际模型调整
        // 暂时简单显示
        Text(
          product.specifications.toString(),
          style: TextStyle(
            fontSize: 14.sp,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
      ],
    );
  }

  /// 构建底部操作栏
  Widget _buildBottomBar(
    BuildContext context,
    WidgetRef ref,
    ProductModel? product,
  ) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            // 数量选择（简单版）
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: theme.dividerColor),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Symbols.remove, color: theme.iconTheme.color),
                    onPressed: () {
                      // TODO(User): 减少数量
                    },
                    iconSize: 20.sp,
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Symbols.add, color: theme.iconTheme.color),
                    onPressed: () {
                      // TODO(User): 增加数量
                    },
                    iconSize: 20.sp,
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),

            // 加入购物车按钮
            Expanded(
              child: ElevatedButton(
                onPressed: (product != null && product.hasStock)
                    ? () {
                        // TODO(User): 加入购物车
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(t.product.addedToCart)),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  disabledBackgroundColor: theme.disabledColor,
                  disabledForegroundColor: theme.colorScheme.onSurface
                      .withValues(alpha: 0.38),
                ),
                child: Text(
                  product != null && !product.hasStock
                      ? t.product.stockEmpty
                      : t.product.addToCart,
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
