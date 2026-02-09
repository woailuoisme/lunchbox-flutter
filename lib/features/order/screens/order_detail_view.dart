import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/order/providers/order_notifier.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
          await notifier.cancelOrder(order.id);
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('订单已取消')));
            // 刷新订单状态
            ref.read(orderProvider.notifier).loadOrderById(order.id);
          }
          break;
        case 'pay':
          // 使用 Stripe 支付
          await notifier.payOrder(order.id, 'stripe');
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('支付成功')));
          }
          break;
        case 'reorder':
          final newOrder = await notifier.reorder(order.id);
          if (context.mounted && newOrder != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('已重新下单')));
            // 跳转到新订单详情（替换当前页面）
            context.pushReplacement(
              '${AppRoutes.orderDetail}/${newOrder.id}',
              extra: {'order': newOrder},
            );
          }
          break;
        case 'refund':
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('退款功能暂未开放')));
          }
          break;
        case 'delete':
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('删除功能暂未开放')));
          }
          break;
        case 'contact_service':
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('客服功能暂未开放')));
          }
          break;
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('操作失败: ${e.toString()}')));
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
    var order = orderFromExtra ?? state.selectedOrder;

    // 如果 state 中有相同的订单且已加载，使用 state 中的版本（可能更新）
    if (state.selectedOrder != null &&
        order != null &&
        state.selectedOrder!.id == order.id) {
      order = state.selectedOrder;
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('订单详情'),
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
                      _buildOrderStatus(context, order),

                      // 取货码/取餐提示（如果已支付）
                      if (order.status == OrderStatus.paid ||
                          order.status == OrderStatus.completed)
                        _buildPickupInfo(context, order),

                      // 门店信息
                      if (order.storeName != null)
                        _buildStoreInfo(context, order),

                      // 商品列表
                      _buildProductList(context, order),

                      // 订单信息
                      _buildOrderInfo(context, order),

                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
              // 底部操作栏
              _buildBottomBar(context, ref, order),
            ],
          );
        },
      ),
    );
  }

  /// 构建订单状态
  Widget _buildOrderStatus(BuildContext context, OrderModel order) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withValues(alpha: 0.8),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          Icon(
            _getStatusIcon(order.status),
            size: 40.sp,
            color: theme.colorScheme.onPrimary,
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _getStatusText(order.status),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              if (order.remark != null && order.remark!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text(
                    order.remark!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  /// 构建取货信息（取货码/二维码）
  Widget _buildPickupInfo(BuildContext context, OrderModel order) {
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
                  data: order.id,
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
                  '请对准柜机扫描二维码',
                  style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          if (order.pickupHint != null)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 16.sp,
                    color: theme.colorScheme.primary,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      order.pickupHint!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: theme.colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                '请凭码取餐，祝您用餐愉快',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: theme.colorScheme.error,
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }

  /// 构建门店信息
  Widget _buildStoreInfo(BuildContext context, OrderModel order) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w).copyWith(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '门店信息',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.bodyLarge?.color,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(Icons.store, size: 20.sp, color: theme.hintColor),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  order.storeName ?? '',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: theme.textTheme.bodyLarge?.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (order.storeAddress != null) ...[
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.location_on, size: 20.sp, color: theme.hintColor),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    order.storeAddress!,
                    style: TextStyle(fontSize: 13.sp, color: theme.hintColor),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  /// 构建商品列表
  Widget _buildProductList(BuildContext context, OrderModel order) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Text(
              '商品信息',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
          ),
          Divider(height: 1, color: theme.dividerColor),
          ...order.items.map(
            (item) => Container(
              padding: EdgeInsets.all(16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.network(
                      item.product.imageUrl,
                      width: 70.w,
                      height: 70.w,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => Container(
                        width: 70.w,
                        height: 70.w,
                        color: theme.disabledColor,
                        child: const Icon(Icons.image_not_supported),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.product.name,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: theme.textTheme.bodyLarge?.color,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '规格：${item.product.specifications}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: theme.hintColor,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '¥${item.product.price}',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: theme.textTheme.bodyLarge?.color,
                              ),
                            ),
                            Text(
                              'x${item.quantity}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: theme.hintColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 1, color: theme.dividerColor),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '共${order.items.length}件商品 合计：',
                  style: TextStyle(fontSize: 13.sp, color: theme.hintColor),
                ),
                Text(
                  '¥${order.totalAmount}',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建订单信息
  Widget _buildOrderInfo(BuildContext context, OrderModel order) {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '订单信息',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.bodyLarge?.color,
            ),
          ),
          SizedBox(height: 16.h),
          _buildInfoRow(context, '订单编号', order.id),
          _buildInfoRow(context, '下单时间', dateFormat.format(order.createdAt)),
          if (order.paidAt != null)
            _buildInfoRow(context, '支付时间', dateFormat.format(order.paidAt!)),
          if (order.paymentMethod != null)
            _buildInfoRow(
              context,
              '支付方式',
              _getPaymentMethodText(order.paymentMethod!),
            ),
          if (order.device != null)
            _buildInfoRow(context, '取餐设备', order.device!.name),
        ],
      ),
    );
  }

  /// 构建信息行
  Widget _buildInfoRow(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14.sp, color: theme.hintColor),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14.sp,
                color: theme.textTheme.bodyMedium?.color,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  /// 构建底部操作栏
  Widget _buildBottomBar(
    BuildContext context,
    WidgetRef ref,
    OrderModel order,
  ) {
    final theme = Theme.of(context);
    List<Widget> buttons = [];

    if (order.status == OrderStatus.paid) {
      buttons = [
        _buildButton(
          context,
          '申请退款',
          textColor: theme.hintColor,
          borderColor: theme.dividerColor,
          onTap: () => _handleAction(order, 'refund', context, ref),
        ),
        SizedBox(width: 12.w),
        _buildButton(
          context,
          '联系客服',
          textColor: theme.hintColor,
          borderColor: theme.dividerColor,
          onTap: () => _handleAction(order, 'contact_service', context, ref),
        ),
      ];
    } else if (order.status == OrderStatus.cancelled ||
        order.status == OrderStatus.refunded) {
      buttons = [
        _buildButton(
          context,
          '删除订单',
          textColor: theme.hintColor,
          borderColor: theme.dividerColor,
          onTap: () => _handleAction(order, 'delete', context, ref),
        ),
        SizedBox(width: 12.w),
        _buildButton(
          context,
          '重新购买',
          textColor: theme.colorScheme.primary,
          borderColor: theme.colorScheme.primary,
          onTap: () => _handleAction(order, 'reorder', context, ref),
        ),
      ];
    } else if (order.status == OrderStatus.pending) {
      buttons = [
        _buildButton(
          context,
          '取消订单',
          textColor: theme.hintColor,
          borderColor: theme.dividerColor,
          onTap: () => _handleAction(order, 'cancel', context, ref),
        ),
        SizedBox(width: 12.w),
        _buildButton(
          context,
          '立即支付',
          textColor: theme.colorScheme.onPrimary,
          borderColor: theme.colorScheme.primary,
          backgroundColor: theme.colorScheme.primary,
          onTap: () => _handleAction(order, 'pay', context, ref),
        ),
      ];
    } else if (order.status == OrderStatus.completed) {
      buttons = [
        _buildButton(
          context,
          '重新购买',
          textColor: theme.colorScheme.primary,
          borderColor: theme.colorScheme.primary,
          onTap: () => _handleAction(order, 'reorder', context, ref),
        ),
      ];
    }

    if (buttons.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: buttons),
      ),
    );
  }

  /// 构建操作按钮
  Widget _buildButton(
    BuildContext context,
    String text, {
    required Color textColor,
    required Color borderColor,
    Color? backgroundColor,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: backgroundColor ?? theme.cardColor,
          border: Border.all(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 13.sp, color: textColor),
        ),
      ),
    );
  }

  /// 获取订单状态文本
  String _getStatusText(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return '待支付';
      case OrderStatus.paid:
        return '已支付';
      case OrderStatus.completed:
        return '已完成';
      case OrderStatus.cancelled:
        return '已取消';
      case OrderStatus.refunded:
        return '已退款';
      case OrderStatus.failed:
        return '支付失败';
    }
  }

  /// 获取订单状态图标
  IconData _getStatusIcon(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Icons.schedule;
      case OrderStatus.paid:
        return Icons.check_circle_outline;
      case OrderStatus.completed:
        return Icons.task_alt;
      case OrderStatus.cancelled:
        return Icons.cancel_outlined;
      case OrderStatus.refunded:
        return Icons.remove_circle_outline;
      case OrderStatus.failed:
        return Icons.error_outline;
    }
  }

  /// 获取支付方式文本
  String _getPaymentMethodText(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.wechatPay:
        return '微信支付';
      case PaymentMethod.alipay:
        return '支付宝';
      case PaymentMethod.cash:
        return '现金支付';
      case PaymentMethod.stripe:
        return 'Stripe支付';
    }
  }
}
