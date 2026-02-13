import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 邀请规则页面
class InviteRulesView extends StatelessWidget {
  const InviteRulesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      appBar: AppBar(
        title: Text(t.invite.rules.title),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Symbols.more_horiz), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  _buildHeader(colorScheme),
                  SizedBox(height: 16.h),
                  _buildRuleSection(
                    title: t.invite.rules.section1,
                    icon: Symbols.group,
                    color: Colors.blue,
                    rules: [
                      t.invite.rules.rule1,
                      t.invite.rules.rule2,
                      t.invite.rules.rule3,
                      t.invite.rules.rule4,
                      t.invite.rules.rule5,
                    ],
                    colorScheme: colorScheme,
                  ),
                  SizedBox(height: 16.h),
                  _buildRuleSection(
                    title: t.invite.rules.section2,
                    icon: Symbols.card_giftcard,
                    color: Colors.red,
                    rules: [
                      t.invite.rules.reward1,
                      t.invite.rules.reward2,
                      t.invite.rules.reward3,
                      t.invite.rules.reward4,
                      t.invite.rules.reward5,
                    ],
                    colorScheme: colorScheme,
                  ),
                  SizedBox(height: 16.h),
                  _buildRuleSection(
                    title: t.invite.rules.section3,
                    icon: Symbols.warning,
                    color: Colors.amber,
                    rules: [
                      t.invite.rules.note1,
                      t.invite.rules.note2,
                      t.invite.rules.note3,
                      t.invite.rules.note4,
                      t.invite.rules.note5,
                    ],
                    colorScheme: colorScheme,
                  ),
                  SizedBox(height: 16.h),
                  _buildRuleSection(
                    title: t.invite.rules.section4,
                    icon: Symbols.assignment,
                    color: Colors.brown,
                    rules: [
                      t.invite.rules.process1,
                      t.invite.rules.process2,
                      t.invite.rules.process3,
                      t.invite.rules.process4,
                      t.invite.rules.process5,
                    ],
                    colorScheme: colorScheme,
                  ),
                  SizedBox(height: 80.h),
                ],
              ),
            ),
          ),
          _buildBottomButton(colorScheme),
        ],
      ),
    );
  }

  Widget _buildHeader(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            t.invite.rules.title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            '了解邀请规则，轻松获得奖励',
            style: TextStyle(
              fontSize: 12.sp,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRuleSection({
    required String title,
    required IconData icon,
    required Color color,
    required List<String> rules,
    required ColorScheme colorScheme,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 24.sp),
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Divider(
              height: 1,
              color: colorScheme.outline.withValues(alpha: 0.1),
            ),
          ),
          ...rules.map(
            (rule) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: CircleAvatar(radius: 3.r, backgroundColor: color),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      rule,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton(ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 32.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          minimumSize: Size(double.infinity, 50.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Symbols.headset_mic, size: 20.sp),
            SizedBox(width: 8.w),
            Text(
              t.home.grid.service, // Reuse service text
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
