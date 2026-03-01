import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

class FeedbackHeader extends StatelessWidget {
  const FeedbackHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          Icon(
            Symbols.edit_note,
            size: 48.sp,
            color: theme.colorScheme.primary.withValues(alpha: 0.7),
          ),
          SizedBox(height: 8.h),
          Text(
            t.feedback.title,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h),
          Text(
            t.feedback.subtitle,
            style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
          ),
        ],
      ),
    );
  }
}
