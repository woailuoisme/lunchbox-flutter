import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/product/entities/product_detail_model.dart';
import 'package:lunchbox/features/product/providers/product_provider.dart';
import 'package:lunchbox/features/product/widgets/product_detail_app_bar.dart';
import 'package:lunchbox/features/product/widgets/product_detail_basic_info.dart';
import 'package:lunchbox/features/product/widgets/product_detail_bottom_bar.dart';
import 'package:lunchbox/features/product/widgets/product_detail_description.dart';
import 'package:lunchbox/features/product/widgets/product_detail_reviews.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// 产品详情视图
class ProductDetailView extends ConsumerWidget {
  const ProductDetailView({required this.productId, super.key});
  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productDetailProvider(productId));
    final theme = Theme.of(context);

    // 调试日志：检查产品详情状态
    debugPrint(
      'ProductDetailView: productId=$productId, status=${productAsync.runtimeType}, hasValue=${productAsync.hasValue}, isLoading=${productAsync.isLoading}',
    );

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: productAsync.when(
        data: (product) {
          if (product == null) {
            return Center(child: Text(t.common.noData));
          }
          debugPrint(
            'ProductDetailView: Data received, productId=${product.id}',
          );
          return _buildBody(context, product);
        },
        loading: () {
          debugPrint('ProductDetailView: Loading...');
          return Skeletonizer(
            enabled: true,
            child: _buildBody(
              context,
              const ProductDetailModel(
                id: 0,
                name: 'Loading Product Name',
                description:
                    'This is a loading description for the product detail view to show skeleton.',
                imageUrl: '',
                content: '',
                price: 99.99,
                type: 'food',
                isEnabled: true,
                comments: [],
                media: [],
              ),
            ),
          );
        },
        error: (error, stack) {
          debugPrint('ProductDetailView: Error=$error');
          return Center(child: Text('${t.common.loadFailed}: $error'));
        },
      ),

      // 底部操作栏
      bottomNavigationBar: productAsync.value != null
          ? ProductDetailBottomBar(
              product: productAsync.value!,
            ).animate().slideY(
              begin: 1,
              end: 0,
              duration: 400.ms,
              curve: Curves.easeOutQuart,
            )
          : null,
    );
  }

  Widget _buildBody(BuildContext context, ProductDetailModel product) {
    final theme = Theme.of(context);
    final expandedHeight = MediaQuery.of(context).size.height / 4;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // 产品图片
        ProductDetailAppBar(product: product, expandedHeight: expandedHeight),

        // 产品信息
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailBasicInfo(product: product),
                SizedBox(height: 24.h),
                _buildSectionDivider(theme),
                SizedBox(height: 24.h),
                ProductDetailDescription(product: product),
                SizedBox(height: 24.h),
                _buildSectionDivider(theme),
                SizedBox(height: 24.h),
                ProductDetailReviews(product: product),
                SizedBox(height: 120.h),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionDivider(ThemeData theme) {
    return Divider(
      color: theme.dividerColor.withValues(alpha: 0.05),
      thickness: 6.h,
    );
  }
}
