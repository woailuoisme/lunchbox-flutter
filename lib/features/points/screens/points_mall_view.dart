import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/points/entities/mall_product_model.dart';
import 'package:lunchbox/features/points/repositories/points_repository.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/core/services/dialog_service.dart';
import 'package:lunchbox/features/points/widgets/points_mall_header.dart';
import 'package:lunchbox/features/points/widgets/points_product_card.dart';
import 'package:lunchbox/features/points/widgets/points_empty_state.dart';

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
          _buildHeader(context, ref),
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

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    final balanceAsync = ref.watch(pointsBalanceProvider);
    final balance = balanceAsync.maybeWhen(data: (v) => v, orElse: () => 0);

    return PointsMallHeader(balance: balance, unitText: t.points.unit);
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
          return PointsEmptyState(
            message: t.points.noProducts,
            icon: Symbols.shopping_bag,
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
    final balanceAsync = ref.watch(pointsBalanceProvider);
    final int balance = balanceAsync.maybeWhen(data: (v) => v, orElse: () => 0);

    return PointsProductCard(
      product: product,
      balance: balance,
      balanceLabel: t.points.balance,
      costLabel: t.points.cost(points: product.pointsCost),
      buttonText: balance >= product.pointsCost
          ? t.points.exchangeNow
          : t.points.insufficientPoints,
      onExchange: () async {
        final confirmed = await ref
            .read(dialogServiceProvider)
            .showConfirm(
              context: context,
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
                await ref
                    .read(dialogServiceProvider)
                    .showSuccess(
                      context: context,
                      message: t.points.exchangeSuccess,
                    );
                ref.invalidate(pointsBalanceProvider);
              } else {
                await ref
                    .read(dialogServiceProvider)
                    .showError(
                      context: context,
                      message: t.points.exchangeFailed,
                    );
              }
            }
          } catch (e) {
            if (context.mounted) {
              await ref
                  .read(dialogServiceProvider)
                  .showError(context: context, message: e.toString());
            }
          }
        }
      },
    );
  }
}
