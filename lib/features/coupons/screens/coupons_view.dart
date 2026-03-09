import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/coupons/entities/coupon_model.dart';
import 'package:lunchbox/features/coupons/providers/coupon_provider.dart';
import 'package:lunchbox/features/coupons/widgets/coupon_card.dart';
import 'package:lunchbox/features/coupons/widgets/coupon_empty_state.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:toastification/toastification.dart';

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
          _buildCouponList(type: 'expired'),
        ],
      ),
    );
  }

  Widget _buildCouponList({required String type}) {
    // 统一获取所有优惠券，不使用任何查询参数
    final couponsAsync = ref.watch(couponsProvider());

    return couponsAsync.when(
      data: (coupons) {
        final now = DateTime.now();

        // 根据返回结果在本地进行 Tab 过滤分类
        final filteredCoupons = coupons.where((coupon) {
          bool isExpired = false;
          if (coupon.endAt != null) {
            final end = DateTime.tryParse(coupon.endAt!);
            if (end != null && now.isAfter(end)) {
              isExpired = true;
            }
          }

          if (type == 'expired') {
            return isExpired;
          } else {
            // available
            return !isExpired;
          }
        }).toList();

        if (filteredCoupons.isEmpty) {
          return const CouponEmptyState();
        }

        return ListView.builder(
          padding: EdgeInsets.all(16.w),
          itemCount: filteredCoupons.length,
          itemBuilder: (context, index) {
            return _CouponItemCard(
              key: ValueKey(filteredCoupons[index].id),
              coupon: filteredCoupons[index],
              viewType: type,
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
              onPressed: () => ref.refresh(couponsProvider()),
              child: const Text('重试'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CouponItemCard extends ConsumerWidget {
  const _CouponItemCard({
    super.key,
    required this.coupon,
    required this.viewType,
  });

  final CouponModel coupon;
  final String viewType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 监听领取操作的状态变化 （侧作用/Side Effects)
    ref.listen(catchCouponProvider(coupon.id), (previous, next) {
      if (next.hasError && !next.isLoading) {
        toastification.show(
          context: context,
          type: ToastificationType.error,
          title: Text('领取失败: ${next.error}'),
          autoCloseDuration: const Duration(seconds: 3),
        );
      } else if (!next.isLoading &&
          next.hasValue &&
          previous?.isLoading == true) {
        toastification.show(
          context: context,
          type: ToastificationType.success,
          title: const Text('领取成功'),
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    });

    final catchState = ref.watch(catchCouponProvider(coupon.id));

    return CouponCard(
      coupon: coupon,
      viewType: viewType,
      isLoading: catchState.isLoading,
      onActionPressed: () {
        ref.read(catchCouponProvider(coupon.id).notifier).submit();
      },
    );
  }
}
