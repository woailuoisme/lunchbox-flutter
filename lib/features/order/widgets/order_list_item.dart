import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/order/widgets/order_status_badge.dart';
import 'package:lunchbox/features/order/widgets/order_product_item.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 订单列表项卡片组件
/// 展示订单号、状态、首个商品预览、合计金额和操作按钮
class OrderListItem extends StatelessWidget {
  const OrderListItem({
    required this.order,
    required this.onTap,
    required this.actionButtons,
    super.key,
  });

  final OrderModel order;
  final VoidCallback onTap;
  final List<Widget> actionButtons;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (order.products.isEmpty) {
      return const SizedBox();
    }

    final firstProduct = order.products.first;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Order ID & Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        '${t.order.orderIdLabel}${order.id.toString().substring(order.id.toString().length > 8 ? order.id.toString().length - 8 : 0)}',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: theme.hintColor,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12.sp,
                        color: theme.hintColor,
                      ),
                    ],
                  ),
                ),
                OrderStatusBadge(status: order.status),
              ],
            ),
            Divider(height: 24.h, color: theme.dividerColor),

            // Content: First product preview
            OrderProductItem(
              product: firstProduct,
              imageSize: 80,
              padding: EdgeInsets.zero,
            ),

            // Summary Info
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  t.order.summary(count: order.products.length),
                  style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
                ),
                Text(
                  '¥${order.totalAmount}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
              ],
            ),

            // Refund indicator if applicable
            if (order.status == OrderStatus.refund)
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    t.order.refund,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: theme.colorScheme.error,
                    ),
                  ),
                ),
              ),

            // Footer: Action Buttons
            if (actionButtons.isNotEmpty) ...[
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actionButtons,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
