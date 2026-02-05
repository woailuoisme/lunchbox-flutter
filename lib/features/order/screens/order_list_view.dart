import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/order/providers/order_notifier.dart';
import 'package:lunchbox/routes/app_routes.dart';

/// 订单列表视图
class OrderListView extends ConsumerWidget {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderProvider);
    final notifier = ref.read(orderProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('我的订单')),
      body: Column(
        children: [
          // 状态筛选标签
          _buildStatusTabs(state.selectedStatus, notifier),

          // 订单列表
          Expanded(
            child: Builder(
              builder: (context) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.orders.isEmpty) {
                  return _buildEmptyState();
                }

                return RefreshIndicator(
                  onRefresh: () async => notifier.refreshOrders(),
                  child: ListView.builder(
                    padding: EdgeInsets.all(16.w),
                    itemCount: state.orders.length,
                    itemBuilder: (context, index) {
                      final order = state.orders[index];
                      return _buildOrderCard(context, order, notifier);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 构建状态筛选标签
  Widget _buildStatusTabs(String selectedStatus, OrderNotifier notifier) {
    final statuses = [
      {'value': 'all', 'label': '全部'},
      {'value': 'pending', 'label': '待支付'},
      {'value': 'paid', 'label': '已支付'},
      {'value': 'completed', 'label': '已完成'},
      {'value': 'cancelled', 'label': '已取消'},
    ];

    return Container(
      height: 50.h,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: statuses.length,
        itemBuilder: (context, index) {
          final status = statuses[index];
          final isSelected = selectedStatus == status['value'];

          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: ChoiceChip(
              label: Text(status['label']!),
              selected: isSelected,
              onSelected: (_) => notifier.filterByStatus(status['value']!),
            ),
          );
        },
      ),
    );
  }

  /// 构建空状态
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long_outlined, size: 80.sp, color: Colors.grey),
          SizedBox(height: 16.h),
          Text(
            '暂无订单',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  /// 构建订单卡片
  Widget _buildOrderCard(
    BuildContext context,
    OrderModel order,
    OrderNotifier notifier,
  ) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        onTap: () =>
            context.push(AppRoutes.orderDetail, extra: {'order': order}),
        borderRadius: BorderRadius.circular(8.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 订单头部
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '订单号：${order.id}',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(
                        order.status,
                      ).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(color: _getStatusColor(order.status)),
                    ),
                    child: Text(
                      notifier.getStatusText(order.status),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: _getStatusColor(order.status),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              // 商品信息（显示第一个商品）
              if (order.items.isNotEmpty) ...[
                Row(
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 16.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        order.items.first.product.name +
                            (order.items.length > 1
                                ? ' 等${order.items.length}件商品'
                                : ''),
                        style: TextStyle(fontSize: 14.sp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
              ],

              // 订单金额
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '订单金额',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  ),
                  Text(
                    '¥${order.totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              // 操作按钮
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (order.status == OrderStatus.pending) ...[
                    OutlinedButton(
                      onPressed: () =>
                          _showCancelDialog(context, notifier, order.id),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                      ),
                      child: const Text('取消订单'),
                    ),
                    SizedBox(width: 8.w),
                    ElevatedButton(
                      onPressed: () {
                        // 导航到支付页面
                        context.push(
                          AppRoutes.payment,
                          extra: {'order': order},
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                      ),
                      child: const Text('去支付'),
                    ),
                  ],
                  if (order.status == OrderStatus.paid ||
                      order.status == OrderStatus.completed)
                    TextButton(
                      onPressed: () => context.push(
                        AppRoutes.orderDetail,
                        extra: {'order': order},
                      ),
                      child: const Text('查看详情'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showCancelDialog(
    BuildContext context,
    OrderNotifier notifier,
    String orderId,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认取消'),
        content: const Text('确定要取消这个订单吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Colors.white,
            ),
            child: const Text('确定'),
          ),
        ],
      ),
    );

    if (result ?? false) {
      await notifier.cancelOrder(orderId);
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('订单已取消')));
      }
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
}
