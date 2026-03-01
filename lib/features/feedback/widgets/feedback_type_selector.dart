import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

class FeedbackTypeSelector extends StatelessWidget {
  const FeedbackTypeSelector({
    super.key,
    required this.selectedIndex,
    required this.onTypeSelected,
  });
  final int selectedIndex;
  final ValueChanged<int> onTypeSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Map<String, dynamic>> types = [
      {
        'icon': Symbols.block,
        'label': t.feedback.errorReport,
        'color': theme.colorScheme.error,
      },
      {
        'icon': Symbols.lightbulb,
        'label': t.feedback.suggestion,
        'color': theme.colorScheme.tertiary,
      },
      {
        'icon': Symbols.sentiment_dissatisfied,
        'label': t.feedback.complaint,
        'color': theme.colorScheme.secondary,
      },
      {
        'icon': Symbols.help,
        'label': t.feedback.other,
        'color': theme.colorScheme.primary,
      },
    ];

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.feedback.selectType,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.w,
              crossAxisSpacing: 16.w,
              childAspectRatio: 2.5,
            ),
            itemCount: types.length,
            itemBuilder: (context, index) {
              final type = types[index];
              final isSelected = selectedIndex == index;
              return InkWell(
                onTap: () => onTypeSelected(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? theme.colorScheme.primaryContainer.withValues(
                            alpha: 0.3,
                          )
                        : theme.colorScheme.surfaceContainerHighest.withValues(
                            alpha: 0.3,
                          ),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : Colors.transparent,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        type['icon'] as IconData,
                        color: type['color'] as Color,
                        size: 20.sp,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        type['label'] as String,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
