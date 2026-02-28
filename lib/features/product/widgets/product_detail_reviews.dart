import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/product/entities/product_detail_model.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 产品评论区域
class ProductDetailReviews extends StatelessWidget {
  const ProductDetailReviews({required this.product, super.key});

  final ProductDetailModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final reviews = product.comments;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${t.product.reviews} (${reviews.length})',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            if (reviews.isNotEmpty)
              Row(
                children: [
                  Icon(Icons.star, size: 16.sp, color: const Color(0xFFFFC107)),
                  SizedBox(width: 4.w),
                  Text(
                    '5.0',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12.sp,
                    color: theme.hintColor,
                  ),
                ],
              ),
          ],
        ),
        SizedBox(height: 16.h),
        if (reviews.isEmpty)
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: Text(
                t.product.noReviews,
                style: TextStyle(color: theme.hintColor, fontSize: 14.sp),
              ),
            ),
          )
        else
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: reviews.length > 2 ? 2 : reviews.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              final review = reviews[index];
              return Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16.r,
                              backgroundColor: theme.colorScheme.primary
                                  .withValues(alpha: 0.1),
                              child: Text(
                                review.user.name.characters.isNotEmpty
                                    ? review.user.name.characters.first
                                    : '?',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    review.user.name,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: theme.colorScheme.onSurface,
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(
                                      5,
                                      (i) => Icon(
                                        Icons.star,
                                        size: 10.sp,
                                        color: i < review.rating
                                            ? const Color(0xFFFFC107)
                                            : theme.disabledColor.withValues(
                                                alpha: 0.2,
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              review.createdAtHuman,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: theme.hintColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          review.content,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: theme.colorScheme.onSurfaceVariant,
                            height: 1.5,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                  .animate()
                  .fadeIn(delay: (300 + index * 100).ms)
                  .slideY(begin: 0.1, end: 0);
            },
          ),
        if (reviews.isNotEmpty) ...[
          SizedBox(height: 12.h),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    t.product.viewAllReviews,
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 18.sp,
                    color: theme.colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
