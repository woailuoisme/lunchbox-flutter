import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:timelines_plus/timelines_plus.dart';

/// 邀请好友流程步骤组件
/// 使用 timelines_plus 构建水平流程图
class InviteProcessSteps extends StatelessWidget {
  const InviteProcessSteps({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final steps = [
      {
        'icon': Symbols.person_add,
        'title': t.invite.step1,
        'desc': t.invite.step1Desc,
      },
      {
        'icon': Symbols.assignment,
        'title': t.invite.step2,
        'desc': t.invite.step2Desc,
      },
      {
        'icon': Symbols.check_box,
        'title': t.invite.step3,
        'desc': t.invite.step3Desc,
      },
      {
        'icon': Symbols.card_giftcard,
        'title': t.invite.step4,
        'desc': t.invite.step4Desc,
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = constraints.maxWidth / steps.length;
        return SizedBox(
          height: 110.h, // 大幅缩小高度
          child: Timeline.tileBuilder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            theme: TimelineThemeData(
              direction: Axis.horizontal,
              nodePosition: 0, // 强制指示器置顶，消除上方留白
              connectorTheme: ConnectorThemeData(
                space: 30.w,
                thickness: 3.h,
                color: colorScheme.primary.withValues(alpha: 0.1),
              ),
            ),
            builder: TimelineTileBuilder.connected(
              connectionDirection: ConnectionDirection.before,
              itemCount: steps.length,
              itemExtentBuilder: (_, _) => itemWidth,
              contentsBuilder: (context, index) {
                final step = steps[index];
                return Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        step['title']! as String,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 6.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          step['desc']! as String,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: colorScheme.onSurfaceVariant,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
              indicatorBuilder: (context, index) {
                final isLast = index == steps.length - 1;
                final color = isLast
                    ? colorScheme.primary
                    : colorScheme.surface;
                final iconColor = isLast
                    ? colorScheme.onPrimary
                    : colorScheme.primary;

                return Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isLast
                          ? colorScheme.primary
                          : colorScheme.primary.withValues(alpha: 0.2),
                      width: 2.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    steps[index]['icon']! as IconData,
                    size: 22.sp,
                    color: iconColor,
                  ),
                );
              },
              connectorBuilder: (context, index, type) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: SolidLineConnector(
                    color: colorScheme.primary.withValues(alpha: 0.15),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
