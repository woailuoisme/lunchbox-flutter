import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 订单操作按钮组件
/// 展示带有边框和圆角的交互按钮
class OrderActionButton extends StatelessWidget {
  const OrderActionButton({
    required this.text,
    required this.onTap,
    this.textColor,
    this.borderColor,
    this.padding,
    this.borderRadius,
    this.fontSize,
    super.key,
  });

  final String text;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveTextColor = textColor ?? theme.hintColor;
    final effectiveBorderColor = borderColor ?? theme.dividerColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          border: Border.all(color: effectiveBorderColor, width: 1),
          borderRadius: BorderRadius.circular(borderRadius?.r ?? 16.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize ?? 12.sp,
            color: effectiveTextColor,
          ),
        ),
      ),
    );
  }
}
