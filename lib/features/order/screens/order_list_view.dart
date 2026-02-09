import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/order/providers/order_notifier.dart';
import 'package:lunchbox/routes/app_routes.dart';

/// 订单列表视图 (食品/商城)
class OrderListView extends ConsumerStatefulWidget {
  const OrderListView({super.key});

  @override
  ConsumerState<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends ConsumerState<OrderListView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<PagingController<int, OrderModel>> _pagingControllers = [];

  // 状态过滤对应的值
  final List<String> _filterValues = [
    'all',
    'pending',
    'paid',
    'completed', // 已完成/已使用
    'cancelled', // 退款/取消
  ];

  final List<String> _filterTitles = ['全部订单', '待支付', '已支付', '已完成', '退款/取消'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _filterValues.length, vsync: this);

    // 为每个 Tab 初始化一个 PagingController
    for (var i = 0; i < _filterValues.length; i++) {
      final controller = PagingController<int, OrderModel>(
        getNextPageKey: (state) {
          if (state.pages == null || state.pages!.isEmpty) {
            return 1;
          }
          final lastPageItemCount = state.pages!.last.length;
          if (lastPageItemCount < 10) {
            return null;
          }
          // Assuming page key increments by 1
          return (state.keys?.last ?? 0) + 1;
        },
        fetchPage: (pageKey) => _fetchPage(pageKey, i),
      );
      _pagingControllers.add(controller);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    for (var controller in _pagingControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<List<OrderModel>> _fetchPage(int pageKey, int filterIndex) async {
    final status = _filterValues[filterIndex];
    // 这里的 pageSize 可以根据需要调整
    const pageSize = 10;
    return await ref
        .read(orderProvider.notifier)
        .fetchOrdersPage(page: pageKey, pageSize: pageSize, status: status);
  }

  // 刷新当前选中的 Tab
  void _refreshCurrentTab() {
    _pagingControllers[_tabController.index].refresh();
  }

  Future<void> _handleAction(
    OrderModel order,
    String action,
    BuildContext context,
  ) async {
    final notifier = ref.read(orderProvider.notifier);
    try {
      switch (action) {
        case 'cancel':
          await notifier.cancelOrder(order.id);
          if (mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('订单已取消')));
            _refreshCurrentTab();
          }
          break;
        case 'pay':
          // For demo, we just simulate pay with WeChat
          await notifier.payOrder(order.id, 'wechatPay');
          if (mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('支付成功')));
            _refreshCurrentTab();
          }
          break;
        case 'reorder':
          final newOrder = await notifier.reorder(order.id);
          if (mounted && newOrder != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('已重新下单')));
            _refreshCurrentTab();
            // Navigate to detail of new order
            context.push(
              '${AppRoutes.orderDetail}/${newOrder.id}',
              extra: {'order': newOrder},
            );
          }
          break;
        case 'view_code':
          context.push(
            '${AppRoutes.orderDetail}/${order.id}',
            extra: {'order': order},
          );
          break;
        case 'refund':
          if (mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('退款功能暂未开放')));
          }
          break;
        case 'delete':
          // Not implemented in backend yet
          if (mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('删除功能暂未开放')));
          }
          break;
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('操作失败: ${e.toString()}')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Note: orderState and filteredOrders logic removed as PagingController handles fetching

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '食品订单',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              padding: EdgeInsets.zero,
              labelColor: const Color(0xFF333333),
              unselectedLabelColor: const Color(0xFF999999),
              indicatorColor: const Color(0xFFFF5252),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 0,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 3.h,
                  color: const Color(0xFFFF5252),
                ),
                insets: EdgeInsets.symmetric(horizontal: 14.w),
                borderRadius: BorderRadius.circular(2.r),
              ),
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: 12.w),
              splashFactory: NoSplash.splashFactory,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              dividerColor: Colors.transparent,
              tabs: _filterTitles.map((title) => Tab(text: title)).toList(),
              onTap: (index) {
                // 可选：点击时的额外逻辑，TabBarView 会自动处理切换
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: List.generate(
                _filterValues.length,
                (index) =>
                    _buildOrderList(controller: _pagingControllers[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderList({PagingController<int, OrderModel>? controller}) {
    if (controller == null) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: () async {
        controller.refresh();
      },
      child: PagingListener(
        controller: controller,
        builder: (context, state, fetchNextPage) {
          return PagedListView<int, OrderModel>(
            state: state,
            fetchNextPage: fetchNextPage,
            padding: EdgeInsets.all(16.w),
            builderDelegate: PagedChildBuilderDelegate<OrderModel>(
              itemBuilder: (context, item, index) {
                return _buildOrderCard(item);
              },
              firstPageErrorIndicatorBuilder: (context) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('加载失败: ${controller.error}'),
                    ElevatedButton(
                      onPressed: () => controller.refresh(),
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
              noItemsFoundIndicatorBuilder: (context) => _buildEmptyState(),
              firstPageProgressIndicatorBuilder: (context) =>
                  const Center(child: CircularProgressIndicator()),
              newPageProgressIndicatorBuilder: (context) => const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long, size: 64.sp, color: const Color(0xFFDDDDDD)),
          SizedBox(height: 16.h),
          Text(
            '暂无订单',
            style: TextStyle(color: const Color(0xFF999999), fontSize: 14.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(OrderModel order) {
    if (order.items.isEmpty) return const SizedBox();

    final item = order.items.first;
    final statusText = _getStatusText(order.status);
    final statusColor = _getStatusColor(order.status);

    return GestureDetector(
      onTap: () {
        context.push(
          '${AppRoutes.orderDetail}/${order.id}',
          extra: {'order': order},
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      if (order.storeName != null) ...[
                        Icon(
                          Icons.store,
                          size: 16.sp,
                          color: const Color(0xFF666666),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            order.storeName!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF333333),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 8.w),
                      ],
                      if (order.storeName == null)
                        Text(
                          '订单号：${order.id.substring(order.id.length > 8 ? order.id.length - 8 : 0)}',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: const Color(0xFF999999),
                          ),
                        ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12.sp,
                        color: const Color(0xFF999999),
                      ),
                    ],
                  ),
                ),
                Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Divider(height: 24.h, color: const Color(0xFFEEEEEE)),

            // Content
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                    item.product.imageUrl,
                    width: 80.w,
                    height: 80.w,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 80.w,
                      height: 80.w,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.product.name,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF333333),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '¥${item.product.price}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF333333),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '规格：${item.product.specifications}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFF999999),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '共${order.items.length}件 合计：',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF666666),
                            ),
                          ),
                          Text(
                            '¥${order.totalAmount}',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF333333),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Pickup Hint / Remark
            if (order.pickupHint != null) ...[
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F9FF),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  order.pickupHint!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF007AFF),
                  ),
                ),
              ),
            ] else if (order.remark != null && order.remark!.isNotEmpty) ...[
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF0F0),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  order.remark!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFFFF5252),
                  ),
                ),
              ),
            ],

            // Action Buttons
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: _buildActionButtons(order),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildActionButtons(OrderModel order) {
    if (order.status == OrderStatus.paid) {
      return [
        _buildButton(
          '申请退款',
          textColor: const Color(0xFF666666),
          borderColor: const Color(0xFFDDDDDD),
          onTap: () => _handleAction(order, 'refund', context),
        ),
        SizedBox(width: 12.w),
        _buildButton(
          '查看券码',
          textColor: const Color(0xFFFF5252),
          borderColor: const Color(0xFFFF5252),
          onTap: () => _handleAction(order, 'view_code', context),
        ),
      ];
    } else if (order.status == OrderStatus.cancelled ||
        order.status == OrderStatus.refunded) {
      return [
        _buildButton(
          '删除订单',
          textColor: const Color(0xFF666666),
          borderColor: const Color(0xFFDDDDDD),
          onTap: () => _handleAction(order, 'delete', context),
        ),
        SizedBox(width: 12.w),
        _buildButton(
          '重新购买',
          textColor: const Color(0xFFFF5252),
          borderColor: const Color(0xFFFF5252),
          onTap: () => _handleAction(order, 'reorder', context),
        ),
      ];
    } else if (order.status == OrderStatus.pending) {
      return [
        _buildButton(
          '取消订单',
          textColor: const Color(0xFF666666),
          borderColor: const Color(0xFFDDDDDD),
          onTap: () => _handleAction(order, 'cancel', context),
        ),
        SizedBox(width: 12.w),
        _buildButton(
          '立即支付',
          textColor: const Color(0xFFFF5252),
          borderColor: const Color(0xFFFF5252),
          onTap: () => _handleAction(order, 'pay', context),
        ),
      ];
    } else if (order.status == OrderStatus.completed) {
      return [
        _buildButton(
          '重新购买',
          textColor: const Color(0xFFFF5252),
          borderColor: const Color(0xFFFF5252),
          onTap: () => _handleAction(order, 'reorder', context),
        ),
      ];
    }
    return [];
  }

  Widget _buildButton(
    String text, {
    required Color textColor,
    required Color borderColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        decoration: BoxDecoration(
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

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return const Color(0xFFFF5252);
      case OrderStatus.paid:
        return const Color(0xFF333333);
      case OrderStatus.completed:
        return const Color(0xFF999999);
      case OrderStatus.cancelled:
      case OrderStatus.refunded:
      case OrderStatus.failed:
        return const Color(0xFF999999);
    }
  }
}
