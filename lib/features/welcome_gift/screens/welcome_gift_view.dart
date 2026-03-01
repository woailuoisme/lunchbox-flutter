import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_item_model.dart';
import 'package:lunchbox/features/welcome_gift/widgets/welcome_gift_header.dart';
import 'package:lunchbox/features/welcome_gift/widgets/welcome_gift_list.dart';
import 'package:lunchbox/features/welcome_gift/widgets/welcome_gift_tab_bar.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 新人礼包页面
class WelcomeGiftView extends StatefulWidget {
  const WelcomeGiftView({super.key});

  @override
  State<WelcomeGiftView> createState() => _WelcomeGiftViewState();
}

class _WelcomeGiftViewState extends State<WelcomeGiftView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // 模拟数据
  final List<WelcomeGiftItemModel> _availableGifts = [
    const WelcomeGiftItemModel(
      id: '1',
      title: '10元优惠券',
      description: '10元优惠券',
      isClaimed: false,
    ),
  ];

  final List<WelcomeGiftItemModel> _receivedGifts = [
    const WelcomeGiftItemModel(
      id: '2',
      title: '10元优惠券',
      description: '10元优惠券',
      isClaimed: true,
    ),
    const WelcomeGiftItemModel(
      id: '3',
      title: '5元无门槛券',
      description: '全场通用',
      isClaimed: true,
    ),
  ];

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
        title: Text(t.welcome_gift.title),
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
            child: const WelcomeGiftHeader(),
          ),
          SizedBox(height: 12.h),
          Expanded(
            child: Column(
              children: [
                WelcomeGiftTabBar(
                  tabController: _tabController,
                  receivedCount: _receivedGifts.length,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      WelcomeGiftList(
                        gifts: _availableGifts,
                        onClaim: (gift) {
                          // TODO: 实现领取逻辑
                        },
                      ),
                      WelcomeGiftList(gifts: _receivedGifts),
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
}
