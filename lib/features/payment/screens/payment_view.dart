import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../order/entities/order_model.dart';
import '../providers/payment_notifier.dart';

/// 支付视图
class PaymentView extends ConsumerWidget {

  const PaymentView({required this.order, super.key});
  final OrderModel order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentNotifierProvider(order));
    final notifier = ref.read(paymentNotifierProvider(order).notifier);

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

                    SizedBox(height: 24.h),

                    // 支付方式
                    _buildPaymentMethod(state),

                    SizedBox(height: 24.h),

                    // 二维码
                    _buildQrCode(state),

                    SizedBox(height: 24.h),

                    // 支付说明
                    _buildPaymentInstructions(state),

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
  Widget _buildPaymentAmount(state) {
    return Container(
      padding: EdgeInsets.all(24.w),
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
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  /// 构建支付方式
  Widget _buildPaymentMethod(state) {
    final paymentMethod = state.order?.paymentMethod;
    IconData icon;
    Color color;
    String name;

    if (paymentMethod == PaymentMethod.wechatPay) {
      icon = Icons.wechat;
      color = Colors.green;
      name = '微信支付';
    } else if (paymentMethod == PaymentMethod.alipay) {
      icon = Icons.account_balance_wallet;
      color = Colors.blue;
      name = '支付宝';
    } else {
      icon = Icons.payment;
      color = Colors.grey;
      name = '未知支付方式';
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32.sp, color: color),
          SizedBox(width: 12.w),
          Text(
            name,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  /// 构建二维码
  Widget _buildQrCode(state) {
    return Container(
      padding: EdgeInsets.all(24.w),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            '请使用手机扫描二维码支付',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 24.h),
          if (state.isLoading)
            SizedBox(
              width: 200.w,
              height: 200.w,
              child: const Center(child: CircularProgressIndicator()),
            )
          else if (state.paymentQrCode.isEmpty)
            Container(
              width: 200.w,
              height: 200.w,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Text(
                  '二维码生成失败',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            )
          else
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: QrImageView(
                data: state.paymentQrCode,
                size: 200.w,
                backgroundColor: Colors.white,
              ),
            ),
          SizedBox(height: 16.h),
          if (state.isPolling)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 16.w,
                  height: 16.w,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                ),
                SizedBox(width: 8.w),
                Text(
                  '等待支付中...',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                ),
              ],
            ),
        ],
      ),
    );
  }

  /// 构建支付说明
  Widget _buildPaymentInstructions(state) {
    final text = state.order?.paymentMethod == PaymentMethod.wechatPay
        ? '1. 打开微信，扫描上方二维码\n2. 确认支付金额\n3. 完成支付'
        : '1. 打开支付宝，扫描上方二维码\n2. 确认支付金额\n3. 完成支付';

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, size: 20.sp, color: Colors.blue),
              SizedBox(width: 8.w),
              Text(
                '支付说明',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  /// 构建倒计时
  Widget _buildCountdown(
    BuildContext context,
    state,
    PaymentNotifier notifier,
  ) {
    final countdown = state.countdown;
    final minutes = countdown ~/ 60;
    final seconds = countdown % 60;
    final countdownText =
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.timer_outlined, size: 20.sp, color: Colors.orange),
              SizedBox(width: 8.w),
              Text(
                '支付剩余时间',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            countdownText,
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: countdown < 60 ? Colors.red : Colors.orange,
            ),
          ),
          SizedBox(height: 16.h),
          OutlinedButton(
            onPressed: () => _handleCancel(context, notifier),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
            ),
            child: const Text('取消支付'),
          ),
        ],
      ),
    );
  }
}
