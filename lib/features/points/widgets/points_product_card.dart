import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/points/entities/mall_product_response.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 积分商城商品卡片
/// 优化为更适合网格展示的布局
class PointsProductCard extends StatelessWidget {
  const PointsProductCard({
    required this.product,
    required this.balance,
    required this.balanceLabel,
    required this.costLabel,
    required this.buttonText,
    this.isRedeeming = false,
    this.onExchange,
    super.key,
  });

  final MallProductResponse product;
  final int balance;
  final String balanceLabel;
  final String costLabel;
  final String buttonText;
  final bool isRedeeming;
  final VoidCallback? onExchange;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final bool canAfford = balance >= product.requiredPoints;

    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(
          color: theme.dividerColor.withValues(alpha: 0.1),
          width: 0.5,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 顶部面值区域 (渐变背景)
            _buildTopBadge(context),
            //底部信息区域
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.titleSmall?.color,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                costLabel,
                                style: TextStyle(
                                  color: colorScheme.primary,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        _buildActionButton(context, canAfford),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBadge(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary.withValues(alpha: 0.08),
            colorScheme.primaryContainer.withValues(alpha: 0.04),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Symbols.sell,
            size: 60.sp,
            color: colorScheme.primary.withValues(alpha: 0.03),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                product.content,
                style: TextStyle(
                  color: colorScheme.primary,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                ),
              ),
              Text(
                balanceLabel,
                style: TextStyle(
                  color: colorScheme.primary.withValues(alpha: 0.7),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, bool canAfford) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      height: 28.h,
      child: ElevatedButton(
        onPressed: (canAfford && !isRedeeming) ? onExchange : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: canAfford
              ? colorScheme.primary
              : theme.disabledColor.withValues(alpha: 0.1),
          foregroundColor: canAfford ? colorScheme.onPrimary : theme.hintColor,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
          elevation: 0,
        ),
        child: isRedeeming
            ? SizedBox(
                width: 12.sp,
                height: 12.sp,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    canAfford ? colorScheme.onPrimary : theme.hintColor,
                  ),
                ),
              )
            : Text(
                buttonText,
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
