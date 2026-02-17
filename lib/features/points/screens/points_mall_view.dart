import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:badges/badges.dart' as badges;
import 'package:lunchbox/features/points/entities/mall_product_model.dart';
import 'package:lunchbox/features/points/repositories/points_repository.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/core/widgets/app_dialog.dart';

class PointsMallView extends ConsumerStatefulWidget {
  const PointsMallView({super.key});

  @override
  ConsumerState<PointsMallView> createState() => _PointsMallViewState();
}

class _PointsMallViewState extends ConsumerState<PointsMallView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(t.points.mall),
        centerTitle: true,
        backgroundColor:
            theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildHeader(context),
          Container(
            color: theme.colorScheme.surface,
            child: TabBar(
              controller: _tabController,
              indicatorColor: theme.colorScheme.primary,
              labelColor: theme.colorScheme.primary,
              unselectedLabelColor: theme.hintColor,
              tabs: [
                Tab(text: t.points.balance),
                Tab(text: t.points.coupon),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                _PointsMallList(type: 'balance'),
                _PointsMallList(type: 'coupon'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final balanceAsync = ref.watch(pointsBalanceProvider);
    final balance = balanceAsync.maybeWhen(data: (v) => v, orElse: () => 0);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            t.points.unit,
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '$balance',
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Monospace',
            ),
          ),
        ],
      ),
    );
  }
}

class _PointsMallList extends ConsumerStatefulWidget {
  const _PointsMallList({required this.type});
  final String type;

  @override
  ConsumerState<_PointsMallList> createState() => _PointsMallListState();
}

class _PointsMallListState extends ConsumerState<_PointsMallList>
    with AutomaticKeepAliveClientMixin {
  late Future<List<MallProductModel>> _productsFuture;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _productsFuture = ref
        .read(pointsRepositoryProvider.notifier)
        .getMallProducts(pageSize: 100, type: widget.type);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);

    // Fetch products based on type
    return FutureBuilder<List<MallProductModel>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final items = snapshot.data ?? [];

        if (items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Symbols.shopping_bag,
                  size: 64.sp,
                  color: theme.disabledColor,
                ),
                SizedBox(height: 16.h),
                Text(
                  t.points.noProducts,
                  style: TextStyle(color: theme.hintColor, fontSize: 14.sp),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.all(16.w),
          itemCount: items.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) =>
              _buildProductCard(context, items[index]),
        );
      },
    );
  }

  Widget _buildProductCard(BuildContext context, MallProductModel product) {
    final theme = Theme.of(context);
    final balanceAsync = ref.watch(pointsBalanceProvider);
    final int balance = balanceAsync.maybeWhen(data: (v) => v, orElse: () => 0);
    final bool canAfford = balance >= product.pointsCost;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          // Left: Image/Amount with HOT Badge
          badges.Badge(
            showBadge: product.isHot,
            badgeContent: Text(
              'HOT',
              style: TextStyle(
                color: theme.colorScheme.onError,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.square,
              badgeColor: theme.colorScheme.error,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
                topLeft: Radius.circular(4.r),
                bottomRight: Radius.circular(4.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              elevation: 2,
            ),
            position: badges.BadgePosition.topEnd(top: -10, end: -10),
            child: Container(
              width: 80.w,
              height: 80.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¥${product.amountValue}',
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    t.points.balance,
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16.w),
          // Middle: Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.titleMedium?.color,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Text(
                  t.points.cost(points: product.pointsCost),
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // Right: Button
          SizedBox(width: 12.w),
          ElevatedButton(
            onPressed: canAfford
                ? () async {
                    final confirmed = await AppDialog.showConfirm(
                      context,
                      title: t.points.exchangeConfirmTitle,
                      message: t.points.exchangeConfirmMessage(
                        points: product.pointsCost,
                        product: product.title,
                      ),
                    );

                    if (confirmed == true && context.mounted) {
                      try {
                        final success = await ref
                            .read(pointsRepositoryProvider.notifier)
                            .exchangeProduct(product.id, product.pointsCost);

                        if (context.mounted) {
                          if (success) {
                            await AppDialog.showSuccess(
                              context,
                              message: t.points.exchangeSuccess,
                            );
                            ref.invalidate(pointsBalanceProvider);
                          } else {
                            await AppDialog.showError(
                              context,
                              message: t.points.exchangeFailed,
                            );
                          }
                        }
                      } catch (e) {
                        if (context.mounted) {
                          AppDialog.showError(context, message: e.toString());
                        }
                      }
                    }
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: canAfford
                  ? theme.colorScheme.primary
                  : theme.disabledColor,
              foregroundColor: theme.colorScheme.onPrimary,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              elevation: 0,
            ),
            child: Text(
              canAfford ? t.points.exchangeNow : t.points.insufficientPoints,
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
        ],
      ),
    );
  }
}
