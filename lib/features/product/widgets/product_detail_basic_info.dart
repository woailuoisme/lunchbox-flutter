import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/product/entities/product_detail_model.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 产品基本信息部分
class ProductDetailBasicInfo extends StatelessWidget {
  const ProductDetailBasicInfo({required this.product, super.key});

  final ProductDetailModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasDiscount =
        product.originalPrice != null && product.originalPrice! > product.price;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasDiscount)
          Row(
            children: [
              _ProductDetailTag(
                text: t.product.promotion,
                color: theme.colorScheme.tertiary,
              ).animate().scale(),
            ],
          ),
        if (hasDiscount) SizedBox(height: 12.h),

        // 产品名称
        Text(
          product.name,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w800,
            color: theme.colorScheme.onSurface,
            letterSpacing: -0.5,
            height: 1.2,
          ),
        ).animate().fadeIn().slideX(begin: -0.1, end: 0),
        SizedBox(height: 12.h),

        // 价格和销量
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '¥',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.error,
              ),
            ),
            SizedBox(width: 2.w),
            Text(
              product.price.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w900,
                color: theme.colorScheme.error,
                height: 1.0,
              ),
            ),
            if (hasDiscount) ...[
              SizedBox(width: 12.w),
              Text(
                '¥${product.originalPrice!.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: theme.hintColor,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: theme.colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  '${((1 - product.price / product.originalPrice!) * 100).round()}% OFF',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: theme.colorScheme.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ).animate().fadeIn(delay: 100.ms),
        SizedBox(height: 16.h),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Symbols.sell, size: 16.sp, color: theme.colorScheme.primary),
              SizedBox(width: 8.w),
              Text(
                '${t.product.monthlySales} ${product.sales}',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(width: 16.w),
              Container(width: 1, height: 12.h, color: theme.dividerColor),
              SizedBox(width: 16.w),
              Text(
                product.isEnabled ? t.product.stockFull : t.device.soldOut,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: product.isEnabled
                      ? theme.colorScheme.onSurfaceVariant
                      : theme.colorScheme.error,
                  fontWeight: product.isEnabled
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 200.ms),
      ],
    );
  }
}

/// 产品标签（例如促销、打折等）
class _ProductDetailTag extends StatelessWidget {
  const _ProductDetailTag({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
