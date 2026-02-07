import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';

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
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: Text(t.coupon.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFFFF5252),
          unselectedLabelColor: Colors.black54,
          indicatorColor: const Color(0xFFFF5252),
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(text: t.coupon.tabs.available),
            Tab(text: t.coupon.tabs.received),
            Tab(text: t.coupon.tabs.expired),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
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
        return _buildCouponCard(coupons[index]);
      },
    );
  }

  Widget _buildCouponCard(Map<String, dynamic> data) {
    final amount = data['amount'] as String;
    final condition = data['condition'] as int;
    final isReceived = data['isReceived'] as bool;
    final isExpired = data['isExpired'] as bool;

    Color primaryColor = const Color(
      0xFF66BB6A,
    ); // Green for available/received
    // Color secondaryColor = const Color(0xFF81C784);
    // String btnText = t.coupon.btnReceive;
    Color btnTextColor = Colors.white;
    Color btnBgColor = const Color(
      0xFFFF5252,
    ); // Use standard red for action button

    if (isReceived) {
      // btnText = t.coupon.btnUse;
      btnBgColor = Colors.white;
      btnTextColor = const Color(0xFFFF5252);
    }

    if (isExpired) {
      primaryColor = Colors.grey;
      // secondaryColor = Colors.grey.withValues(alpha: 0.7);
      // btnText = t.coupon.btnExpired;
      btnBgColor = Colors.transparent;
      btnTextColor = Colors.grey;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
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
                          color: isExpired ? Colors.grey : Colors.black87,
                        ),
                      ),
                      if (isReceived && !isExpired)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF5252),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            '满减',
                            style: TextStyle(
                              color: Colors.white,
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
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                      if (!isReceived && !isExpired)
                        Text(
                          '未领取 / ',
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                      if (isExpired)
                        Text(
                          '已过期 / ',
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        t.coupon.validForever,
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                      if (!isExpired)
                        SizedBox(
                          height: 28.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isReceived
                                  ? Colors.white
                                  : btnBgColor,
                              foregroundColor: btnTextColor,
                              elevation: 0,
                              side: isReceived
                                  ? const BorderSide(color: Color(0xFFE0E0E0))
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
                                color: isReceived ? Colors.grey : Colors.white,
                              ),
                            ),
                          ),
                        )
                      else
                        Text(
                          '已过期',
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
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
