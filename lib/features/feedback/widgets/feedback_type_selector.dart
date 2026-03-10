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
    final isDark = theme.brightness == Brightness.dark;

    final List<Map<String, dynamic>> types = [
      {
        'icon': Symbols.bug_report,
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
          Row(
            children: [
              Icon(
                Symbols.category,
                size: 20.sp,
                color: theme.colorScheme.primary,
              ),
              SizedBox(width: 8.w),
              Text(
                t.feedback.selectType,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.titleMedium?.color,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 10.w,
              childAspectRatio: 2.4,
            ),
            itemCount: types.length,
            itemBuilder: (context, index) {
              final type = types[index];
              final isSelected = selectedIndex == index;
              final typeColor = type['color'] as Color;
              final selectedColor = theme.colorScheme.primary;

              return AnimatedScale(
                scale: isSelected ? 1.02 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: InkWell(
                  onTap: () => onTypeSelected(index),
                  borderRadius: BorderRadius.circular(12.r),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? selectedColor.withValues(
                              alpha: isDark ? 0.15 : 0.08,
                            )
                          : theme.colorScheme.surfaceContainerHighest
                                .withValues(alpha: isDark ? 0.3 : 0.5),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: isSelected ? selectedColor : Colors.transparent,
                        width: 1.5,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: selectedColor.withValues(alpha: 0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? typeColor.withValues(alpha: 0.12)
                                : theme.colorScheme.surface.withValues(
                                    alpha: 0.5,
                                  ),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            type['icon'] as IconData,
                            color: isSelected ? typeColor : theme.hintColor,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            type['label'] as String,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              color: isSelected
                                  ? theme.colorScheme.onSurface
                                  : theme.hintColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isSelected)
                          Icon(
                            Symbols.check_circle,
                            size: 14.sp,
                            color: selectedColor,
                          ),
                      ],
                    ),
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
