import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lunchbox/features/lottery/entities/lottery_state.dart';
import 'package:lunchbox/features/lottery/entities/lottery_statistics_response.dart';
import 'package:lunchbox/features/lottery/providers/lottery_provider.dart';
import 'package:lunchbox/features/lottery/widgets/prize_list_tab_content.dart';
import 'package:lunchbox/features/lottery/widgets/prize_stats_card.dart';
import 'package:lunchbox/features/lottery/widgets/prize_tab_bar.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 我的奖品页面
///
/// 展示抽奖统计 + 分类记录列表（全部 / 已中奖 / 未中奖）
class MyPrizesView extends ConsumerStatefulWidget {
  const MyPrizesView({super.key});

  @override
  ConsumerState<MyPrizesView> createState() => _MyPrizesViewState();
}

class _MyPrizesViewState extends ConsumerState<MyPrizesView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

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
    // 使用 select 精准订阅，避免无关字段触发 rebuild
    final lotteryState = ref.watch(
      lotteryProvider.select((async) => async.value ?? const LotteryState()),
    );
    final colorScheme = Theme.of(context).colorScheme;
    final stats = lotteryState.statistics;
    final all = lotteryState.records;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      appBar: AppBar(
        title: Text(t.lottery.prizes),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          _StatsSection(stats: stats)
              .animate()
              .fadeIn(duration: 600.ms, curve: Curves.easeOut)
              .slideY(begin: -0.2, end: 0, duration: 600.ms),
          PrizeTabBar(
            controller: _tabController,
          ).animate(delay: 200.ms).fadeIn(duration: 600.ms),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                PrizeListTabContent(records: all),
                PrizeListTabContent(
                  records: all.where((r) => r.result == 'win').toList(),
                ),
                PrizeListTabContent(
                  records: all.where((r) => r.result != 'win').toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 统计卡片区域（私有，避免重复渲染）
class _StatsSection extends StatelessWidget {
  const _StatsSection({required this.stats});

  final LotteryStatisticsResponse? stats;

  @override
  Widget build(BuildContext context) {
    return PrizeStatsCard(
      totalCount: stats?.totalRecords ?? 0,
      winCount: stats?.winningRecords ?? 0,
      distributedCount: stats?.distributedRecords ?? 0,
    );
  }
}

/// 兼容别名
typedef PrizeListContent = PrizeListTabContent;
