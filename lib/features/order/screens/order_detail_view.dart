import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/order/entities/order_product_model.dart';
import 'package:lunchbox/features/order/providers/order_provider.dart';
import 'package:lunchbox/features/order/widgets/order_action_button.dart';
import 'package:lunchbox/features/order/widgets/order_detail_bottom_bar.dart';
import 'package:lunchbox/features/order/widgets/order_detail_header.dart';
import 'package:lunchbox/features/order/widgets/order_info_row.dart';
import 'package:lunchbox/features/order/widgets/order_info_section.dart';
import 'package:lunchbox/features/order/widgets/order_pickup_info.dart';
import 'package:lunchbox/features/order/widgets/order_price_summary.dart';
import 'package:lunchbox/features/order/widgets/order_product_item.dart';
import 'package:lunchbox/core/services/toast_service.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';

/// 订单详情视图
class OrderDetailView extends ConsumerWidget {
  const OrderDetailView({super.key});

  /// 处理订单操作
  Future<void> _handleAction(
    OrderModel order,
    String action,
    BuildContext context,
    WidgetRef ref,
  ) async {
    final notifier = ref.read(orderProvider.notifier);
    try {
      switch (action) {
        case 'cancel':
          await notifier.cancelOrder(order.id.toString());
          if (context.mounted) {
            ref
                .read(toastServiceProvider)
                .showSuccess(t.order.orderCancelled, context: context);
            // 刷新订单状态
            await ref
                .read(orderProvider.notifier)
                .loadOrderById(order.id.toString());
          }
          break;
        case 'pay':
          // 使用 Stripe 支付
          await notifier.payOrder(order.id.toString(), 'stripe');
          if (context.mounted) {
            ref
                .read(toastServiceProvider)
                .showSuccess(t.order.paySuccess, context: context);
          }
          break;
        case 'confirm':
          await notifier.confirmOrder(order.id.toString());
          if (context.mounted) {
            ref
                .read(toastServiceProvider)
                .showSuccess(t.order.confirmOrder, context: context);
            // 刷新订单状态
            await ref
                .read(orderProvider.notifier)
                .loadOrderById(order.id.toString());
          }
          break;
        case 'reorder':
          await notifier.reorder(order.id.toString());
          if (context.mounted) {
            ref
                .read(toastServiceProvider)
                .showSuccess(t.order.reorderSuccess, context: context);
            // Navigate to cart
            if (context.mounted) {
              await context.push(AppRoutes.cart);
            }
          }
          break;
        case 'refund':
          if (context.mounted) {
            ref
                .read(toastServiceProvider)
                .showInfo(t.order.refundNotAvailable, context: context);
          }
          break;
        case 'delete':
          if (context.mounted) {
            ref
                .read(toastServiceProvider)
                .showInfo(t.order.deleteNotAvailable, context: context);
          }
          break;
        case 'contact_service':
          if (context.mounted) {
            ref
                .read(toastServiceProvider)
                .showInfo(t.order.serviceNotAvailable, context: context);
          }
          break;
      }
    } catch (e) {
      if (context.mounted) {
        ref
            .read(toastServiceProvider)
            .showError(
              t.order.operationFailed(error: e.toString()),
              context: context,
            );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final orderFromExtra = extra?['order'] as OrderModel?;
    final theme = Theme.of(context);

    final state = ref.watch(orderProvider);
    // 优先使用传入的订单对象，除非 state 中有更新的版本
    var order = orderFromExtra ?? state.value?.selectedOrder;

    // 如果 state 中有相同的订单且已加载，使用 state 中的版本（可能更新）
    if (state.value?.selectedOrder != null &&
        order != null &&
        state.value!.selectedOrder!.id == order.id) {
      order = state.value!.selectedOrder;
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(t.order.detail),
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.appBarTheme.foregroundColor,
          ),
          onPressed: () => context.pop(),
        ),
        titleTextStyle: TextStyle(
          color: theme.appBarTheme.foregroundColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Builder(
        builder: (context) {
          if (order == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 订单状态
                      OrderDetailHeader(order: order),

                      // 取货码/取餐提示（仅在已支付状态下显示）
                      if (order.status == OrderStatus.paid)
                        OrderPickupInfo(order: order),

                      // 商品列表
                      OrderInfoSection(
                        title: t.order.productInfo,
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        children: [
                          ...order.products.map(
                            (OrderProductModel item) =>
                                OrderProductItem(product: item),
                          ),
                          Divider(height: 1, color: theme.dividerColor),
                          OrderPriceSummary(
                            label: t.order.summary(
                              count: order.products.length,
                            ),
                            amount: order.totalAmount.toString(),
                          ),
                        ],
                      ),

                      SizedBox(height: 16.h),

                      // 订单信息
                      OrderInfoSection(
                        title: t.order.info,
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        children: [
                          OrderInfoRow(
                            label: t.order.id,
                            value: order.sn,
                            isCopyable: true,
                          ),
                          OrderInfoRow(
                            label: t.order.createdAt,
                            value: DateFormat(
                              'yyyy-MM-dd HH:mm:ss',
                            ).format(order.createdAtDateTime),
                          ),
                          if (order.payType != null)
                            OrderInfoRow(
                              label: t.order.paymentMethod,
                              value: order.payTypeText,
                            ),
                          if (order.device != null)
                            OrderInfoRow(
                              label: t.order.device,
                              value: order.device!.sn,
                              isCopyable: true,
                            ),
                        ],
                      ),

                      SizedBox(height: 32.h),
                    ].animate(interval: 50.ms).fadeIn(duration: 400.ms),
                  ),
                ),
              ),
              // 底部操作栏
              OrderDetailBottomBar(
                children: _buildActionButtons(context, ref, order),
              ).animate().fadeIn(duration: 300.ms, delay: 300.ms),
            ],
          );
        },
      ),
    );
  }

  /// 构建操作按钮列表
  List<Widget> _buildActionButtons(
    BuildContext context,
    WidgetRef ref,
    OrderModel order,
  ) {
    final theme = Theme.of(context);
    List<Widget> buttons = [];

    if (order.status == OrderStatus.paid) {
      buttons = [
        OrderActionButton(
          text: t.order.applyRefund,
          textColor: theme.hintColor,
          borderColor: theme.dividerColor,
          onTap: () => _handleAction(order, 'refund', context, ref),
        ),
        SizedBox(width: 12.w),
        OrderActionButton(
          text: t.order.contactService,
          textColor: theme.hintColor,
          borderColor: theme.dividerColor,
          onTap: () => _handleAction(order, 'contact_service', context, ref),
        ),
      ];
    } else if (order.status == OrderStatus.cancelled ||
        order.status == OrderStatus.refund ||
        order.status == OrderStatus.completed) {
      buttons = [
        if (order.status != OrderStatus.completed)
          OrderActionButton(
            text: t.order.deleteOrder,
            textColor: theme.hintColor,
            borderColor: theme.dividerColor,
            onTap: () => _handleAction(order, 'delete', context, ref),
          ),
        if (order.status != OrderStatus.completed) SizedBox(width: 12.w),
        OrderActionButton(
          text: t.order.reorder,
          textColor: theme.colorScheme.primary,
          borderColor: theme.colorScheme.primary,
          onTap: () => _handleAction(order, 'reorder', context, ref),
        ),
      ];
    } else if (order.status == OrderStatus.pending) {
      buttons = [
        OrderActionButton(
          text: t.order.cancelOrder,
          textColor: theme.hintColor,
          borderColor: theme.dividerColor,
          onTap: () => _handleAction(order, 'cancel', context, ref),
        ),
        SizedBox(width: 12.w),
        OrderActionButton(
          text: t.order.payNow,
          textColor: theme.colorScheme.primary,
          borderColor: theme.colorScheme.primary,
          onTap: () => _handleAction(order, 'pay', context, ref),
        ),
      ];
    }
    return buttons;
  }
}
