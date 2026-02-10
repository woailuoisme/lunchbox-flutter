import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
import 'package:lunchbox/features/cart/entities/cart_item_model.dart';
import 'package:lunchbox/features/cart/providers/cart_notifier.dart';
import 'package:lunchbox/features/cart/providers/cart_state.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 购物车视图
class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProvider);
    final notifier = ref.read(cartProvider.notifier);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.cart.title),
        actions: [
          if (state.cartItems.isNotEmpty)
            TextButton(
              onPressed: notifier.clearCart,
              child: Text(t.cart.clear),
            ),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.cartItems.isEmpty) {
            return _buildEmptyCart(context, theme);
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
                    return _buildCartItem(item, notifier, theme);
                  },
                ),
              ),

              // 底部结算栏
              _buildBottomBar(state, theme),
            ],
          );
        },
      ),
    );
  }

  /// 构建空购物车
  Widget _buildEmptyCart(BuildContext context, ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80.sp,
            color: theme.colorScheme.outline,
          ),
          SizedBox(height: 16.h),
          Text(
            t.cart.empty,
            style: TextStyle(
              fontSize: 18.sp,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () => context.go('/home'),
            child: Text(t.cart.goShopping),
          ),
        ],
      ),
    );
  }

  /// 构建购物车商品项
  Widget _buildCartItem(
    CartItemModel item,
    CartNotifier notifier,
    ThemeData theme,
  ) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 商品图片
            AppImage(
              imageUrl: item.product.imageUrl,
              width: 80.w,
              height: 80.w,
              radius: 8.r,
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
                      color: theme.colorScheme.onSurface,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '¥${item.product.price}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: theme.colorScheme.primary,
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
                            theme: theme,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text(
                              '${item.quantity}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                          ),
                          _buildQuantityButton(
                            icon: Icons.add,
                            onPressed: () => notifier.increaseQuantity(item),
                            theme: theme,
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          color: theme.colorScheme.outline,
                        ),
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

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onPressed,
    required ThemeData theme,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.outlineVariant),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Icon(icon, size: 16.sp, color: theme.colorScheme.onSurface),
      ),
    );
  }

  /// 构建底部结算栏
  Widget _buildBottomBar(CartState state, ThemeData theme) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
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
                t.cart.total,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                '¥${state.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: state.isEmpty
                ? null
                : () {
                    // 结算逻辑 - 导航到订单确认页
                    // context.push('/order/confirm');
                  },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
            ),
            child: Text('${t.cart.checkout}(${state.totalQuantity})'),
          ),
        ],
      ),
    );
  }
}
