import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines_plus/timelines_plus.dart';

/// 合作伙伴流程步骤项
class PartnerProcessStep extends StatelessWidget {
  const PartnerProcessStep({
    super.key,
    required this.step,
    required this.title,
    required this.desc,
    this.isLast = false,
  });
  final String step;
  final String title;
  final String desc;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        nodePosition: 0,
        color: theme.colorScheme.primary,
        indicatorTheme: IndicatorThemeData(position: 0, size: 24.w),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.titleMedium?.color,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  desc,
                  style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
                ),
              ],
            ),
          );
        },
        indicatorBuilder: (context, index) {
          return DotIndicator(
            color: theme.colorScheme.primary,
            child: Center(
              child: Text(
                step,
                style: TextStyle(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 12.sp,
                ),
              ),
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

/// 合作伙伴流程列表
class PartnerProcessList extends StatelessWidget {
  const PartnerProcessList({super.key, required this.processes});
  final List<Map<String, String>> processes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: processes.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return PartnerProcessStep(
          step: item['step']!,
          title: item['title']!,
          desc: item['desc']!,
          isLast: index == processes.length - 1,
        );
      }).toList(),
    );
  }
}
