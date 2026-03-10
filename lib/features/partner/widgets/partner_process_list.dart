import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines_plus/timelines_plus.dart';

/// 合作伙伴流程列表
class PartnerProcessList extends StatelessWidget {
  const PartnerProcessList({super.key, required this.processes});
  final List<Map<String, String>> processes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          color: theme.colorScheme.primary,
          indicatorTheme: IndicatorThemeData(position: 0.5, size: 28.w),
          connectorTheme: ConnectorThemeData(
            thickness: 2.w,
            color: theme.colorScheme.primary.withValues(alpha: 0.2),
          ),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.after,
          itemCount: processes.length,
          contentsBuilder: (context, index) {
            final item = processes[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title']!,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    item['desc']!,
                    style: TextStyle(
                      fontSize: 13.sp,
                      height: 1.4,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            );
          },
          indicatorBuilder: (context, index) {
            return Container(
              width: 28.w,
              height: 28.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: theme.colorScheme.primary,
                  width: 2.w,
                ),
              ),
              child: Center(
                child: Text(
                  processes[index]['step']!,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
          connectorBuilder: (context, index, type) {
            final isLast = index == processes.length - 1;
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
