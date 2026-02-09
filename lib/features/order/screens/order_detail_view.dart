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
            // Refresh order
            ref.read(orderProvider.notifier).loadOrderById(order.id);
          }
          break;
        case 'pay':
          await notifier.payOrder(order.id, 'wechatPay');
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
            // Navigate to new order detail (replace current)
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

    final state = ref.watch(orderProvider);
    // Use the passed order or the one in state (if selected)
    // For now, prioritize the passed order as it's immediate, unless state has newer version of same order
    var order = orderFromExtra ?? state.selectedOrder;

    // If state has the same order and it's loaded, use it (it might be fresher)
    if (state.selectedOrder != null &&
        order != null &&
        state.selectedOrder!.id == order.id) {
      order = state.selectedOrder;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        title: const Text('订单详情'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
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
                      _buildOrderStatus(order),

                      // 取货码/取餐提示（如果已支付）
                      if (order.status == OrderStatus.paid ||
                          order.status == OrderStatus.completed)
                        _buildPickupInfo(order, context),

                      // 门店信息
                      if (order.storeName != null) _buildStoreInfo(order),

                      // 商品列表
                      _buildProductList(order),

                      // 订单信息
                      _buildOrderInfo(order),

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
  Widget _buildOrderStatus(OrderModel order) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFFFF5252), const Color(0xFFFF8888)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          Icon(_getStatusIcon(order.status), size: 40.sp, color: Colors.white),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _getStatusText(order.status),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              if (order.remark != null && order.remark!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text(
                    order.remark!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white.withOpacity(0.9),
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
  Widget _buildPickupInfo(OrderModel order, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.08),
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFEEEEEE), width: 1),
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
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF999999),
                  ),
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
                color: const Color(0xFFF0F9FF),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: const Color(0xFF007AFF).withOpacity(0.1),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 16.sp,
                    color: const Color(0xFF007AFF),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      order.pickupHint!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF007AFF),
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
                color: const Color(0xFFFFF0F0),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                '请凭码取餐，祝您用餐愉快',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFFFF5252),
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }

  /// 构建门店信息
  Widget _buildStoreInfo(OrderModel order) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w).copyWith(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
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
              color: const Color(0xFF333333),
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(Icons.store, size: 20.sp, color: const Color(0xFF666666)),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  order.storeName ?? '',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF333333),
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
                Icon(
                  Icons.location_on,
                  size: 20.sp,
                  color: const Color(0xFF666666),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    order.storeAddress!,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(0xFF666666),
                    ),
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
  Widget _buildProductList(OrderModel order) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
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
                color: const Color(0xFF333333),
              ),
            ),
          ),
          Divider(height: 1, color: const Color(0xFFEEEEEE)),
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
                      errorBuilder: (_, __, ___) => Container(
                        width: 70.w,
                        height: 70.w,
                        color: Colors.grey[300],
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
                            color: const Color(0xFF333333),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '规格：${item.product.specifications}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xFF999999),
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
                                color: const Color(0xFF333333),
                              ),
                            ),
                            Text(
                              'x${item.quantity}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF999999),
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
          Divider(height: 1, color: const Color(0xFFEEEEEE)),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '共${order.items.length}件商品 合计：',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: const Color(0xFF666666),
                  ),
                ),
                Text(
                  '¥${order.totalAmount}',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFF5252),
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
  Widget _buildOrderInfo(OrderModel order) {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
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
              color: const Color(0xFF333333),
            ),
          ),
          SizedBox(height: 16.h),
          _buildInfoRow('订单编号', order.id),
          _buildInfoRow('下单时间', dateFormat.format(order.createdAt)),
          if (order.paidAt != null)
            _buildInfoRow('支付时间', dateFormat.format(order.paidAt!)),
          if (order.paymentMethod != null)
            _buildInfoRow('支付方式', _getPaymentMethodText(order.paymentMethod!)),
          if (order.device != null) _buildInfoRow('取餐设备', order.device!.name),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14.sp, color: const Color(0xFF666666)),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 14.sp, color: const Color(0xFF333333)),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  /// 底部操作栏
  Widget _buildBottomBar(
    BuildContext context,
    WidgetRef ref,
    OrderModel order,
  ) {
    List<Widget> buttons = [];

    if (order.status == OrderStatus.paid) {
      buttons = [
        _buildButton(
          '申请退款',
          textColor: const Color(0xFF666666),
          borderColor: const Color(0xFFDDDDDD),
          onTap: () => _handleAction(order, 'refund', context, ref),
        ),
        SizedBox(width: 12.w),
        _buildButton(
          '联系客服',
          textColor: const Color(0xFF666666),
          borderColor: const Color(0xFFDDDDDD),
          onTap: () => _handleAction(order, 'contact_service', context, ref),
        ),
      ];
    } else if (order.status == OrderStatus.cancelled ||
        order.status == OrderStatus.refunded) {
      buttons = [
        _buildButton(
          '删除订单',
          textColor: const Color(0xFF666666),
          borderColor: const Color(0xFFDDDDDD),
          onTap: () => _handleAction(order, 'delete', context, ref),
        ),
        SizedBox(width: 12.w),
        _buildButton(
          '重新购买',
          textColor: const Color(0xFFFF5252),
          borderColor: const Color(0xFFFF5252),
          onTap: () => _handleAction(order, 'reorder', context, ref),
        ),
      ];
    } else if (order.status == OrderStatus.pending) {
      buttons = [
        _buildButton(
          '取消订单',
          textColor: const Color(0xFF666666),
          borderColor: const Color(0xFFDDDDDD),
          onTap: () => _handleAction(order, 'cancel', context, ref),
        ),
        SizedBox(width: 12.w),
        _buildButton(
          '立即支付',
          textColor: Colors.white,
          borderColor: const Color(0xFFFF5252),
          backgroundColor: const Color(0xFFFF5252),
          onTap: () => _handleAction(order, 'pay', context, ref),
        ),
      ];
    } else if (order.status == OrderStatus.completed) {
      buttons = [
        _buildButton(
          '重新购买',
          textColor: const Color(0xFFFF5252),
          borderColor: const Color(0xFFFF5252),
          onTap: () => _handleAction(order, 'reorder', context, ref),
        ),
      ];
    }

    if (buttons.isEmpty) return const SizedBox();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: buttons),
      ),
    );
  }

  Widget _buildButton(
    String text, {
    required Color textColor,
    required Color borderColor,
    Color? backgroundColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          border: Border.all(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 14.sp, color: textColor),
        ),
      ),
    );
  }

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

  String _getPaymentMethodText(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.wechatPay:
        return '微信支付';
      case PaymentMethod.alipay:
        return '支付宝';
      case PaymentMethod.cash:
        return '现金支付';
    }
  }
}
