import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/product/entities/product_detail_model.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 产品详情描述部分
class ProductDetailDescription extends StatelessWidget {
  const ProductDetailDescription({required this.product, super.key});

  final ProductDetailModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.product.detail,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          product.description.isEmpty
              ? t.product.noDescription
              : product.description,
          style: TextStyle(
            fontSize: 15.sp,
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.6,
          ),
        ),
      ],
    ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1, end: 0);
  }
}
