import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/payment/providers/payment_provider.dart';
import 'package:lunchbox/features/payment/providers/payment_state.dart';
import 'package:lunchbox/features/payment/entities/payment_request.dart';
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
    final paymentNotifier = ref.read(paymentProvider(totalAmount).notifier);
    final theme = Theme.of(context);

    // 监听支付结果
    ref.listen(paymentProvider(totalAmount), (previous, next) {
      if (next.isLoading) return;

      if (next.value?.isPaymentSuccessful ?? false) {
        if (context.mounted) {
          context.go('/orders'); // 支付成功跳转订单列表
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(t.payment.success)));
        }
      } else if (next.value?.isPaymentCanceled ?? false) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(t.payment.cancelPay)));
        }
      } else if (next.hasError && !next.isLoading) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.error.toString()),
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

                      SizedBox(height: 16.h),

                      // 支付方式选择
                      _buildPaymentMethodSelector(
                        context,
                        ref,
                        paymentState.value?.selectedMethod ??
                            PaymentMethod.stripe,
                        paymentNotifier,
                      ),

                      SizedBox(height: 16.h),

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
                  final cartRepo = ref.read(cartRepositoryProvider);
                  final currentDeviceId = cartRepo.getCurrentDeviceId();

                  final productList = items.map((item) {
                    // 优先从 item 中获取 deviceId，如果没有则尝试从仓库获取当前设备ID
                    final deviceIdStr =
                        (item.deviceId != null && item.deviceId!.isNotEmpty)
                        ? item.deviceId!
                        : currentDeviceId ?? '0';

                    return PaymentProductItem(
                      productId: int.tryParse(item.productId) ?? 0,
                      deviceId: int.tryParse(deviceIdStr) ?? 0,
                      quantity: item.quantity,
                    );
                  }).toList();

                  paymentNotifier.submitPayment(productList: productList);
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

  /// 构建支付方式选择器
  Widget _buildPaymentMethodSelector(
    BuildContext context,
    WidgetRef ref,
    PaymentMethod selectedMethod,
    PaymentNotifier paymentNotifier,
  ) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.payment.paymentMethods,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.titleLarge?.color,
            ),
          ),
          SizedBox(height: 12.h),
          _buildMethodCard(
            context,
            icon: Icons.account_balance_wallet,
            title: '余额支付',
            subtitle: '余额支付，安全便捷',
            isSelected: selectedMethod == PaymentMethod.balance,
            onTap: () =>
                paymentNotifier.selectPaymentMethod(PaymentMethod.balance),
          ),
          SizedBox(height: 12.h),
          _buildMethodCard(
            context,
            icon: Icons.credit_card,
            title: 'Stripe 支付',
            subtitle: '支持信用卡/支付宝/微信',
            isSelected: selectedMethod == PaymentMethod.stripe,
            onTap: () =>
                paymentNotifier.selectPaymentMethod(PaymentMethod.stripe),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final borderColor = isSelected
        ? primaryColor
        : theme.dividerColor.withValues(alpha: 0.5);
    final backgroundColor = isSelected
        ? primaryColor.withValues(alpha: 0.05)
        : theme.cardColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: borderColor, width: isSelected ? 2 : 1),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: isSelected
                    ? primaryColor.withValues(alpha: 0.1)
                    : theme.scaffoldBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected ? primaryColor : Colors.grey,
                size: 24.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: theme.textTheme.bodyMedium?.color?.withValues(
                        alpha: 0.7,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: primaryColor, size: 24.sp)
            else
              Icon(
                Icons.radio_button_unchecked,
                color: Colors.grey.shade400,
                size: 24.sp,
              ),
          ],
        ),
      ),
    );
  }
}
