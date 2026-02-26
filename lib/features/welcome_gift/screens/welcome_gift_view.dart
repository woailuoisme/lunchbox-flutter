import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 新人礼包页面
class WelcomeGiftView extends StatefulWidget {
  const WelcomeGiftView({super.key});

  @override
  State<WelcomeGiftView> createState() => _WelcomeGiftViewState();
}

class _WelcomeGiftViewState extends State<WelcomeGiftView>
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
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      appBar: AppBar(
        title: const Text('新人礼包'),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Symbols.more_horiz), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: colorScheme.surface,
            padding: EdgeInsets.only(bottom: 16.h),
            child: _buildHeader(colorScheme),
          ),
          SizedBox(height: 12.h),
          Expanded(
            child: Column(
              children: [
                _buildTabBar(colorScheme),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildGiftList(
                        type: 'available',
                        colorScheme: colorScheme,
                      ),
                      _buildGiftList(
                        type: 'received',
                        colorScheme: colorScheme,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建头部文案区域
  Widget _buildHeader(ColorScheme colorScheme) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Text(
          '新人礼包',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          '注册30天内可领取，每个礼包限领一次',
          style: TextStyle(
            fontSize: 12.sp,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  /// 构建自定义 TabBar
  Widget _buildTabBar(ColorScheme colorScheme) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: const LinearGradient(
            colors: [Color(0xFFFF8A65), Color(0xFFFFAB91)],
          ),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: colorScheme.onSurfaceVariant,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        tabs: [
          const Tab(text: '可领取'),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('已领取'),
                SizedBox(width: 4.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text('2', style: TextStyle(fontSize: 10.sp)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建礼包列表
  Widget _buildGiftList({
    required String type,
    required ColorScheme colorScheme,
  }) {
    // 模拟数据
    final gifts = [
      {'title': '10元优惠券', 'desc': '10元优惠券', 'isReceived': type != 'available'},
      // 如果是已领取列表，多展示几个
      if (type != 'available') ...[
        {'title': '5元无门槛券', 'desc': '全场通用', 'isReceived': true},
      ],
    ];

    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: gifts.length,
      itemBuilder: (context, index) {
        return _buildGiftCard(gifts[index], colorScheme);
      },
    );
  }

  /// 构建单个礼包卡片
  Widget _buildGiftCard(Map<String, dynamic> data, ColorScheme colorScheme) {
    final isReceived = data['isReceived'] as bool;
    final title = data['title'] as String;
    final desc = data['desc'] as String;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // 左侧礼包标识
          Container(
            width: 100.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFFFCCBC).withValues(alpha: 0.3),
                  const Color(0xFFFFAB91).withValues(alpha: 0.1),
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              '礼包',
              style: TextStyle(
                color: const Color(0xFFFF7043),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // 右侧内容
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      // 状态标签或按钮
                      if (isReceived)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF4DB6AC), // 绿色背景
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            '已领取',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  // 底部领取按钮区域
                  Align(
                    alignment: Alignment.centerRight,
                    child: isReceived
                        ? Container(
                            width: 80.w,
                            height: 28.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            child: Text(
                              '已领取',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              // TODO: 实现领取逻辑
                            },
                            child: Container(
                              width: 80.w,
                              height: 28.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFFF8A65),
                                    Color(0xFFFFAB91),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(14.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFFFF8A65,
                                    ).withValues(alpha: 0.4),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Text(
                                '领取',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
