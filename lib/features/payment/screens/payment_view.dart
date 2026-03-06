import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/payment/providers/payment_provider.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/features/payment/widgets/confirmation_bottom_bar.dart';
import 'package:lunchbox/features/payment/widgets/order_amount_card.dart';
import 'package:lunchbox/features/payment/widgets/order_product_list.dart';

/// 支付视图
/// 展示选中的商品列表并提供支付功能
class PaymentView extends ConsumerWidget {
  const PaymentView({super.key, required this.items});

  final List<CartItemModel> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 计算选中商品总价
    final totalAmount = items.fold<double>(
      0,
      (sum, item) => sum + item.totalPrice,
    );

    // 监听支付状态
    final paymentState = ref.watch(paymentProvider(totalAmount));
    final paymentNotifier = ref.watch(paymentProvider(totalAmount).notifier);
    final theme = Theme.of(context);

    // 监听支付结果
    ref.listen(paymentProvider(totalAmount), (previous, next) {
      if (next.isPaymentSuccessful) {
        if (context.mounted) {
          context.go('/orders'); // 支付成功跳转订单列表
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(t.payment.success)));
        }
      } else if (next.isPaymentCanceled) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(t.payment.cancelPay)));
        }
      } else if (next.errorMessage != null && !next.isLoading) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.errorMessage!),
              backgroundColor: theme.colorScheme.error,
            ),
          );
        }
      }
    });

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          t.payment.checkout,
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
                      OrderProductList(cartItems: items),

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
                isLoading: paymentState.isLoading,
                onSubmit: () {
                  // 直接调用 Stripe 支付
                  if (paymentState.isPaymentSheetReady) {
                    paymentNotifier.presentPaymentSheet();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('正在准备支付环境，请稍后...')),
                    );
                  }
                },
              ),
            ],
          ),

          if (paymentState.isLoading)
            Container(
              color: Colors.black.withValues(alpha: 0.3),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
