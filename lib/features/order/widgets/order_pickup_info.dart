import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// 订单取货信息组件（二维码/取货码）
class OrderPickupInfo extends StatelessWidget {
  const OrderPickupInfo({required this.order, super.key});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // 二维码背景保持白色
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: theme.dividerColor, width: 1),
            ),
            padding: EdgeInsets.all(12.w),
            child: Column(
              children: [
                QrImageView(
                  data: order.id.toString(),
                  version: QrVersions.auto,
                  size: 180.w,
                  gapless: false,
                  eyeStyle: const QrEyeStyle(
                    eyeShape: QrEyeShape.square,
                    color: Colors.black,
                  ),
                  dataModuleStyle: const QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.square,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  t.order.scanQrHint,
                  style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              t.order.pickupCodeHint,
              style: TextStyle(fontSize: 14.sp, color: theme.colorScheme.error),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
