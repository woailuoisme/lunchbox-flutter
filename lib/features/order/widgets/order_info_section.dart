import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 订单信息区块组件
/// 带有标题和子项的通用卡片布局
class OrderInfoSection extends StatelessWidget {
  const OrderInfoSection({
    required this.title,
    required this.children,
    this.margin,
    this.padding,
    this.showDivider = true,
    super.key,
  });

  final String title;
  final List<Widget> children;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: padding ?? EdgeInsets.all(16.w),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
          ),
          if (showDivider) Divider(height: 1, color: theme.dividerColor),
          ...children,
        ],
      ),
    );
  }
}
