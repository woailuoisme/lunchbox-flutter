import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/coupons/entities/coupon_model.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 优惠券卡片组件
class CouponCard extends StatelessWidget {
  const CouponCard({
    super.key,
    required this.coupon,
    required this.viewType,
    this.onActionPressed,
    this.isLoading = false,
  });
  final CouponModel coupon;
  final String viewType; // 'available', 'received', 'expired'
  final VoidCallback? onActionPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
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

    // 本地时间有效性校验
    final now = DateTime.now();
    bool isNotStarted = false;
    if (coupon.startAt != null) {
      final start = DateTime.tryParse(coupon.startAt!);
      if (start != null && now.isBefore(start)) {
        isNotStarted = true;
      }
    }

    bool localExpired = false;
    if (coupon.endAt != null) {
      final end = DateTime.tryParse(coupon.endAt!);
      if (end != null && now.isAfter(end)) {
        localExpired = true;
      }
    }

    final actualExpired = isExpired || localExpired;

    if (actualExpired) {
      primaryColor = colorScheme.outline;
      btnBgColor = Colors.transparent;
      btnTextColor = colorScheme.outline;
    }

    // 生成有效期显示文本
    String validTimeText;
    final startDate = coupon.startAt?.split(' ').first;
    final endDate = coupon.endAt?.split(' ').first;
    if (startDate != null && endDate != null) {
      validTimeText = '$startDate 至 $endDate';
    } else if (startDate != null) {
      validTimeText = '$startDate 起有效';
    } else if (endDate != null) {
      validTimeText = '有效期至 $endDate';
    } else {
      validTimeText = t.coupon.validForever; // 都不存在则展示'长期有效/不限制时间'
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
                            color: actualExpired
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
                            color: actualExpired
                                ? colorScheme.outline.withValues(alpha: 0.1)
                                : colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            '满减',
                            style: TextStyle(
                              color: actualExpired
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
                        validTimeText,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: colorScheme.outline,
                        ),
                      ),
                      if (!actualExpired)
                        SizedBox(
                          height: 28.h,
                          child: ElevatedButton(
                            onPressed: (isReceived || isLoading || isNotStarted)
                                ? null
                                : onActionPressed,
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
                            child: isLoading
                                ? SizedBox(
                                    width: 16.w,
                                    height: 16.w,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: isReceived
                                          ? colorScheme.outline
                                          : colorScheme.onPrimary,
                                    ),
                                  )
                                : Text(
                                    isReceived
                                        ? '已领取'
                                        : (isNotStarted ? '未开始' : '立即领取'),
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
