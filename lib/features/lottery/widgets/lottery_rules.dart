import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:timelines_plus/timelines_plus.dart';

/// 抽奖规则组件
/// 使用时间轴形式展示活动规则
class LotteryRules extends StatelessWidget {
  const LotteryRules({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final rules = t.lottery.rulesList;

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
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Symbols.description,
                    color: colorScheme.primary,
                    size: 24.w,
                    fill: 1.0,
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  t.lottery.rules,
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
            padding: EdgeInsets.only(bottom: 10.h, left: 10.w),
            child: FixedTimeline.tileBuilder(
              theme: TimelineThemeData(
                nodePosition: 0,
                color: colorScheme.primary,
                indicatorTheme: IndicatorThemeData(position: 0.5, size: 10.w),
                connectorTheme: ConnectorThemeData(
                  thickness: 1.5.w,
                  color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
              builder: TimelineTileBuilder.connected(
                connectionDirection: ConnectionDirection.after,
                itemCount: rules.length,
                contentsBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      top: 12.h,
                      bottom: 12.h,
                    ),
                    child: Text(
                      rules[index],
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                  );
                },
                indicatorBuilder: (context, index) {
                  return DotIndicator(
                    size: 8.w,
                    color: colorScheme.primary.withValues(alpha: 0.8),
                    border: Border.all(
                      color: colorScheme.primary.withValues(alpha: 0.2),
                      width: 2.w,
                    ),
                  );
                },
                connectorBuilder: (context, index, type) => SolidLineConnector(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                ),
              ),
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
