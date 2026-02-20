import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/widgets/widgets.dart' as widgets;
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/points/repositories/points_repository.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/routes.dart';

import 'package:lunchbox/features/points/entities/points_record_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MyPointsView extends ConsumerStatefulWidget {
  const MyPointsView({super.key});

  @override
  ConsumerState<MyPointsView> createState() => _MyPointsViewState();
}

class _MyPointsViewState extends ConsumerState<MyPointsView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final List<GlobalKey<_PointsRecordListState>> _listKeys = [
    GlobalKey<_PointsRecordListState>(),
    GlobalKey<_PointsRecordListState>(),
    GlobalKey<_PointsRecordListState>(),
  ];

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
        title: Text(t.points.title),
        centerTitle: true,
        backgroundColor:
            theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
        elevation: 0,
      ),
      body: widgets.CustomRefreshView(
        onRefresh: () async {
          await _listKeys[_tabController.index].currentState?.refresh();
          // Wait a bit to show the refresh animation, as paging refresh is sync/fast
          await Future<void>.delayed(const Duration(milliseconds: 500));
        },
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(child: _buildHeader(context, ref)),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              SliverToBoxAdapter(child: _buildMallBanner(context)),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              SliverToBoxAdapter(child: _buildRulesSection(context)),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
                sliver: SliverPersistentHeader(
                  pinned: true,
                  delegate: _StickyTabBarDelegate(
                    child: TabBar(
                      controller: _tabController,
                      labelColor: theme.colorScheme.primary,
                      unselectedLabelColor: theme.hintColor,
                      indicatorColor: theme.colorScheme.primary,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Tab(text: t.points.all),
                        Tab(text: t.points.earned),
                        Tab(text: t.points.used),
                      ],
                    ),
                    color: theme.scaffoldBackgroundColor,
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              _PointsRecordList(key: _listKeys[0], type: 'all'),
              _PointsRecordList(key: _listKeys[1], type: 'gain'),
              _PointsRecordList(key: _listKeys[2], type: 'use'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    final pointsAsync = ref.watch(pointsBalanceProvider);
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.primary.withValues(alpha: 0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Symbols.monetization_on,
                      size: 18.sp,
                      color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      t.points.title,
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary.withValues(
                          alpha: 0.9,
                        ),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    pointsAsync.when(
                      data: (points) => Text(
                        '$points',
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.bold,
                          height: 1.0,
                        ),
                      ),
                      loading: () => const widgets.LoadingWidget(),
                      error: (_, _) => Text(
                        '0',
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.bold,
                          height: 1.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(
                          color: theme.colorScheme.surface.withValues(
                            alpha: 0.3,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Symbols.history,
                            color: theme.colorScheme.onPrimary,
                            size: 16.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            t.points.records,
                            style: TextStyle(
                              color: theme.colorScheme.onPrimary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: -20,
            top: -20,
            child: Icon(
              Symbols.monetization_on,
              size: 120.sp,
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMallBanner(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Symbols.shopping_bag,
              color: theme.colorScheme.primary,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.points.mall,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.titleMedium?.color,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  t.points.goExchange,
                  style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              const PointsMallRoute().push<void>(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            child: Text(t.points.goExchange),
          ),
        ],
      ),
    );
  }

  Widget _buildRulesSection(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Symbols.description,
                size: 20.sp,
                color: theme.colorScheme.primary,
              ),
              SizedBox(width: 8.w),
              Text(
                t.points.rules,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildRuleItem(context, t.points.rule1),
          SizedBox(height: 12.h),
          _buildRuleItem(context, t.points.rule2),
        ],
      ),
    );
  }

  Widget _buildRuleItem(BuildContext context, String text) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 6.h),
          width: 6.w,
          height: 6.w,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.5),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: theme.textTheme.bodyMedium?.color,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    // 底部如果有操作按钮可以在这里添加，目前没有需求
    return const SizedBox.shrink();
  }
}

class _PointsRecordList extends ConsumerStatefulWidget {
  const _PointsRecordList({super.key, required this.type});
  final String type;

  @override
  ConsumerState<_PointsRecordList> createState() => _PointsRecordListState();
}

class _PointsRecordListState extends ConsumerState<_PointsRecordList>
    with AutomaticKeepAliveClientMixin {
  late final PagingController<int, PointsRecordModel> _pagingController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _pagingController = PagingController<int, PointsRecordModel>(
      getNextPageKey: (state) {
        if (state.pages == null || state.pages!.isEmpty) {
          return 1;
        }
        final lastPageItemCount = state.pages!.last.length;
        if (lastPageItemCount < 20) {
          return null;
        }
        return (state.keys?.last ?? 0) + 1;
      },
      fetchPage: (pageKey) => _fetchPage(pageKey),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<List<PointsRecordModel>> _fetchPage(int pageKey) async {
    return await ref
        .read(pointsRepositoryProvider.notifier)
        .getPointsRecords(page: pageKey, type: widget.type);
  }

  Future<void> refresh() async {
    _pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      key: PageStorageKey<String>(widget.type),
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          sliver: PagingListener(
            controller: _pagingController,
            builder: (context, state, fetchNextPage) =>
                PagedSliverList<int, PointsRecordModel>(
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate: PagedChildBuilderDelegate<PointsRecordModel>(
                    itemBuilder: (context, item, index) =>
                        _buildRecordItem(context, item),
                    noItemsFoundIndicatorBuilder: (context) => Center(
                      child: Padding(
                        padding: EdgeInsets.all(24.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Symbols.history,
                              size: 48.sp,
                              color: Theme.of(context).disabledColor,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              t.points.noRecords,
                              style: TextStyle(
                                color: Theme.of(context).disabledColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(24.0),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    newPageProgressIndicatorBuilder: (context) => const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 32.h)),
      ],
    );
  }

  Widget _buildRecordItem(BuildContext context, PointsRecordModel item) {
    final theme = Theme.of(context);
    final isGain = item.points > 0;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: isGain
                  ? theme.colorScheme.primaryContainer.withValues(alpha: 0.3)
                  : theme.colorScheme.errorContainer.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isGain ? Symbols.add : Symbols.remove,
              color: isGain
                  ? theme.colorScheme.primary
                  : theme.colorScheme.error,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.titleMedium?.color,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  item.date,
                  style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
                ),
              ],
            ),
          ),
          Text(
            isGain ? '+${item.points}' : '${item.points}',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: isGain
                  ? theme.colorScheme.primary
                  : theme.colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate({required this.child, required this.color});

  final TabBar child;
  final Color color;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: color, child: child);
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(covariant _StickyTabBarDelegate oldDelegate) {
    return child != oldDelegate.child || color != oldDelegate.color;
  }
}
