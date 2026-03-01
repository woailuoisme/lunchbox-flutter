import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/order/entities/order_product_model.dart';

/// 订单商品子项组件
/// 展示商品图片、名称、描述、价格和数量
class OrderProductItem extends StatelessWidget {
  const OrderProductItem({
    required this.product,
    this.imageSize = 70.0,
    this.padding,
    super.key,
  });

  final OrderProductModel product;
  final double imageSize;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: padding ?? EdgeInsets.all(16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              product.thumb,
              width: imageSize.w,
              height: imageSize.w,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                width: imageSize.w,
                height: imageSize.w,
                color: theme.disabledColor,
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '¥${product.salePrice}',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                    if (product.quantity > 0)
                      Text(
                        'x${product.quantity}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: theme.hintColor,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
