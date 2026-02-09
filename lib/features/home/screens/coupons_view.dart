import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 优惠券页面
class CouponsView extends StatefulWidget {
  const CouponsView({super.key});

  @override
  State<CouponsView> createState() => _CouponsViewState();
}

class _CouponsViewState extends State<CouponsView>
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
    // Mock data
    final coupons = [
      {
        'amount': '1',
        'condition': 0,
        'type': 'discount',
        'isReceived': type != 'available',
        'isExpired': type == 'expired',
      },
      {
        'amount': '1',
        'condition': 0,
        'type': 'discount',
        'isReceived': type != 'available',
        'isExpired': type == 'expired',
      },
      {
        'amount': '1',
        'condition': 0,
        'type': 'discount',
        'isReceived': type != 'available',
        'isExpired': type == 'expired',
      },
      {
        'amount': '1',
        'condition': 0,
        'type': 'discount',
        'isReceived': type != 'available',
        'isExpired': type == 'expired',
      },
      {
        'amount': '1',
        'condition': 0,
        'type': 'discount',
        'isReceived': type != 'available',
        'isExpired': type == 'expired',
      },
      {
        'amount': '20',
        'condition': 0,
        'type': 'discount',
        'isReceived': type != 'available',
        'isExpired': type == 'expired',
      },
      {
        'amount': '5',
        'condition': 0,
        'type': 'discount',
        'isReceived': type != 'available',
        'isExpired': type == 'expired',
      },
      {
        'amount': '10',
        'condition': 0,
        'type': 'discount',
        'isReceived': type != 'available',
        'isExpired': type == 'expired',
      },
      {
        'amount': '8',
        'condition': 0,
        'type': 'discount',
        'isReceived': type != 'available',
        'isExpired': type == 'expired',
      },
    ];

    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: coupons.length,
      itemBuilder: (context, index) {
        return _buildCouponCard(coupons[index], colorScheme);
      },
    );
  }

  Widget _buildCouponCard(Map<String, dynamic> data, ColorScheme colorScheme) {
    final amount = data['amount'] as String;
    final condition = data['condition'] as int;
    final isReceived = data['isReceived'] as bool;
    final isExpired = data['isExpired'] as bool;

    Color primaryColor = colorScheme.primary; // Green for available/received
    // Color secondaryColor = const Color(0xFF81C784);
    // String btnText = t.coupon.btnReceive;
    Color btnTextColor = colorScheme.onPrimary;
    Color btnBgColor = colorScheme.primary;

    if (isReceived) {
      // btnText = t.coupon.btnUse;
      btnBgColor = colorScheme.surface;
      btnTextColor = colorScheme.primary;
    }

    if (isExpired) {
      primaryColor = colorScheme.outline;
      // secondaryColor = Colors.grey.withValues(alpha: 0.7);
      // btnText = t.coupon.btnExpired;
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
                    Text(
                      t.coupon.unit,
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
                  ],
                ),
                Text(
                  condition == 0
                      ? '满减券\n满0元可用'
                      : t.coupon.condition(amount: condition.toString()),
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
                      Text(
                        t.coupon.discount(amount: amount),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: isExpired
                              ? colorScheme.outline
                              : colorScheme.onSurface,
                        ),
                      ),
                      if (isReceived && !isExpired)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            '满减',
                            style: TextStyle(
                              color: colorScheme.onPrimary,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      if (isReceived && !isExpired)
                        Text(
                          '已领取 / ',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: colorScheme.outline,
                          ),
                        ),
                      if (!isReceived && !isExpired)
                        Text(
                          '未领取 / ',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: colorScheme.outline,
                          ),
                        ),
                      if (isExpired)
                        Text(
                          '已过期 / ',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: colorScheme.outline,
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        t.coupon.validForever,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: colorScheme.outline,
                        ),
                      ),
                      if (!isExpired)
                        SizedBox(
                          height: 28.h,
                          child: ElevatedButton(
                            onPressed: () {},
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
