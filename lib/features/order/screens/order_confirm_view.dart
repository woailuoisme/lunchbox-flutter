import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/order/providers/order_notifier.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';

/// 订单确认视图
class OrderConfirmView extends ConsumerWidget {
  const OrderConfirmView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 监听购物车状态以获取商品和总价
    final cartState = ref.watch(cartProvider);
    // 监听订单状态以获取支付方式和加载状态
    final orderState = ref.watch(orderProvider);
    final orderNotifier = ref.watch(orderProvider.notifier);
    final theme = Theme.of(context);

    // 如果购物车状态中没有直接的总价，则计算总价
    // CartItemModel 包含 totalPrice 属性
    final totalAmount = cartState.cartItems.fold<double>(
      0,
      (sum, item) => sum + item.totalPrice,
    );

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          t.order.confirmOrder,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: theme.appBarTheme.foregroundColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: theme.appBarTheme.backgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.appBarTheme.foregroundColor,
          ),
          onPressed: () => context.pop(),
        ),
      ),
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
                      _buildProductList(context, cartState.cartItems),

                      SizedBox(height: 8.h),

                      // 支付方式选择
                      _buildPaymentMethod(
                        context,
                        orderState.selectedPaymentMethod,
                        orderNotifier,
                      ),

                      SizedBox(height: 8.h),

                      // 订单金额
                      _buildOrderAmount(context, totalAmount),
                    ],
                  ),
                ),
              ),

              // 底部提交按钮
              _buildBottomBar(context, ref, totalAmount, orderState.isLoading),
            ],
          ),

          if (orderState.isLoading)
            Container(
              color: Colors.black.withValues(alpha: 0.3),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  /// 构建商品列表
  Widget _buildProductList(
    BuildContext context,
    List<CartItemModel> cartItems,
  ) {
    final theme = Theme.of(context);
    return Container(
      color: theme.cardColor,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.order.items,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.bodyLarge?.color,
            ),
          ),
          SizedBox(height: 12.h),

          ...cartItems.map((item) => _buildProductItem(context, item)),
        ],
      ),
    );
  }

  /// 构建商品项
  Widget _buildProductItem(BuildContext context, CartItemModel item) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 商品图片
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: AppImage(
              imageUrl: item.product.imageUrl,
              width: 60.w,
              height: 60.w,
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
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: theme.textTheme.bodyLarge?.color,
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
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'x${item.quantity}',
                      style: TextStyle(fontSize: 14.sp, color: theme.hintColor),
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
  Widget _buildPaymentMethod(
    BuildContext context,
    String selectedMethod,
    OrderNotifier notifier,
  ) {
    final theme = Theme.of(context);
    return Container(
      color: theme.cardColor,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.order.paymentMethod,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.bodyLarge?.color,
            ),
          ),
          SizedBox(height: 12.h),

          Column(
            children: [
              _buildPaymentOption(
                context,
                'stripe',
                'Stripe (Credit Card)',
                Icons.credit_card,
                theme.colorScheme.primary,
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
    BuildContext context,
    String value,
    String label,
    IconData icon,
    Color color,
    String selectedMethod,
    OrderNotifier notifier,
  ) {
    final theme = Theme.of(context);
    final isSelected = selectedMethod == value;

    return InkWell(
      onTap: () => notifier.selectPaymentMethod(value),
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? color : theme.dividerColor,
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
                  color: theme.textTheme.bodyLarge?.color,
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
  Widget _buildOrderAmount(BuildContext context, double totalAmount) {
    final theme = Theme.of(context);
    return Container(
      color: theme.cardColor,
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.order.totalAmount,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: theme.textTheme.bodyMedium?.color,
                ),
              ),
              Text(
                '¥${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: theme.textTheme.bodyMedium?.color,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          Divider(height: 1.h, color: theme.dividerColor),

          SizedBox(height: 8.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.order.actualAmount,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
              Text(
                '¥${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
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
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.1),
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
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                    TextSpan(
                      text: '¥${totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
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
                        // TODO: 获取实际的设备ID
                        const deviceId = 'device_001';
                        final order = await ref
                            .read(orderProvider.notifier)
                            .createOrder(deviceId);

                        if (context.mounted && order != null) {
                          // 跳转到支付页面或订单详情
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
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
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
