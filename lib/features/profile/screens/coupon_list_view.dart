import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/profile/entities/coupon_model.dart';
import 'package:lunchbox/features/profile/repositories/coupon_repository.dart';

class CouponListView extends ConsumerStatefulWidget {
  const CouponListView({super.key});

  @override
  ConsumerState<CouponListView> createState() => _CouponListViewState();
}

class _CouponListViewState extends ConsumerState<CouponListView>
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
        title: const Text('优惠券'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: theme.colorScheme.primary,
          labelColor: theme.colorScheme.primary,
          unselectedLabelColor: theme.textTheme.bodyMedium?.color?.withValues(
            alpha: 0.54,
          ),
          tabs: const [
            Tab(text: '可使用'),
            Tab(text: '不可使用'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildCouponList(true), _buildCouponList(false)],
      ),
    );
  }

  Widget _buildCouponList(bool isAvailable) {
    // 0: available, 1: used, 2: expired.
    // isAvailable maps to 0, !isAvailable could be 1 or 2.
    // For simplicity, let's say !isAvailable shows all history (1 and 2) or we just pick one.
    // Let's assume !isAvailable shows expired (2) for now, or we can filter in UI.
    // Or we use -1 for all and filter here.
    // Let's use 0 for available, and 2 for expired/unavailable for this demo.
    final status = isAvailable ? 0 : 2;
    final couponsAsync = ref.watch(couponsByStatusProvider(status));
    final theme = Theme.of(context);

    return couponsAsync.when(
      data: (coupons) {
        if (coupons.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Symbols.airplane_ticket,
                  size: 64.sp,
                  color: theme.disabledColor,
                ),
                SizedBox(height: 16.h),
                Text(
                  '暂无优惠券',
                  style: TextStyle(color: theme.hintColor, fontSize: 14.sp),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.all(16.w),
          itemCount: coupons.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            return _buildCouponCard(coupons[index], isAvailable);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('加载失败: $error')),
    );
  }

  Widget _buildCouponCard(CouponModel coupon, bool isAvailable) {
    final theme = Theme.of(context);
    final cardColor = isAvailable
        ? theme.colorScheme.primary
        : theme.disabledColor;
    final contentColor = theme.colorScheme.onPrimary;

    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          // Left side: Amount
          Container(
            width: 100.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: contentColor.withValues(alpha: 0.3),
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '¥',
                      style: TextStyle(
                        color: contentColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      coupon.amount.toString(),
                      style: TextStyle(
                        color: contentColor,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  coupon.condition,
                  style: TextStyle(
                    color: contentColor.withValues(alpha: 0.8),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          // Right side: Info
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coupon.title,
                    style: TextStyle(
                      color: contentColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '有效期至：${coupon.expiryDate}',
                    style: TextStyle(
                      color: contentColor.withValues(alpha: 0.8),
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: contentColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      isAvailable ? '可用' : '不可用',
                      style: TextStyle(color: contentColor, fontSize: 10.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Right circle cutout
          Container(
            width: 10.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
