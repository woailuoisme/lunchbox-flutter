import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../entities/cart_item_model.dart';
import '../providers/cart_notifier.dart';
import '../providers/cart_state.dart';

/// 购物车视图
class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartNotifierProvider);
    final notifier = ref.read(cartNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('购物车'),
        actions: [
          if (state.cartItems.isNotEmpty)
            TextButton(
              onPressed: () => notifier.clearCart(),
              child: const Text('清空'),
            ),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.cartItems.isEmpty) {
            return _buildEmptyCart(context);
          }

          return Column(
            children: [
              // 购物车列表
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16.w),
                  itemCount: state.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = state.cartItems[index];
                    return _buildCartItem(item, notifier);
                  },
                ),
              ),

              // 底部结算栏
              _buildBottomBar(state),
            ],
          );
        },
      ),
    );
  }

  /// 构建空购物车
  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80.sp,
            color: Colors.grey,
          ),
          SizedBox(height: 16.h),
          Text(
            '购物车是空的',
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () => context.go('/home'),
            child: const Text('去逛逛'),
          ),
        ],
      ),
    );
  }

  /// 构建购物车商品项
  Widget _buildCartItem(CartItemModel item, CartNotifier notifier) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 商品图片
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: item.product.imageUrl,
                width: 80.w,
                height: 80.w,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey[200],
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            
            // 商品信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '¥${item.product.price}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  
                  // 数量控制
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _buildQuantityButton(
                            icon: Icons.remove,
                            onPressed: () => notifier.decreaseQuantity(item),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text(
                              '${item.quantity}',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                          _buildQuantityButton(
                            icon: Icons.add,
                            onPressed: () => notifier.increaseQuantity(item),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.grey),
                        onPressed: () => notifier.removeItem(item.id),
                      ),
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
  
  Widget _buildQuantityButton({required IconData icon, required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Icon(icon, size: 16.sp),
      ),
    );
  }

  /// 构建底部结算栏
  Widget _buildBottomBar(CartState state) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '总计:',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
              ),
              Text(
                '¥${state.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: state.isEmpty ? null : () {
              // 结算逻辑 - 导航到订单确认页
              // context.push('/order/confirm');
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
            ),
            child: Text('去结算(${state.totalQuantity})'),
          ),
        ],
      ),
    );
  }
}
