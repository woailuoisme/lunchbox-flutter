import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 订单详情信息行组件
/// 展示标签和对应的数值
class OrderInfoRow extends StatelessWidget {
  const OrderInfoRow({
    required this.label,
    required this.value,
    this.padding,
    this.isCopyable = false,
    super.key,
  });

  final String label;
  final String value;
  final EdgeInsetsGeometry? padding;
  final bool isCopyable;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    Widget content = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14.sp, color: theme.hintColor),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              if (isCopyable) ...[
                SizedBox(width: 4.w),
                Icon(
                  Icons.copy_rounded,
                  size: 14.sp,
                  color: theme.colorScheme.primary,
                ),
              ],
            ],
          ),
        ),
      ],
    );

    if (isCopyable) {
      content = GestureDetector(
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: value));
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('已复制'), // using simple hardcoded text for visual effect when there's no general copy string
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        behavior: HitTestBehavior.opaque,
        child: content,
      );
    }

    return Padding(
      padding: padding ?? EdgeInsets.only(left: 16.w, right: 16.w, bottom: 12.h),
      child: content,
    );
  }
}
