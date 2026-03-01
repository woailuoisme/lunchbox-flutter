import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

class FeedbackImageUpload extends StatelessWidget {
  const FeedbackImageUpload({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.feedback.uploadScreenshot,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.3,
              ),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: theme.dividerColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Symbols.add, color: theme.hintColor),
                SizedBox(height: 4.h),
                Text(
                  t.feedback.addImage,
                  style: TextStyle(fontSize: 10.sp, color: theme.hintColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            t.feedback.uploadLimitHint,
            style: TextStyle(fontSize: 10.sp, color: theme.hintColor),
          ),
        ],
      ),
    );
  }
}
