import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lunchbox/features/my_coupons/entities/user_coupon_model.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 优惠券卡片组件
/// 展示优惠券的面额、使用门槛、名称、有效期和状态
class CouponCard extends StatelessWidget {
  const CouponCard({
    required this.coupon,
    required this.isAvailable,
    super.key,
  });

  final UserCouponModel coupon;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
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
          // 左侧：面额/折扣信息
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
                      t.coupon.unit,
                      style: TextStyle(
                        color: contentColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      coupon.rule.reduceAmount?.toString() ??
                          coupon.rule.discountRate?.toString() ??
                          '0',
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
                  coupon.rule.minSpendAmount != null
                      ? '满${coupon.rule.minSpendAmount}元可用'
                      : '无门槛',
                  style: TextStyle(
                    color: contentColor.withValues(alpha: 0.8),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          // 右侧：详细信息
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coupon.name,
                    style: TextStyle(
                      color: contentColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    coupon.endAt != null
                        ? '${t.coupon.expiryPrefix}${DateFormat('yyyy-MM-dd').format(DateTime.parse(coupon.endAt!))}'
                        : '永久有效',
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
                      isAvailable
                          ? t.coupon.statusAvailable
                          : t.coupon.statusUnavailable,
                      style: TextStyle(color: contentColor, fontSize: 10.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 右侧圆孔切口装饰
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
