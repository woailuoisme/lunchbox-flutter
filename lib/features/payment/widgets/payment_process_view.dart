import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/payment/providers/payment_notifier.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/features/payment/widgets/payment_amount_card.dart';
import 'package:lunchbox/features/payment/widgets/payment_countdown.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 支付处理视图
class PaymentProcessView extends ConsumerWidget {
  const PaymentProcessView({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    PaymentAmountCard(amount: state.order?.totalAmount ?? 0.0),

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
                    PaymentCountdown(
                      countdownText: notifier.countdownText,
                      countdownSeconds: state.countdown,
                    ),
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
}
