import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../entities/product_model.dart';
import '../providers/product_providers.dart';

/// 产品详情视图
class ProductDetailView extends ConsumerWidget {
  const ProductDetailView({required this.productId, super.key});
  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productDetailProvider(productId));

    return Scaffold(
      body: productAsync.when(
        data: (product) => CustomScrollView(
          slivers: [
            // 产品图片
            SliverAppBar(
              expandedHeight: 300.h,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[200],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[200],
                    child: Icon(Icons.image_not_supported, size: 64.sp),
                  ),
                ),
              ),
            ),

            // 产品信息
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBasicInfo(product),
                    SizedBox(height: 16.h),
                    _buildDescription(product),
                    SizedBox(height: 16.h),
                    if (product.specifications != null)
                      _buildSpecifications(product),
                  ],
                ),
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('加载失败: $error')),
      ),

      // 底部操作栏
      bottomNavigationBar: _buildBottomBar(context, ref, productAsync.value),
    );
  }

  /// 构建基本信息
  Widget _buildBasicInfo(ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 标签
        Row(
          children: [
            if (product.isHot) _buildBadge('热销', Colors.red),
            if (product.isPromotion) _buildBadge('促销', Colors.orange),
            if (product.hasDiscount)
              _buildBadge('${product.discountPercentage}% OFF', Colors.green),
          ],
        ),
        SizedBox(height: 8.h),

        // 产品名称
        Text(
          product.name,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
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
                color: Colors.red,
              ),
            ),
            if (product.hasDiscount) ...[
              SizedBox(width: 8.w),
              Text(
                '¥${product.originalPrice!.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ],
        ),

        // 库存
        SizedBox(height: 8.h),
        Text(
          product.hasStock ? '库存充足' : '暂时缺货',
          style: TextStyle(
            fontSize: 14.sp,
            color: product.hasStock ? Colors.green : Colors.red,
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
  Widget _buildDescription(ProductModel product) {
    if (product.description.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '商品详情',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        Text(
          product.description,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[800],
            height: 1.5,
          ),
        ),
      ],
    );
  }

  /// 构建规格
  Widget _buildSpecifications(ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '规格参数',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        // 这里假设 specifications 是 Map 或 String，根据实际模型调整
        // 暂时简单显示
        Text(
          product.specifications.toString(),
          style: TextStyle(fontSize: 14.sp, color: Colors.grey[800]),
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
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
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
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      // TODO(User): 减少数量
                    },
                    iconSize: 20.sp,
                  ),
                  Text('1', style: TextStyle(fontSize: 16.sp)),
                  IconButton(
                    icon: const Icon(Icons.add),
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
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(const SnackBar(content: Text('已加入购物车')));
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  product != null && !product.hasStock ? '暂时缺货' : '加入购物车',
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
