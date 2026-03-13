import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/invite/widgets/invite_rule_section.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

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
                  InviteRuleSection(
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
                  ),
                  InviteRuleSection(
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
                  ),
                  InviteRuleSection(
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
                  ),
                  InviteRuleSection(
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
                  ),
                ],
              ),
            ),
          ),
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
}
