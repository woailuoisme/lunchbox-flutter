import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/feedback/widgets/feedback_image_upload.dart';
import 'package:lunchbox/features/order/entities/order_product_model.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

class OrderReviewProductCard extends StatelessWidget {
  const OrderReviewProductCard({
    super.key,
    required this.product,
    required this.controller,
    required this.initialRating,
    required this.onRatingChanged,
    required this.onImagesChanged,
  });

  final OrderProductModel product;
  final TextEditingController controller;
  final double initialRating;
  final ValueChanged<double> onRatingChanged;
  final ValueChanged<List<File>> onImagesChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: isDark ? 0.1 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 商品信息行
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  product.thumb,
                  width: 50.w,
                  height: 50.w,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    width: 50.w,
                    height: 50.w,
                    color: theme.dividerColor.withValues(alpha: 0.1),
                    child: Icon(
                      Symbols.fastfood,
                      size: 24.sp,
                      color: theme.hintColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Divider(height: 24.h),

          // 评分行
          Row(
            children: [
              Text(
                t.order.review.rating,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 16.w),
              RatingBar.builder(
                initialRating: initialRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 28.sp,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                itemBuilder: (context, _) =>
                    const Icon(Symbols.star, color: Colors.amber, fill: 1),
                onRatingUpdate: onRatingChanged,
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // 评价内容输入
          TextField(
            controller: controller,
            maxLines: 5,
            maxLength: 256,
            style: TextStyle(fontSize: 14.sp, height: 1.5),
            decoration: InputDecoration(
              hintText: t.order.review.contentHint,
              hintStyle: TextStyle(fontSize: 13.sp, color: theme.hintColor),
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.2,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: theme.dividerColor.withValues(alpha: 0.1),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: theme.dividerColor.withValues(alpha: 0.1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary.withValues(alpha: 0.5),
                ),
              ),
              contentPadding: EdgeInsets.all(12.w),
              counterStyle: TextStyle(fontSize: 10.sp, color: theme.hintColor),
            ),
          ),

          SizedBox(height: 16.h),

          // 图片上传
          FeedbackImageUpload(onImagesChanged: onImagesChanged),
        ],
      ),
    );
  }
}
