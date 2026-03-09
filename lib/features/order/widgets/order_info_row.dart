import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/services/toast_service.dart';

/// 订单详情信息行组件
/// 展示标签和对应的数值
class OrderInfoRow extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
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
            ref.read(toastServiceProvider).showInfo('已复制', context: context);
          }
        },
        behavior: HitTestBehavior.opaque,
        child: content,
      );
    }

    return Padding(
      padding:
          padding ?? EdgeInsets.only(left: 16.w, right: 16.w, bottom: 12.h),
      child: content,
    );
  }
}
