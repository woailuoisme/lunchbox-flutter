import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 订单详情头部状态组件
class OrderDetailHeader extends StatelessWidget {
  const OrderDetailHeader({required this.order, super.key});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Define color based on status
    Color baseColor;
    switch (order.status) {
      case OrderStatus.paid:
      case OrderStatus.completed:
      case OrderStatus.used:
        baseColor = const Color(0xFF4CAF50); // Material Green
      case OrderStatus.cancelled:
      case OrderStatus.failed:
      case OrderStatus.refund:
        baseColor = colorScheme.error;
      default:
        baseColor = colorScheme.primary;
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [baseColor, baseColor.withValues(alpha: 0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(order.status.icon, size: 36.sp, color: Colors.white),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  order.status.label,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  _getStatusDesc(),
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getStatusDesc() {
    switch (order.status) {
      case OrderStatus.pending:
        return t.order.statusDesc.pending;
      case OrderStatus.paid:
        return t.order.statusDesc.paid;
      case OrderStatus.completed:
        return t.order.statusDesc.completed;
      case OrderStatus.used:
        return t.order.statusDesc.used;
      case OrderStatus.cancelled:
        return t.order.statusDesc.cancelled;
      case OrderStatus.refund:
        return t.order.statusDesc.refund;
      case OrderStatus.failed:
        return t.order.statusDesc.failed;
    }
  }
}
