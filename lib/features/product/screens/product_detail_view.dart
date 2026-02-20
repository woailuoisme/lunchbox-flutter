import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/features/product/providers/product_notifier.dart';
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
        data: (product) => _buildBody(context, product),
        loading: () => Skeletonizer(
          enabled: true,
          child: _buildBody(context, _dummyProduct),
        ),
        error: (error, stack) =>
            Center(child: Text('${t.common.loadFailed}: $error')),
      ),

      // 底部操作栏
      bottomNavigationBar: productAsync.value != null
          ? _buildBottomBar(context, ref, productAsync.value!).animate().slideY(
              begin: 1,
              end: 0,
              duration: 400.ms,
              curve: Curves.easeOutQuart,
            )
          : null,
    );
  }

  Widget _buildBody(BuildContext context, ProductModel product) {
    final theme = Theme.of(context);
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // 产品图片
        SliverAppBar(
          expandedHeight: 420.h,
          pinned: true,
          stretch: true,
          backgroundColor: theme.scaffoldBackgroundColor,
          foregroundColor: theme.colorScheme.onSurface,
          leading: Container(
            margin: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface.withValues(alpha: 0.8),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
              padding: EdgeInsets.zero,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 12.w),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface.withValues(alpha: 0.8),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Symbols.share, size: 20),
                onPressed: () {},
                padding: EdgeInsets.zero,
              ),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
            ],
            background: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: 'product_image_${product.id}',
                  child: AppImage(
                    imageUrl: product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                // Gradient overlay for better text visibility
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.3),
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.2),
                        ],
                        stops: const [0.0, 0.2, 0.8, 1.0],
                      ),
                    ),
                  ),
                ),
                // Rounded corner at the bottom
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -1,
                  height: 32.h,
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // 产品信息
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBasicInfo(context, product),
                SizedBox(height: 32.h),
                _buildSectionDivider(theme),
                SizedBox(height: 32.h),
                _buildDescription(context, product),
                SizedBox(height: 32.h),
                _buildSectionDivider(theme),
                SizedBox(height: 32.h),
                _buildReviews(context),
                SizedBox(height: 120.h), // 底部留白
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionDivider(ThemeData theme) {
    return Divider(
      color: theme.dividerColor.withValues(alpha: 0.08),
      thickness: 8.h,
    );
  }

  /// 构建基本信息
  Widget _buildBasicInfo(BuildContext context, ProductModel product) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 标签（如果有）
        if (product.isHot || product.isPromotion)
          Row(
            children: [
              if (product.isHot)
                _buildTag(
                  context,
                  t.product.hot,
                  theme.colorScheme.error,
                ).animate().scale(),
              if (product.isPromotion) ...[
                SizedBox(width: 8.w),
                _buildTag(
                  context,
                  t.product.promotion,
                  theme.colorScheme.tertiary,
                ).animate().scale(delay: 100.ms),
              ],
            ],
          ),
        if (product.isHot || product.isPromotion) SizedBox(height: 12.h),

        // 产品名称
        Text(
          product.name,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
            color: theme.colorScheme.onSurface,
            letterSpacing: -0.5,
            height: 1.2,
          ),
        ).animate().fadeIn().slideX(begin: -0.1, end: 0),
        SizedBox(height: 16.h),

        // 价格和销量
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '¥',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.error,
              ),
            ),
            Text(
              product.price.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w900,
                color: theme.colorScheme.error,
                height: 1.0,
              ),
            ),
            if (product.hasDiscount) ...[
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '¥${product.originalPrice!.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: theme.hintColor,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 2.h,
                    ),
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
              ),
            ],
          ],
        ).animate().fadeIn(delay: 100.ms),
        SizedBox(height: 16.h),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Symbols.sell, size: 16.sp, color: theme.colorScheme.primary),
              SizedBox(width: 8.w),
              Text(
                '${t.product.monthlySales} ${product.monthlySales}',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(width: 16.w),
              Container(width: 1, height: 12.h, color: theme.dividerColor),
              SizedBox(width: 16.w),
              Text(
                product.hasStock ? t.product.stockFull : t.device.soldOut,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: product.hasStock
                      ? theme.colorScheme.onSurfaceVariant
                      : theme.colorScheme.error,
                  fontWeight: product.hasStock
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 200.ms),
      ],
    );
  }

  Widget _buildTag(BuildContext context, String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11.sp,
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
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          product.description.isEmpty
              ? '暂无详细介绍' // TODO: add to translations
              : product.description,
          style: TextStyle(
            fontSize: 15.sp,
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.8,
          ),
        ),
      ],
    ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1, end: 0);
  }

  /// 构建评论区域
  Widget _buildReviews(BuildContext context) {
    final theme = Theme.of(context);
    // 模拟评论数据
    final reviews = [
      (
        user: 'Alice',
        rating: 5,
        content: '非常好的商品，味道很棒！',
        date: '2024-03-20',
        avatar: 'A',
      ),
      (
        user: 'Bob',
        rating: 4,
        content: '配送很快，包装也很完整。就是有点凉了。',
        date: '2024-03-19',
        avatar: 'B',
      ),
      (
        user: 'Charlie',
        rating: 5,
        content: '性价比很高，下次还会购买。',
        date: '2024-03-18',
        avatar: 'C',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '商品评价 (128)', // TODO: i18n
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            Row(
              children: [
                Icon(Icons.star, size: 16.sp, color: const Color(0xFFFFC107)),
                SizedBox(width: 4.w),
                Text(
                  '4.8',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12.sp,
                  color: theme.hintColor,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),
        ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: reviews.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            final review = reviews[index];
            return Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16.r,
                            backgroundColor: theme.colorScheme.primary
                                .withValues(alpha: 0.1),
                            child: Text(
                              review.avatar,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  review.user,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),
                                Row(
                                  children: List.generate(
                                    5,
                                    (i) => Icon(
                                      Icons.star,
                                      size: 12.sp,
                                      color: i < review.rating
                                          ? const Color(0xFFFFC107)
                                          : theme.disabledColor.withValues(
                                              alpha: 0.3,
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            review.date,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: theme.hintColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        review.content,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: theme.colorScheme.onSurfaceVariant,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                )
                .animate()
                .fadeIn(delay: (300 + index * 100).ms)
                .slideY(begin: 0.1, end: 0);
          },
        ),
        SizedBox(height: 16.h),
        Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
              '查看全部评价', // TODO: i18n
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
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
              cartState.totalQuantity.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
            ),
            isLabelVisible: cartState.totalQuantity > 0,
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
                onPressed: product.hasStock
                    ? () {
                        ref.read(cartProvider.notifier).addToCart(product);
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
                            duration: const Duration(milliseconds: 1500),
                            backgroundColor: theme.colorScheme.inverseSurface,
                            elevation: 4,
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  elevation: 8,
                  shadowColor: theme.colorScheme.primary.withValues(alpha: 0.4),
                ),
                child: Text(
                  product.hasStock ? t.product.addToCart : t.device.soldOut,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
