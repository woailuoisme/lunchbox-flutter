import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 奖品说明列表组件
/// 使用可展开面板展示所有奖品
class LotteryPrizeList extends StatelessWidget {
  const LotteryPrizeList({required this.prizes, super.key});

  final List<String> prizes;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ExpandableNotifier(
        initialExpanded: true,
        child: ExpandablePanel(
          header: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Colors.amber.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Symbols.trophy,
                    color: Colors.amber,
                    size: 24.w,
                    fill: 1.0,
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  t.lottery.prizeListTitle,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          collapsed: const SizedBox.shrink(),
          expanded: Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: prizes.map((prize) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: colorScheme.outline.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Symbols.star,
                        size: 16.w,
                        color: Colors.orange,
                        fill: 1.0,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        prize,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          theme: ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
            hasIcon: true,
            iconColor: colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
