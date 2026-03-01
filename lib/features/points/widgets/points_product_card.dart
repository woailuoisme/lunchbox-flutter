import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import 'package:lunchbox/features/points/entities/mall_product_model.dart';

/// 积分商城商品卡片组件
class PointsProductCard extends StatelessWidget {
  const PointsProductCard({
    required this.product,
    required this.balance,
    required this.balanceLabel,
    required this.costLabel,
    required this.buttonText,
    this.onExchange,
    super.key,
  });

  /// 商品数据模型
  final MallProductModel product;

  /// 用户当前积分余额
  final int balance;

  /// 余额/面值标签文案
  final String balanceLabel;

  /// 消耗积分文案 (通常包含变量)
  final String costLabel;

  /// 按钮文案
  final String buttonText;

  /// 兑换点击回调
  final VoidCallback? onExchange;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool canAfford = balance >= product.pointsCost;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          // 左侧：商品金额展示与热销标签
          badges.Badge(
            showBadge: product.isHot,
            badgeContent: Text(
              'HOT',
              style: TextStyle(
                color: theme.colorScheme.onError,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.square,
              badgeColor: theme.colorScheme.error,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
                topLeft: Radius.circular(4.r),
                bottomRight: Radius.circular(4.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              elevation: 2,
            ),
            position: badges.BadgePosition.topEnd(top: -10, end: -10),
            child: Container(
              width: 80.w,
              height: 80.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¥${product.amountValue}',
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    balanceLabel,
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16.w),
          // 中间：商品信息
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.titleMedium?.color,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Text(
                  costLabel,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          // 右侧：兑换按钮
          ElevatedButton(
            onPressed: canAfford ? onExchange : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: canAfford
                  ? theme.colorScheme.primary
                  : theme.disabledColor,
              foregroundColor: theme.colorScheme.onPrimary,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              elevation: 0,
            ),
            child: Text(buttonText, style: TextStyle(fontSize: 12.sp)),
          ),
        ],
      ),
    );
  }
}
