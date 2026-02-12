import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/order/providers/order_notifier.dart';
import 'package:lunchbox/features/payment/providers/payment_notifier.dart';
import 'package:lunchbox/features/payment/providers/payment_state.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 支付视图
/// 合并了订单确认和支付功能
class PaymentView extends ConsumerStatefulWidget {
  const PaymentView({super.key, this.order});

  /// 如果传入 order，则直接进入支付流程
  /// 如果为 null，则显示订单确认页面
  final OrderModel? order;

  @override
  ConsumerState<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends ConsumerState<PaymentView> {
  OrderModel? _currentOrder;

  @override
  void initState() {
    super.initState();
    _currentOrder = widget.order;
  }

  @override
  Widget build(BuildContext context) {
    if (_currentOrder == null) {
      return _buildOrderConfirmation(context);
    } else {
      return _buildPayment(context, _currentOrder!);
    }
  }

  // MARK: - Order Confirmation UI

  Widget _buildOrderConfirmation(BuildContext context) {
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
              _buildBottomBar(context, totalAmount, orderState.isLoading),
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
                t.order.paymentStripe,
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

  Widget _buildBottomBar(
    BuildContext context,
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
                          // 订单创建成功，更新状态以显示支付界面
                          setState(() {
                            _currentOrder = order;
                          });
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

  // MARK: - Payment UI

  Widget _buildPayment(BuildContext context, OrderModel order) {
    final state = ref.watch(paymentProvider(order));
    final notifier = ref.read(paymentProvider(order).notifier);
    final theme = Theme.of(context);

    // 监听支付成功
    ref.listen(paymentProvider(order), (previous, next) {
      if (next.order?.status == OrderStatus.paid) {
        // 确保context还在且当前是支付页
        if (context.mounted) {
          context.go('/orders');
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(t.payment.success)));
        }
      }
    });

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          await _handleCancel(context, notifier);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.payment.checkout),
          leading: IconButton(
            icon: const Icon(Symbols.close),
            onPressed: () => _handleCancel(context, notifier),
          ),
        ),
        body: state.order == null
            ? Center(child: Text(t.payment.orderNotFound))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    // 支付金额
                    _buildPaymentAmount(context, state),

                    SizedBox(height: 48.h),

                    // 错误信息
                    if (state.errorMessage != null)
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 8.h,
                        ),
                        child: Text(
                          state.errorMessage!,
                          style: TextStyle(
                            color: theme.colorScheme.error,
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    // 支付按钮
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed:
                              (state.isPaymentSheetReady && !state.isLoading)
                              ? notifier.presentPaymentSheet
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            disabledBackgroundColor: theme.disabledColor,
                            disabledForegroundColor: theme.colorScheme.onSurface
                                .withValues(alpha: 0.38),
                          ),
                          child: state.isLoading
                              ? SizedBox(
                                  width: 24.w,
                                  height: 24.w,
                                  child: CircularProgressIndicator(
                                    color: theme.colorScheme.onPrimary,
                                    strokeWidth: 2.w,
                                  ),
                                )
                              : Text(
                                  t.payment.payNow,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),

                    if (!state.isPaymentSheetReady &&
                        !state.isLoading &&
                        state.errorMessage == null)
                      Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: Text(
                          t.payment.initializing,
                          style: TextStyle(
                            color: theme.textTheme.bodyMedium?.color,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),

                    SizedBox(height: 24.h),

                    // 倒计时
                    _buildCountdown(context, state, notifier),
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> _handleCancel(
    BuildContext context,
    PaymentNotifier notifier,
  ) async {
    final theme = Theme.of(context);
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.payment.cancelTitle),
        content: Text(t.payment.cancelContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(t.payment.continuePay),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.error,
              foregroundColor: theme.colorScheme.onError,
            ),
            child: Text(t.payment.cancelPay),
          ),
        ],
      ),
    );

    if (result ?? false) {
      await notifier.cancelPayment();
      if (context.mounted) {
        context.go('/orders');
      }
    }
  }

  Widget _buildPaymentAmount(BuildContext context, PaymentState state) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(24.w),
      width: double.infinity,
      color: theme.cardColor,
      child: Column(
        children: [
          Text(
            t.payment.amount,
            style: TextStyle(
              fontSize: 14.sp,
              color: theme.textTheme.bodyMedium?.color,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '¥${state.order?.totalAmount.toStringAsFixed(2) ?? '0.00'}',
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.bodyLarge?.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountdown(
    BuildContext context,
    PaymentState state,
    PaymentNotifier notifier,
  ) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          t.payment.remainingTime,
          style: TextStyle(
            fontSize: 14.sp,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          notifier.countdownText,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: state.countdown < 60
                ? theme.colorScheme.error
                : theme.colorScheme.primary,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}
