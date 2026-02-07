import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/values/app_colors.dart';
import 'package:lunchbox/features/home/models/lottery_prize.dart';
import 'package:lunchbox/features/home/providers/lottery_provider.dart';
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
    final lotteryState = ref.watch(lotteryProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        title: Text(t.home.lottery.prizes),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildStatsHeader(lotteryState.prizes.length),
          _buildTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPrizeList(lotteryState.prizes),
                _buildPrizeList(
                  lotteryState.prizes.where((p) => !p.isUsed).toList(),
                ), // 可用
                _buildPrizeList(
                  lotteryState.prizes.where((p) => p.isUsed).toList(),
                ), // 已使用
                _buildPrizeList([]), // 已过期
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 顶部统计信息
  Widget _buildStatsHeader(int totalCount) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://img.icons8.com/emoji/96/wrapped-gift.png',
                width: 32.w,
                height: 32.w,
              ),
              SizedBox(width: 8.w),
              Text(
                t.home.lottery.prizes,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            '查看您获得的所有奖品',
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
          SizedBox(height: 20.h),
          Divider(height: 1.h, color: Colors.grey.withValues(alpha: 0.1)),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(
                totalCount.toString(),
                t.home.lottery.prizeStats.total,
              ),
              _buildStatItem('0', t.home.lottery.prizeStats.used),
              _buildStatItem(
                totalCount.toString(),
                t.home.lottery.prizeStats.available,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
        ),
      ],
    );
  }

  /// 分类 TabBar
  Widget _buildTabBar() {
    return ColoredBox(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        labelColor: AppColors.primary,
        unselectedLabelColor: Colors.black87,
        indicatorColor: AppColors.primary,
        indicatorSize: TabBarIndicatorSize.label,
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
  Widget _buildPrizeList(List<LotteryPrize> prizes) {
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: prizes.length,
      itemBuilder: (context, index) {
        final prize = prizes[index];
        return _buildPrizeCard(prize);
      },
    );
  }

  Widget _buildPrizeCard(LotteryPrize prize) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 50.w,
            decoration: const BoxDecoration(
              color: Color(0xFFFFEAEA),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(Icons.star, color: Colors.amber, size: 30.w),
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
                      '${prize.amount}乖乖币',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      prize.isUsed ? '已使用' : '可用',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  '乖乖币奖励，可在乖乖币商城使用',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
                SizedBox(height: 4.h),
                Text(
                  '获得时间: ${prize.createdAt.toString().substring(0, 16)}',
                  style: TextStyle(fontSize: 11.sp, color: Colors.grey[400]),
                ),
                if (prize.expiredAt != null)
                  Text(
                    '有效期至: ${prize.expiredAt.toString().substring(0, 16)}',
                    style: TextStyle(fontSize: 11.sp, color: Colors.grey[400]),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
