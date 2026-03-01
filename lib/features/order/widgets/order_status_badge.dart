import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';

/// 订单状态徽章组件
/// 根据订单状态显示不同的颜色和文字
class OrderStatusBadge extends StatelessWidget {
  const OrderStatusBadge({
    required this.status,
    this.showIcon = false,
    this.fontSize,
    super.key,
  });

  final OrderStatus status;
  final bool showIcon;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = status.color;
    final label = status.label;

    if (!showIcon) {
      return Text(
        label,
        style: TextStyle(
          fontSize: fontSize ?? 14.sp,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(status.icon, size: (fontSize ?? 14.sp) * 1.2, color: color),
        SizedBox(width: 4.w),
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize ?? 14.sp,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
