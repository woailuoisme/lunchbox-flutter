import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/coupons/repositories/coupons_repository.dart';
import 'package:lunchbox/features/coupons/widgets/coupon_card.dart';
import 'package:lunchbox/features/coupons/widgets/coupon_empty_state.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 优惠券页面
class CouponsView extends ConsumerStatefulWidget {
  const CouponsView({super.key});

  @override
  ConsumerState<CouponsView> createState() => _CouponsViewState();
}

class _CouponsViewState extends ConsumerState<CouponsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      appBar: AppBar(
        title: Text(t.coupon.title),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: colorScheme.primary,
          unselectedLabelColor: colorScheme.onSurfaceVariant,
          indicatorColor: colorScheme.primary,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(text: t.coupon.tabs.available),
            Tab(text: t.coupon.tabs.received),
            Tab(text: t.coupon.tabs.expired),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Symbols.more_horiz), onPressed: () {}),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCouponList(type: 'available'),
          _buildCouponList(type: 'received'),
          _buildCouponList(type: 'expired'),
        ],
      ),
    );
  }

  Widget _buildCouponList({required String type}) {
    // 根据 Tab 类型确定接口参数
    // type: available(待领取), received(已领取), expired(已过期)
    final category = type == 'available' ? 'shop' : null; // 假设商城券在待领取
    final couponType = type == 'expired' ? 'discount' : null; // 仅示例

    final couponsAsync = ref.watch(
      couponsProvider(category: category, type: couponType),
    );

    return couponsAsync.when(
      data: (coupons) {
        if (coupons.isEmpty) {
          return const CouponEmptyState();
        }

        return ListView.builder(
          padding: EdgeInsets.all(16.w),
          itemCount: coupons.length,
          itemBuilder: (context, index) {
            return CouponCard(
              coupon: coupons[index],
              viewType: type,
              onActionPressed: () {
                // TODO: 实现领取逻辑
              },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('加载失败: $error'),
            TextButton(
              onPressed: () => ref.refresh(
                couponsProvider(category: category, type: couponType),
              ),
              child: const Text('重试'),
            ),
          ],
        ),
      ),
    );
  }
}
