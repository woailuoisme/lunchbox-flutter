import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/coupons/entities/coupon_model.dart';
import 'package:lunchbox/features/coupons/repositories/coupons_repository.dart';
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
          _buildCouponList(type: 'available', colorScheme: colorScheme),
          _buildCouponList(type: 'received', colorScheme: colorScheme),
          _buildCouponList(type: 'expired', colorScheme: colorScheme),
        ],
      ),
    );
  }

  Widget _buildCouponList({
    required String type,
    required ColorScheme colorScheme,
  }) {
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
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Symbols.confirmation_number,
                  size: 64.r,
                  color: colorScheme.outlineVariant,
                ),
                SizedBox(height: 16.h),
                Text(
                  '暂无优惠券',
                  style: TextStyle(color: colorScheme.outline, fontSize: 14.sp),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.all(16.w),
          itemCount: coupons.length,
          itemBuilder: (context, index) {
            return _buildCouponCard(coupons[index], colorScheme, type);
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

  Widget _buildCouponCard(
    CouponModel coupon,
    ColorScheme colorScheme,
    String viewType,
  ) {
    final rule = coupon.rule;
    final isExpired = viewType == 'expired';
    final isReceived = viewType == 'received';

    String amount = '0';
    String unit = t.coupon.unit;
    String conditionText = '无门槛';

    // 处理不同类型的优惠券显示逻辑
    if (coupon.type == 'discount') {
      amount = (rule.discountRate ?? 0).toStringAsFixed(0);
      unit = '折';
      final minAmount = rule.minAmount ?? rule.minSpendAmount ?? 0;
      conditionText = minAmount > 0
          ? '满${minAmount.toStringAsFixed(0)}元可用'
          : '无门槛';
    } else if (coupon.type == 'full_reduction' || coupon.type == 'reduction') {
      amount = (rule.reduceAmount ?? 0).toStringAsFixed(0);
      unit = t.coupon.unit;
      final minAmount = rule.minAmount ?? rule.minSpendAmount ?? 0;
      conditionText = minAmount > 0
          ? '满${minAmount.toStringAsFixed(0)}元可用'
          : '无门槛';
    }

    Color primaryColor = colorScheme.primary;
    Color btnTextColor = colorScheme.onPrimary;
    Color btnBgColor = colorScheme.primary;

    if (isReceived) {
      btnBgColor = colorScheme.surface;
      btnTextColor = colorScheme.primary;
    }

    if (isExpired) {
      primaryColor = colorScheme.outline;
      btnBgColor = Colors.transparent;
      btnTextColor = colorScheme.outline;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      height: 100.h,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left side: Amount
          Container(
            width: 100.w,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
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
                    if (coupon.type != 'discount')
                      Text(
                        unit,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    Text(
                      amount,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (coupon.type == 'discount')
                      Text(
                        unit,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
                Text(
                  conditionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 10.sp),
                ),
              ],
            ),
          ),
          // Right side: Info and Action
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
                      Expanded(
                        child: Text(
                          coupon.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: isExpired
                                ? colorScheme.outline
                                : colorScheme.onSurface,
                          ),
                        ),
                      ),
                      if (coupon.type == 'full_reduction')
                        Container(
                          margin: EdgeInsets.only(left: 4.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: isExpired
                                ? colorScheme.outline.withValues(alpha: 0.1)
                                : colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            '满减',
                            style: TextStyle(
                              color: isExpired
                                  ? colorScheme.outline
                                  : colorScheme.primary,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Text(
                    coupon.description ?? '全场通用',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorScheme.outline,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        coupon.endAt != null
                            ? '有效期至 ${coupon.endAt!.split(' ').first}'
                            : t.coupon.validForever,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: colorScheme.outline,
                        ),
                      ),
                      if (!isExpired)
                        SizedBox(
                          height: 28.h,
                          child: ElevatedButton(
                            onPressed: isReceived ? null : () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isReceived
                                  ? colorScheme.surface
                                  : btnBgColor,
                              foregroundColor: btnTextColor,
                              elevation: 0,
                              side: isReceived
                                  ? BorderSide(
                                      color: colorScheme.outlineVariant,
                                    )
                                  : null,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                            ),
                            child: Text(
                              isReceived ? '已领取' : '立即领取',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: isReceived
                                    ? colorScheme.outline
                                    : colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        )
                      else
                        Text(
                          '已过期',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: colorScheme.outline,
                          ),
                        ),
                    ],
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
