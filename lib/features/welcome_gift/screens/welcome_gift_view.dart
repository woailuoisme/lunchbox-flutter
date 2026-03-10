import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:lunchbox/features/welcome_gift/providers/welcome_gift_provider.dart';
import 'package:lunchbox/features/welcome_gift/widgets/welcome_gift_header.dart';
import 'package:lunchbox/features/welcome_gift/widgets/welcome_gift_list.dart';
import 'package:lunchbox/features/welcome_gift/widgets/welcome_gift_tab_bar.dart';
import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_state.dart';
import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_item_response.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 新人礼包页面
class WelcomeGiftView extends ConsumerStatefulWidget {
  const WelcomeGiftView({super.key});

  @override
  ConsumerState<WelcomeGiftView> createState() => _WelcomeGiftViewState();
}

class _WelcomeGiftViewState extends ConsumerState<WelcomeGiftView>
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

  Future<void> _handleClaim(int giftId) async {
    final success = await ref
        .read(welcomeGiftProvider.notifier)
        .claimGift(giftId);
    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(t.welcome_gift.card.status.received),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // 监听状态变化处理
    ref.listen<AsyncValue<WelcomeGiftState>>(welcomeGiftProvider, (
      previous,
      next,
    ) {
      next.whenData((state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Theme.of(context).colorScheme.error,
              behavior: SnackBarBehavior.floating,
            ),
          );
          ref.read(welcomeGiftProvider.notifier).clearMessage();
        }
      });
    });

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final stateAsync = ref.watch(welcomeGiftProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: stateAsync.when(
        data: (state) => _buildContent(context, state),
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Symbols.error, size: 48.sp, color: colorScheme.error),
              SizedBox(height: 16.h),
              Text(err.toString()),
              TextButton(
                onPressed: () =>
                    ref.read(welcomeGiftProvider.notifier).refresh(),
                child: Text(t.common.retry),
              ),
            ],
          ),
        ),
        loading: () => Skeletonizer(
          enabled: true,
          child: _buildContent(context, _mockState),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WelcomeGiftState state) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const WelcomeGiftHeader(),
          SizedBox(height: 12.h),
          WelcomeGiftTabBar(
            tabController: _tabController,
            receivedCount: state.receivedLogs.length,
          ).animate().fadeIn(delay: 300.ms),
          SizedBox(height: 16.h),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                WelcomeGiftList(
                  gifts: state.availableGifts,
                  processingId: state.processingId,
                  onClaim: (gift) {
                    debugPrint('Claiming gift: ${gift.id}');
                    _handleClaim(gift.id);
                  },
                ),
                WelcomeGiftList(
                  gifts: state.receivedLogs
                      .map((log) => log.welcomeGift.copyWith(isClaimed: true))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 骨架屏模拟数据
  WelcomeGiftState get _mockState => WelcomeGiftState(
    availableGifts: List.generate(
      3,
      (index) => WelcomeGiftItemResponse(
        id: index,
        name: 'Mock Gift Name $index',
        type: 'coupon',
        typeLabel: '优惠券',
        rules: const WelcomeGiftRules(),
        description: 'This is a description placeholder for skeleton',
        order: index,
        createdAt: '2024-01-01',
      ),
    ),
    receivedLogs: [],
  );
}
