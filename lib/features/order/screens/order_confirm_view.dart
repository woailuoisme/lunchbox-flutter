import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
import 'package:lunchbox/features/cart/entities/cart_item_model.dart';
import 'package:lunchbox/features/cart/providers/cart_notifier.dart';
import 'package:lunchbox/features/order/providers/order_notifier.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';

/// 订单确认视图
class OrderConfirmView extends ConsumerWidget {
  const OrderConfirmView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch cart state for items and total
    final cartState = ref.watch(cartProvider);
    // Watch order state for payment method and loading
    final orderState = ref.watch(orderProvider);
    final orderNotifier = ref.watch(orderProvider.notifier);

    // Calculate total if not already in cart state (CartState usually has items, need to sum them up)
    // CartItemModel has totalPrice.
    final totalAmount = cartState.cartItems.fold<double>(
      0,
      (sum, item) => sum + item.totalPrice,
    );

    // We can update order total in notifier if needed, but local calculation is fine for display.
    // If OrderNotifier needs it for creation, it can calculate it or take it from Cart.

    return Scaffold(
      appBar: AppBar(title: Text(t.order.confirmOrder)),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 商品列表
                      _buildProductList(cartState.cartItems),

                      SizedBox(height: 8.h),

                      // 支付方式选择
                      _buildPaymentMethod(
                        orderState.selectedPaymentMethod,
                        orderNotifier,
                      ),

                      SizedBox(height: 8.h),

                      // 订单金额
                      _buildOrderAmount(totalAmount),
                    ],
                  ),
                ),
              ),

              // 底部提交按钮
              _buildBottomBar(context, ref, totalAmount, orderState.isLoading),
            ],
          ),

          if (orderState.isLoading)
            ColoredBox(
              color: Colors.black.withValues(alpha: 0.3),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  /// 构建商品列表
  Widget _buildProductList(List<CartItemModel> cartItems) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.order.items,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.h),

          ...cartItems.map(_buildProductItem),
        ],
      ),
    );
  }

  /// 构建商品项
  Widget _buildProductItem(CartItemModel item) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 商品图片
          AppImage(
            imageUrl: item.product.imageUrl,
            width: 60.w,
            height: 60.w,
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
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '¥${item.product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'x${item.quantity}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
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

  /// 构建支付方式选择
  Widget _buildPaymentMethod(String selectedMethod, OrderNotifier notifier) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.order.paymentMethod,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.h),

          Column(
            children: [
              _buildPaymentOption(
                'stripe',
                'Stripe (Credit Card)',
                Icons.credit_card,
                Colors.indigo,
                selectedMethod,
                notifier,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 构建支付方式选项
  Widget _buildPaymentOption(
    String value,
    String label,
    IconData icon,
    Color color,
    String selectedMethod,
    OrderNotifier notifier,
  ) {
    final isSelected = selectedMethod == value;

    return InkWell(
      onTap: () => notifier.selectPaymentMethod(value),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? color : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            if (isSelected) Icon(Icons.check_circle, color: color, size: 24.sp),
          ],
        ),
      ),
    );
  }

  /// 构建订单金额
  Widget _buildOrderAmount(double totalAmount) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(t.order.totalAmount, style: TextStyle(fontSize: 14.sp)),
              Text(
                '¥${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          Divider(height: 1.h),

          SizedBox(height: 8.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.order.actualAmount,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                '¥${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 构建底部提交按钮
  Widget _buildBottomBar(
    BuildContext context,
    WidgetRef ref,
    double totalAmount,
    bool isLoading,
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
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: t.order.totalLabel,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    TextSpan(
                      text: '¥${totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16.w),
            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () async {
                      try {
                        // Use a fixed device ID or get it from a provider
                        const deviceId = 'device_001';
                        final order = await ref
                            .read(orderProvider.notifier)
                            .createOrder(deviceId);

                        if (context.mounted && order != null) {
                          // Navigate to payment
                          // Using extra to pass the order object
                          await context.push(
                            AppRoutes.payment,
                            extra: {'order': order},
                          );
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                t.order.createFailed(error: e.toString()),
                              ),
                            ),
                          );
                        }
                      }
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r),
                ),
              ),
              child: Text(t.order.submitOrder),
            ),
          ],
        ),
      ),
    );
  }
}
