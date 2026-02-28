import 'package:flutter/material.dart';
import 'package:lunchbox/features/product/widgets/product_cart_bar.dart';
import 'package:lunchbox/features/product/widgets/product_category_sidebar.dart';
import 'package:lunchbox/features/product/widgets/product_grid_list.dart';

/// 产品页面的核心内容区域，包含侧边栏、网格列表和购物车栏
class ProductContent extends StatelessWidget {
  const ProductContent({required this.deviceId, super.key});

  final String deviceId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 左侧分类栏
            ProductCategorySidebar(deviceId: deviceId),

            // 右侧商品列表
            Expanded(child: ProductGridList(deviceId: deviceId)),
          ],
        ),

        // 底部购物车栏
        const ProductCartBar(),
      ],
    );
  }
}
