import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:timelines_plus/timelines_plus.dart';

/// 合作伙伴加盟条件项
class PartnerConditionItem extends StatelessWidget {
  const PartnerConditionItem({
    super.key,
    required this.condition,
    this.isLast = false,
  });
  final String condition;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        nodePosition: 0,
        color: theme.colorScheme.primary,
        indicatorTheme: IndicatorThemeData(position: 0, size: 20.w),
        connectorTheme: ConnectorThemeData(
          thickness: 2.w,
          color: theme.dividerColor,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.after,
        itemCount: 1,
        contentsBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 12.w, bottom: isLast ? 0 : 24.h),
            child: Text(
              condition,
              style: TextStyle(
                fontSize: 14.sp,
                color: theme.textTheme.bodyMedium?.color,
              ),
            ),
          );
        },
        indicatorBuilder: (context, index) {
          return DotIndicator(
            color: theme.colorScheme.primary,
            child: Icon(
              Symbols.check,
              size: 14.sp,
              color: theme.colorScheme.onPrimary,
            ),
          );
        },
        connectorBuilder: (context, index, type) {
          return isLast
              ? const TransparentConnector()
              : SolidLineConnector(color: theme.dividerColor);
        },
      ),
    );
  }
}

/// 合作伙伴加盟条件列表
class PartnerConditionList extends StatelessWidget {
  const PartnerConditionList({super.key, required this.conditions});
  final List<String> conditions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: conditions.asMap().entries.map((entry) {
        final index = entry.key;
        final condition = entry.value;
        return PartnerConditionItem(
          condition: condition,
          isLast: index == conditions.length - 1,
        );
      }).toList(),
    );
  }
}
