import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../order/entities/order_model.dart';
import '../providers/payment_notifier.dart';
import '../providers/payment_state.dart';

/// 支付视图
class PaymentView extends ConsumerWidget {
  const PaymentView({required this.order, super.key});
  final OrderModel order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentProvider(order));
    final notifier = ref.read(paymentProvider(order).notifier);

    // 监听支付成功
    ref.listen(paymentProvider(order), (previous, next) {
      if (next.order?.status == OrderStatus.paid) {
        // 确保context还在且当前是支付页
        if (context.mounted) {
          context.go('/orders');
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('支付成功')));
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
          title: const Text('收银台'),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => _handleCancel(context, notifier),
          ),
        ),
        body: state.order == null
            ? const Center(child: Text('订单信息不存在'))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    // 支付金额
                    _buildPaymentAmount(state),

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
                          style: TextStyle(color: Colors.red, fontSize: 14.sp),
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
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: state.isLoading
                              ? SizedBox(
                                  width: 24.w,
                                  height: 24.w,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  '立即支付',
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
                          '正在初始化支付组件...',
                          style: TextStyle(
                            color: Colors.grey[600],
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
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('取消支付'),
        content: const Text('确定要取消支付吗？订单将被取消'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('继续支付'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Colors.white,
            ),
            child: const Text('取消支付'),
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

  /// 构建支付金额
  Widget _buildPaymentAmount(PaymentState state) {
    return Container(
      padding: EdgeInsets.all(24.w),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Text(
            '支付金额',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
          ),
          SizedBox(height: 8.h),
          Text(
            '¥${state.order?.totalAmount.toStringAsFixed(2) ?? '0.00'}',
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  /// 构建倒计时
  Widget _buildCountdown(
    BuildContext context,
    PaymentState state,
    PaymentNotifier notifier,
  ) {
    return Column(
      children: [
        Text(
          '支付剩余时间',
          style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
        ),
        SizedBox(height: 8.h),
        Text(
          notifier.countdownText,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: state.countdown < 60 ? Colors.red : Colors.blue,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}
