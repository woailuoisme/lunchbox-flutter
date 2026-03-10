import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/points/entities/mall_product_response.dart';
import 'package:lunchbox/features/points/providers/points_provider.dart';
import 'package:lunchbox/features/points/providers/points_state.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/core/services/dialog_service.dart';
import 'package:lunchbox/routes/routes.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:lunchbox/features/points/widgets/points_mall_header.dart';
import 'package:lunchbox/features/points/widgets/points_product_card.dart';
import 'package:lunchbox/features/points/widgets/points_empty_state.dart';
import 'package:lunchbox/core/widgets/widgets.dart' as widgets;
import 'package:flutter_animate/flutter_animate.dart';

class PointsMallView extends ConsumerStatefulWidget {
  const PointsMallView({super.key});

  @override
  ConsumerState<PointsMallView> createState() => _PointsMallViewState();
}

class _PointsMallViewState extends ConsumerState<PointsMallView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

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

    ref.listen<AsyncValue<PointsMallState>>(pointsMallProvider, (prev, next) {
      final state = next.value;
      if (state == null) return;

      final dialogSvc = ref.read(dialogServiceProvider);

      if (state.errorMessage != null) {
        dialogSvc.showError(context: context, message: state.errorMessage!);
        ref.read(pointsMallProvider.notifier).clearMessage();
      } else if (isPointsExchangeSuccess(state.successMessage)) {
        dialogSvc.showSuccess(
          context: context,
          message: t.points.exchangeSuccess,
        );
        ref.read(pointsMallProvider.notifier).clearMessage();
      }
    });

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(t.points.mall),
        centerTitle: true,
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Symbols.history),
            onPressed: () => const MyPointsRoute().push<void>(context),
            tooltip: t.points.records,
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverToBoxAdapter(
            child: const _PointsMallHeaderWrapper()
                .animate()
                .fadeIn(duration: 400.ms)
                .slideY(begin: -0.1, end: 0),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 48.h,
              maxHeight: 48.h,
              child: _buildTabBar(theme),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: const [
            _PointsMallList(tabType: 'balance'),
            _PointsMallList(tabType: 'coupon'),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor.withValues(alpha: 0.1),
            width: 0.5,
          ),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 3,
        indicatorColor: theme.colorScheme.primary,
        labelColor: theme.colorScheme.primary,
        unselectedLabelColor: theme.hintColor,
        labelStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 15.sp),
        tabs: [
          Tab(text: t.points.balance),
          Tab(text: t.points.coupon),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _PointsMallHeaderWrapper extends ConsumerWidget {
  const _PointsMallHeaderWrapper();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(
      pointsMallProvider.select(
        (AsyncValue<PointsMallState> v) => v.maybeWhen(
          data: (PointsMallState s) => s.balance,
          orElse: () => 0,
        ),
      ),
    );
    return PointsMallHeader(balance: balance, unitText: t.points.unit);
  }
}

class _PointsMallList extends ConsumerWidget {
  const _PointsMallList({required this.tabType});
  final String tabType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mallAsync = ref.watch(pointsMallProvider);

    return mallAsync.when(
      loading: () => _PointsProductSkeleton(tabType: tabType),
      error: (Object e, _) => widgets.ErrorWidget(
        message: t.points.loadFailed(error: e.toString()),
        onRetry: () => ref.read(pointsMallProvider.notifier).refresh(),
      ),
      data: (PointsMallState state) {
        final items = tabType == 'balance'
            ? state.balanceProducts
            : state.couponProducts;

        if (items.isEmpty) {
          return PointsEmptyState(
            message: t.points.noProducts,
            icon: Symbols.shopping_bag,
          );
        }

        return RefreshIndicator(
          onRefresh: () async =>
              ref.read(pointsMallProvider.notifier).refresh(),
          child: GridView.builder(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 32.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 16.w,
              childAspectRatio: 0.85,
            ),
            itemCount: items.length,
            itemBuilder: (context, i) =>
                _ProductCardWrapper(
                      product: items[i],
                      balance: state.balance,
                      isRedeeming: state.redeemingId == items[i].id,
                    )
                    .animate()
                    .fadeIn(duration: 400.ms, delay: (i * 50).ms)
                    .scale(
                      begin: const Offset(0.95, 0.95),
                      end: const Offset(1, 1),
                      curve: Curves.easeOutBack,
                    ),
          ),
        );
      },
    );
  }
}

class _PointsProductSkeleton extends StatelessWidget {
  const _PointsProductSkeleton({required this.tabType});
  final String tabType;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(16.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.w,
          childAspectRatio: 0.85,
        ),
        itemCount: 6,
        itemBuilder: (_, i) => PointsProductCard(
          product: MallProductResponse(
            id: i,
            name: t.points.waitProducts,
            requiredPoints: 1000,
            content: '10元',
          ),
          balance: 0,
          balanceLabel: t.points.coupon,
          costLabel: t.points.cost(points: 1000),
          buttonText: t.points.exchangeNow,
        ),
      ),
    );
  }
}

class _ProductCardWrapper extends ConsumerWidget {
  const _ProductCardWrapper({
    required this.product,
    required this.balance,
    required this.isRedeeming,
  });

  final MallProductResponse product;
  final int balance;
  final bool isRedeeming;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PointsProductCard(
      product: product,
      balance: balance,
      balanceLabel: t.points.balance,
      costLabel: t.points.cost(points: product.requiredPoints),
      buttonText: balance >= product.requiredPoints
          ? t.points.exchangeNow
          : t.points.insufficientPoints,
      isRedeeming: isRedeeming,
      onExchange: isRedeeming ? null : () => _handleExchange(context, ref),
    );
  }

  Future<void> _handleExchange(BuildContext context, WidgetRef ref) async {
    final confirmed = await ref
        .read(dialogServiceProvider)
        .showConfirm(
          context: context,
          title: t.points.exchangeConfirmTitle,
          message: t.points.exchangeConfirmMessage(
            points: product.requiredPoints,
            product: product.name,
          ),
        );
    if (confirmed == true) {
      await ref.read(pointsMallProvider.notifier).redeemProduct(product);
    }
  }
}
