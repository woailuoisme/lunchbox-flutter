import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/widgets/widgets.dart' as widgets;
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/points/providers/points_provider.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/routes.dart';
import 'package:lunchbox/features/points/entities/points_record_response.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lunchbox/features/points/widgets/points_balance_card.dart';
import 'package:lunchbox/features/points/widgets/points_mall_banner.dart';
import 'package:lunchbox/features/points/widgets/points_rules_section.dart';
import 'package:lunchbox/features/points/widgets/points_record_item.dart';
import 'package:lunchbox/features/points/widgets/points_empty_state.dart';

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
        title: Text(
          t.points.title,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18.sp),
        ),
        centerTitle: true,
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: widgets.CustomRefreshView(
        onRefresh: () async {
          await _listKeys[_tabController.index].currentState?.refresh();
          await Future<void>.delayed(const Duration(milliseconds: 500));
        },
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    _buildHeader(context, ref),
                    _buildMallBanner(context),
                    SizedBox(height: 16.h),
                    _buildRulesSection(context),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
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
                      indicatorWeight: 3,
                      dividerColor: Colors.transparent,
                      labelStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w900,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
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
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    final pointsAsync = ref.watch(pointsBalanceProvider);

    return PointsBalanceCard(
      points: pointsAsync.maybeWhen(data: (int v) => v, orElse: () => 0),
      title: t.points.title,
      recordsLabel: t.points.records,
      isLoading: pointsAsync.isLoading,
    );
  }

  Widget _buildMallBanner(BuildContext context) {
    return PointsMallBanner(
      title: t.points.mall,
      subtitle: t.points.goExchange,
      buttonLabel: t.points.goExchange,
      onTap: () {
        const PointsMallRoute().push<void>(context);
      },
    );
  }

  Widget _buildRulesSection(BuildContext context) {
    return PointsRulesSection(
      title: t.points.rules,
      rules: [t.points.rule1, t.points.rule2],
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
  late final PagingController<int, PointsRecordResponse> _pagingController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _pagingController = PagingController<int, PointsRecordResponse>(
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

  Future<List<PointsRecordResponse>> _fetchPage(int pageKey) async {
    return await ref.read(
      pointsRecordsProvider(page: pageKey, type: widget.type).future,
    );
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
                PagedSliverList<int, PointsRecordResponse>(
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate:
                      PagedChildBuilderDelegate<PointsRecordResponse>(
                        itemBuilder: (context, item, index) =>
                            PointsRecordItem(item: item)
                                .animate()
                                .fadeIn(duration: 300.ms)
                                .slideY(begin: 0.1, end: 0),
                        noItemsFoundIndicatorBuilder: (context) =>
                            PointsEmptyState(
                              message: t.points.noRecords,
                              icon: Symbols.history,
                            ),
                        firstPageErrorIndicatorBuilder: (context) =>
                            widgets.ErrorWidget(
                              message: state.error.toString(),
                              onRetry: () => _pagingController.refresh(),
                            ),
                        newPageErrorIndicatorBuilder: (context) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: widgets.ErrorWidget(
                            message: state.error.toString(),
                            onRetry: fetchNextPage,
                          ),
                        ),
                        firstPageProgressIndicatorBuilder: (context) =>
                            _buildSkeletonList(),
                        newPageProgressIndicatorBuilder: (context) =>
                            const Padding(
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

  Widget _buildSkeletonList() {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: List.generate(
          8,
          (index) => PointsRecordItem(
            item: PointsRecordResponse(
              id: 0,
              redemptionContent: t.points.waitRecords,
              createdAt: '2024-01-01 12:00:00',
              inte: -100,
            ),
          ),
        ),
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
