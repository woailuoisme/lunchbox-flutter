import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:timelines_plus/timelines_plus.dart';

/// 合作伙伴加盟条件列表
class PartnerConditionList extends StatelessWidget {
  const PartnerConditionList({super.key, required this.conditions});
  final List<String> conditions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          color: theme.colorScheme.primary,
          indicatorTheme: IndicatorThemeData(position: 0.5, size: 16.w),
          connectorTheme: ConnectorThemeData(
            thickness: 2.w,
            color: theme.colorScheme.primary.withValues(alpha: 0.2),
          ),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.after,
          itemCount: conditions.length,
          contentsBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    conditions[index],
                    style: TextStyle(
                      fontSize: 14.sp,
                      height: 1.5,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            );
          },
          indicatorBuilder: (context, index) {
            return Container(
              width: 16.w,
              height: 16.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.primaryContainer,
              ),
              child: Icon(
                Symbols.check,
                size: 10.sp,
                color: theme.colorScheme.primary,
              ),
            );
          },
          connectorBuilder: (context, index, type) {
            final isLast = index == conditions.length - 1;
            return isLast
                ? const TransparentConnector()
                : SolidLineConnector(
                    color: theme.colorScheme.primary.withValues(alpha: 0.2),
                  );
          },
        ),
      ),
    );
  }
}
