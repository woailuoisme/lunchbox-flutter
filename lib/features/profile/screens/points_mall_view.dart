import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/profile/entities/mall_product_model.dart';
import 'package:lunchbox/features/profile/repositories/points_repository.dart';
import 'package:lunchbox/i18n/translations.g.dart';

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
    _tabController = TabController(length: 3, vsync: this);
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
                Tab(text: t.points.all),
                Tab(text: t.points.balance),
                Tab(text: t.points.coupon),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildProductList(context),
                _buildProductList(context),
                _buildProductList(context),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.h),
            child: Text(
              t.points.noMoreProducts,
              style: TextStyle(color: theme.hintColor, fontSize: 12.sp),
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
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 40.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primaryContainer,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.points.mall,
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              t.points.myPoints(points: balance),
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList(BuildContext context) {
    final productsAsync = ref.watch(mallProductsProvider);
    final theme = Theme.of(context);

    return productsAsync.when(
      data: (products) {
        if (products.isEmpty) {
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
          itemCount: products.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            return _buildProductCard(context, products[index]);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Symbols.error, size: 48.sp, color: theme.colorScheme.error),
            SizedBox(height: 8.h),
            Text('${t.common.loadFailed}: $error'),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, MallProductModel product) {
    final theme = Theme.of(context);
    // Mock canAfford logic (assuming 1000 points balance for check, or use real balance if passed)
    // For simplicity, we'll assume we can afford it if cost < 1000 for now,
    // or better, pass balance to this widget.
    // Let's use the provider value.
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
          // Left: Image/Amount
          Container(
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
          SizedBox(width: 16.w),
          // Middle: Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.titleMedium?.color,
                      ),
                    ),
                    if (product.isHot) ...[
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          'HOT',
                          style: TextStyle(
                            color: theme.colorScheme.onTertiary,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
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
            onPressed: canAfford ? () {} : null,
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
