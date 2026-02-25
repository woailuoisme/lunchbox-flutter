import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
import 'package:lunchbox/features/home/entities/recommend_product_model.dart';
import 'package:lunchbox/features/home/providers/home_provider.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// 首页推荐区域组件
class HomeRecommendSection extends ConsumerWidget {
  const HomeRecommendSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final products = ref.watch(
      homeProvider.select((state) => state.recommendProducts),
    );
    final isLoading = ref.watch(
      homeProvider.select((state) => state.isLoading),
    );

    var displayProducts = products;
    if (displayProducts.isEmpty && isLoading) {
      displayProducts = List.generate(
        3,
        (index) => const RecommendProductModel(
          id: 0,
          name: 'Loading Product Name',
          image: '',
          category: 'Category',
          price: '0.00',
          originalPrice: null,
          tags: [],
        ),
      );
    }

    if (displayProducts.isEmpty) {
      return const SizedBox.shrink();
    }

    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        children: [
          _buildRecommendHeader(colorScheme),
          _buildRecommendCarousel(
            context,
            colorScheme,
            displayProducts,
            isLoading,
          ),
        ],
      ),
    );
  }

  /// 构建推荐标题
  Widget _buildRecommendHeader(ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            t.home.recommendTitle,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 4.h),
          Container(width: 20.w, height: 2.h, color: colorScheme.primary),
        ],
      ),
    );
  }

  /// 构建推荐轮播
  Widget _buildRecommendCarousel(
    BuildContext context,
    ColorScheme colorScheme,
    List<RecommendProductModel> products,
    bool isLoading,
  ) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 240.h,
        viewportFraction: 0.75,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        autoPlay: !isLoading,
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.easeInOutCubic,
      ),
      items: products.asMap().entries.map((entry) {
        return _buildRecommendCard(
          context,
          entry.key,
          entry.value,
          colorScheme,
          isLoading,
        );
      }).toList(),
    );
  }

  /// 构建推荐卡片
  Widget _buildRecommendCard(
    BuildContext context,
    int index,
    RecommendProductModel product,
    ColorScheme colorScheme,
    bool isLoading,
  ) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      openBuilder: (context, _) {
        // 模拟商品详情页跳转
        return Scaffold(
          appBar: AppBar(title: Text(product.name)),
          body: Center(child: Text('商品详情: ${product.name}')),
        );
      },
      closedElevation: 0,
      closedColor: Colors.transparent,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      closedBuilder: (context, openContainer) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  ),
                  child: AppImage(
                    imageUrl: product.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Text(
                          '¥${product.price}',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                        if (product.originalPrice != null) ...[
                          SizedBox(width: 8.w),
                          Text(
                            '¥${product.originalPrice}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              decoration: TextDecoration.lineThrough,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
