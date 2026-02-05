import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../entities/order_model.dart';
import '../providers/order_notifier.dart';

/// 订单详情视图
class OrderDetailView extends ConsumerWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final orderFromExtra = extra?['order'] as OrderModel?;
    
    final state = ref.watch(orderNotifierProvider);
    final notifier = ref.read(orderNotifierProvider.notifier);
    
    final order = orderFromExtra ?? state.selectedOrder;

    return Scaffold(
      appBar: AppBar(
        title: const Text('订单详情'),
      ),
      body: Builder(
        builder: (context) {
          if (order == null) {
            // If we have an ID in extra but no order object, we could trigger load
            // But for now just show loading or error
            return const Center(child: CircularProgressIndicator());
          }
          
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 订单状态
                _buildOrderStatus(order, notifier),
                
                SizedBox(height: 8.h),
                
                // 取货码（如果已支付）
                if (order.status == OrderStatus.paid || order.status == OrderStatus.completed)
                  _buildPickupCode(order),
                
                SizedBox(height: 8.h),
                
                // 商品列表
                _buildProductList(order),
                
                SizedBox(height: 8.h),
                
                // 订单信息
                _buildOrderInfo(order),
              ],
            ),
          );
        },
      ),
    );
  }
  
  /// 构建订单状态
  Widget _buildOrderStatus(OrderModel order, OrderNotifier notifier) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      color: _getStatusColor(order.status).withOpacity(0.1),
      child: Column(
        children: [
          Icon(
            _getStatusIcon(order.status),
            size: 48.sp,
            color: _getStatusColor(order.status),
          ),
          SizedBox(height: 12.h),
          Text(
            notifier.getStatusText(order.status),
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: _getStatusColor(order.status),
            ),
          ),
        ],
      ),
    );
  }
  
  /// 获取状态图标
  IconData _getStatusIcon(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Icons.schedule;
      case OrderStatus.paid:
        return Icons.check_circle;
      case OrderStatus.completed:
        return Icons.done_all;
      case OrderStatus.cancelled:
        return Icons.cancel;
      case OrderStatus.refunded:
        return Icons.money_off;
      case OrderStatus.failed:
        return Icons.error;
    }
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.paid:
        return Colors.blue;
      case OrderStatus.completed:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.grey;
      case OrderStatus.refunded:
        return Colors.purple;
      case OrderStatus.failed:
        return Colors.red;
    }
  }
  
  /// 构建取货码
  Widget _buildPickupCode(OrderModel order) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Text(
            '取货码',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            order.pickupCode ?? '----',
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '请在设备上输入取货码取货',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
  
  /// 构建商品列表
  Widget _buildProductList(OrderModel order) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '商品清单',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          
          ...order.items.map((item) => Container(
            margin: EdgeInsets.only(bottom: 12.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 商品图片
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedNetworkImage(
                    imageUrl: item.product.imageUrl,
                    width: 60.w,
                    height: 60.w,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[200],
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[200],
                      child: Icon(Icons.image_not_supported, size: 24.sp),
                    ),
                  ),
                ),
                
                SizedBox(width: 12.w),
                
                // 商品信息
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.product.name,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '¥${item.product.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            'x${item.quantity}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
  
  /// 构建订单信息
  Widget _buildOrderInfo(OrderModel order) {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    
    // Helper to get payment method text since it might not be in the model
    String getPaymentMethodText(String? method) {
      if (method == 'wechat') return '微信支付';
      if (method == 'alipay') return '支付宝';
      return method ?? '未知';
    }
    
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '订单信息',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          
          _buildInfoRow('订单号', order.id),
          _buildInfoRow('创建时间', dateFormat.format(order.createdAt)),
          if (order.paidAt != null)
            _buildInfoRow('支付时间', dateFormat.format(order.paidAt!)),
          if (order.paymentMethod != null)
            _buildInfoRow('支付方式', getPaymentMethodText(order.paymentMethod)),
          
          Divider(height: 24.h),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '订单总额',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '¥${order.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  /// 构建信息行
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
