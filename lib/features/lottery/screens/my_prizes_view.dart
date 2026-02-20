import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/lottery/entities/lottery_prize.dart';
import 'package:lunchbox/features/lottery/providers/lottery_notifier.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

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
    final lotteryState = ref.watch(lotteryProvider);
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
          _buildStatsHeader(lotteryState.prizes.length, colorScheme)
              .animate()
              .fadeIn(duration: 600.ms, curve: Curves.easeOut)
              .slideY(begin: -0.2, end: 0, duration: 600.ms),
          _buildTabBar(
            colorScheme,
          ).animate(delay: 200.ms).fadeIn(duration: 600.ms),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPrizeList(lotteryState.prizes, colorScheme),
                _buildPrizeList(
                  lotteryState.prizes.where((p) => !p.isUsed).toList(),
                  colorScheme,
                ), // 可用
                _buildPrizeList(
                  lotteryState.prizes.where((p) => p.isUsed).toList(),
                  colorScheme,
                ), // 已使用
                _buildPrizeList([], colorScheme), // 已过期
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 顶部统计信息
  Widget _buildStatsHeader(int totalCount, ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 8.w),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryContainer,
            colorScheme.surfaceContainerHighest,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: colorScheme.surface.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Symbols.card_giftcard,
                  size: 32.w,
                  color: colorScheme.primary,
                  fill: 1.0,
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.home.lottery.prizes,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    '查看您获得的所有奖品',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(
                totalCount.toString(),
                t.home.lottery.prizeStats.total,
                colorScheme,
                isPrimary: true,
              ),
              Container(
                width: 1,
                height: 30.h,
                color: colorScheme.outlineVariant,
              ),
              _buildStatItem('0', t.home.lottery.prizeStats.used, colorScheme),
              Container(
                width: 1,
                height: 30.h,
                color: colorScheme.outlineVariant,
              ),
              _buildStatItem(
                totalCount.toString(),
                t.home.lottery.prizeStats.available,
                colorScheme,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    String value,
    String label,
    ColorScheme colorScheme, {
    bool isPrimary = false,
  }) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
            color: isPrimary ? colorScheme.primary : colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  /// 分类 TabBar
  Widget _buildTabBar(ColorScheme colorScheme) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurfaceVariant,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          color: colorScheme.primaryContainer.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        indicatorPadding: EdgeInsets.all(4.w),
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        tabs: const [
          Tab(text: '全部'),
          Tab(text: '可用'),
          Tab(text: '已使用'),
          Tab(text: '已过期'),
        ],
      ),
    );
  }

  /// 奖品列表
  Widget _buildPrizeList(List<LotteryPrize> prizes, ColorScheme colorScheme) {
    if (prizes.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Symbols.inbox, size: 64.w, color: colorScheme.outlineVariant),
            SizedBox(height: 16.h),
            Text(
              '暂无奖品',
              style: TextStyle(color: colorScheme.outline, fontSize: 14.sp),
            ),
          ],
        ),
      );
    }
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: prizes.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final prize = prizes[index];
        return _buildPrizeCard(prize, colorScheme)
            .animate(delay: (index * 50).ms)
            .fadeIn(duration: 400.ms)
            .slideX(begin: 0.1, end: 0, curve: Curves.easeOut);
      },
    );
  }

  Widget _buildPrizeCard(LotteryPrize prize, ColorScheme colorScheme) {
    final isExpired =
        prize.expiredAt != null && prize.expiredAt!.isBefore(DateTime.now());
    final isUsed = prize.isUsed;

    // 状态标签配置
    Color statusColor;
    String statusText;
    IconData statusIcon;

    if (isUsed) {
      statusColor = colorScheme.outline;
      statusText = '已使用';
      statusIcon = Symbols.check_circle;
    } else if (isExpired) {
      statusColor = colorScheme.error;
      statusText = '已过期';
      statusIcon = Symbols.cancel;
    } else {
      statusColor = Colors.green;
      statusText = '可使用';
      statusIcon = Symbols.check_circle;
    }

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                  color: isUsed || isExpired
                      ? colorScheme.surfaceContainerHighest
                      : Colors.amber.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Symbols.star,
                  color: isUsed || isExpired
                      ? colorScheme.outline
                      : Colors.amber,
                  size: 32.w,
                  fill: 1.0,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${prize.amount} 乖乖币',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: isUsed || isExpired
                                ? colorScheme.onSurfaceVariant
                                : colorScheme.onSurface,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(statusIcon, size: 14.w, color: statusColor),
                              SizedBox(width: 4.w),
                              Text(
                                statusText,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: statusColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '可在乖乖币商城兑换商品',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Divider(
              height: 1,
              color: colorScheme.outlineVariant.withValues(alpha: 0.3),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '获得时间: ${prize.createdAt.toString().substring(0, 16)}',
                style: TextStyle(fontSize: 11.sp, color: colorScheme.outline),
              ),
              if (prize.expiredAt != null)
                Text(
                  '有效期至: ${prize.expiredAt.toString().substring(0, 16)}',
                  style: TextStyle(fontSize: 11.sp, color: colorScheme.outline),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
