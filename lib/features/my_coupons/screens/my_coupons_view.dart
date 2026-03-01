import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lunchbox/features/my_coupons/widgets/coupon_list_tab_content.dart';
import 'package:lunchbox/features/my_coupons/widgets/coupon_tab_bar.dart';
import 'package:lunchbox/i18n/translations.g.dart';

class MyCouponsView extends ConsumerStatefulWidget {
  const MyCouponsView({super.key});

  @override
  ConsumerState<MyCouponsView> createState() => _MyCouponsViewState();
}

class _MyCouponsViewState extends ConsumerState<MyCouponsView>
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
        title: Text(t.coupon.title),
        centerTitle: true,
        bottom: CouponTabBar(
          controller: _tabController,
          tabs: [t.coupon.tabs.canUse, t.coupon.tabs.cannotUse],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const CouponListTabContent(isAvailable: true),
          const CouponListTabContent(isAvailable: false),
        ],
      ),
    );
  }
}
