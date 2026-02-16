import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/order/providers/order_notifier.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/features/payment/widgets/confirmation_bottom_bar.dart';
import 'package:lunchbox/features/payment/widgets/order_amount_card.dart';
import 'package:lunchbox/features/payment/widgets/order_product_list.dart';
import 'package:lunchbox/features/payment/widgets/payment_method_selector.dart';

/// 订单确认视图
class OrderConfirmationView extends ConsumerWidget {
  const OrderConfirmationView({super.key, required this.onOrderCreated});

  final ValueChanged<OrderModel> onOrderCreated;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 监听购物车状态以获取商品和总价
    final cartState = ref.watch(cartProvider);
    // 监听订单状态以获取支付方式和加载状态
    final orderState = ref.watch(orderProvider);
    final orderNotifier = ref.watch(orderProvider.notifier);
    final theme = Theme.of(context);

    // 如果购物车状态中没有直接的总价，则计算总价
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
                      OrderProductList(cartItems: cartState.cartItems),

                      SizedBox(height: 8.h),

                      // 支付方式选择
                      PaymentMethodSelector(
                        selectedMethod: orderState.selectedPaymentMethod,
                        onMethodSelected: orderNotifier.selectPaymentMethod,
                      ),

                      SizedBox(height: 8.h),

                      // 订单金额
                      OrderAmountCard(totalAmount: totalAmount),
                    ],
                  ),
                ),
              ),

              // 底部提交按钮
              ConfirmationBottomBar(
                totalAmount: totalAmount,
                isLoading: orderState.isLoading,
                onSubmit: () async {
                  try {
                    // TODO: 获取实际的设备ID
                    const deviceId = 'device_001';
                    final order = await ref
                        .read(orderProvider.notifier)
                        .createOrder(deviceId);

                    if (context.mounted && order != null) {
                      onOrderCreated(order);
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
              ),
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
}
