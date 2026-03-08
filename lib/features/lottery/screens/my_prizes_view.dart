import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lunchbox/features/lottery/entities/lottery_prize.dart';
import 'package:lunchbox/features/lottery/entities/lottery_state.dart';
import 'package:lunchbox/features/lottery/providers/lottery_provider.dart';
import 'package:lunchbox/features/lottery/widgets/prize_list_tab_content.dart';
import 'package:lunchbox/features/lottery/widgets/prize_stats_card.dart';
import 'package:lunchbox/features/lottery/widgets/prize_tab_bar.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 我的奖品页面
///
/// 展示用户获得的奖品列表，包含统计信息（总数、已使用、可用）和分类 Tab
class MyPrizesView extends ConsumerStatefulWidget {
  const MyPrizesView({super.key});

  @override
  ConsumerState<MyPrizesView> createState() => _MyPrizesViewState();
}

class _MyPrizesViewState extends ConsumerState<MyPrizesView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lotteryAsync = ref.watch(lotteryProvider);
    final lotteryState =
        lotteryAsync.value ??
        const LotteryState(remainingSpins: 3, prizes: <LotteryPrize>[]);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      appBar: AppBar(
        title: Text(t.home.lottery.prizes),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          PrizeStatsCard(
                totalCount: lotteryState.prizes.length,
                usedCount: lotteryState.prizes
                    .where((LotteryPrize p) => p.isUsed)
                    .length,
                availableCount: lotteryState.prizes
                    .where((LotteryPrize p) => !p.isUsed)
                    .length,
              )
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
                PrizeListContent(prizes: lotteryState.prizes),
                PrizeListContent(
                  prizes: lotteryState.prizes
                      .where((LotteryPrize p) => !p.isUsed)
                      .toList(),
                ), // 可用
                PrizeListContent(
                  prizes: lotteryState.prizes
                      .where((LotteryPrize p) => p.isUsed)
                      .toList(),
                ), // 已使用
                const PrizeListContent(prizes: []), // 已过期
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 别名定义，以便向后兼容或简化代码引用
typedef PrizeListContent = PrizeListTabContent;
