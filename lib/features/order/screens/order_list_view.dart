import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/order/widgets/order_action_button.dart';
import 'package:lunchbox/features/order/widgets/order_empty_state.dart';
import 'package:lunchbox/features/order/widgets/order_list_item.dart';
import 'package:lunchbox/features/order/widgets/order_list_tab_bar.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
import 'package:lunchbox/features/order/providers/order_provider.dart';
import 'package:lunchbox/i18n/translations.g.dart';
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

  late final List<String> _filterTitles;

  @override
  void initState() {
    super.initState();
    // Initialize filter titles here to access translations
    _filterTitles = [
      t.order.status.all,
      t.order.status.pending,
      t.order.status.paid,
      t.order.status.completed,
      '${t.order.status.refunded}/${t.order.status.cancelled}',
    ];

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
    for (final controller in _pagingControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<List<OrderModel>> _fetchPage(int pageKey, int filterIndex) async {
    final filterValue = _filterValues[filterIndex];
    final status = filterValue == 'all' ? null : filterValue;
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
          await notifier.cancelOrder(order.id.toString());
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(t.order.orderCancelled)));
            _refreshCurrentTab();
          }
          break;
        case 'pay':
          // 使用 Stripe 支付
          await notifier.payOrder(order.id.toString(), 'stripe');
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(t.order.paySuccess)));
            _refreshCurrentTab();
          }
          break;
        case 'reorder':
          await notifier.reorder(order.id.toString());
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(t.order.reorderSuccess)));
            // Navigate to cart
            if (context.mounted) {
              await context.push(AppRoutes.cart);
            }
          }
          break;
        case 'view_code':
          unawaited(
            context.push(
              '${AppRoutes.orderDetail}/${order.id}',
              extra: {'order': order},
            ),
          );
          break;
        case 'refund':
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(t.order.refundNotAvailable)));
          }
          break;
        case 'delete':
          // Not implemented in backend yet
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(t.order.deleteNotAvailable)));
          }
          break;
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.order.operationFailed(error: e.toString()))),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          t.order.foodOrder,
          style: TextStyle(
            color: theme.appBarTheme.foregroundColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          OrderListTabBar(controller: _tabController, titles: _filterTitles),
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
      return const OrderEmptyState();
    }
    return CustomRefreshView(
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
                    Text(
                      t.order.loadFailed(error: controller.error.toString()),
                    ),
                    ElevatedButton(
                      onPressed: () => controller.refresh(),
                      child: Text(t.order.retry),
                    ),
                  ],
                ),
              ),
              noItemsFoundIndicatorBuilder: (context) =>
                  const OrderEmptyState(),
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
    return const OrderEmptyState();
  }

  Widget _buildOrderCard(OrderModel order) {
    return OrderListItem(
          order: order,
          onTap: () {
            context.push(
              '${AppRoutes.orderDetail}/${order.id}',
              extra: {'order': order},
            );
          },
          actionButtons: _buildActionButtons(context, order),
        )
        .animate()
        .fadeIn(duration: 300.ms)
        .slideY(
          begin: 0.1,
          end: 0,
          curve: Curves.easeOutQuad,
          duration: 300.ms,
        );
  }

  List<Widget> _buildActionButtons(BuildContext context, OrderModel order) {
    final theme = Theme.of(context);
    final buttons = <Widget>[];

    if (order.status == OrderStatus.paid) {
      buttons.add(
        OrderActionButton(
          text: t.order.refund,
          onTap: () => _handleAction(order, 'refund', context),
        ),
      );
      buttons.add(SizedBox(width: 8.w));
      buttons.add(
        OrderActionButton(
          text: t.order.viewCode,
          textColor: theme.colorScheme.primary,
          borderColor: theme.colorScheme.primary,
          onTap: () => _handleAction(order, 'view_code', context),
        ),
      );
    } else if (order.status == OrderStatus.completed ||
        order.status == OrderStatus.refund) {
      buttons.add(
        OrderActionButton(
          text: t.order.deleteOrder,
          onTap: () => _handleAction(order, 'delete', context),
        ),
      );
      buttons.add(SizedBox(width: 8.w));
      buttons.add(
        OrderActionButton(
          text: t.order.reorder,
          textColor: theme.colorScheme.primary,
          borderColor: theme.colorScheme.primary,
          onTap: () => _handleAction(order, 'reorder', context),
        ),
      );
    } else if (order.status == OrderStatus.pending) {
      buttons.add(
        OrderActionButton(
          text: t.order.cancelOrder,
          onTap: () => _handleAction(order, 'cancel', context),
        ),
      );
      buttons.add(SizedBox(width: 8.w));
      buttons.add(
        OrderActionButton(
          text: t.order.payNow,
          textColor: theme.colorScheme.primary,
          borderColor: theme.colorScheme.primary,
          onTap: () => _handleAction(order, 'pay', context),
        ),
      );
    } else if (order.status == OrderStatus.cancelled) {
      buttons.add(
        OrderActionButton(
          text: t.order.reorder,
          textColor: theme.colorScheme.primary,
          borderColor: theme.colorScheme.primary,
          onTap: () => _handleAction(order, 'reorder', context),
        ),
      );
    }

    return buttons;
  }
}
