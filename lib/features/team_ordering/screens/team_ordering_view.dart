import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/team_ordering/widgets/team_ordering_advantage_item.dart';
import 'package:lunchbox/features/team_ordering/widgets/team_ordering_bottom_bar.dart';
import 'package:lunchbox/features/team_ordering/widgets/team_ordering_header.dart';
import 'package:lunchbox/features/team_ordering/widgets/team_ordering_process_step.dart';
import 'package:lunchbox/features/team_ordering/widgets/team_ordering_scenario_card.dart';
import 'package:lunchbox/features/team_ordering/widgets/team_ordering_section_title.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 团队用餐页面
///
/// 展示团队订餐服务，包含适用场景、操作流程和服务优势
class TeamOrderingView extends StatelessWidget {
  const TeamOrderingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      appBar: AppBar(
        title: Text(t.teamOrdering.title),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 100.h),
            child: Column(
              children: [
                _buildHeader(),
                _buildScenarios(colorScheme),
                _buildProcess(colorScheme),
                _buildAdvantages(colorScheme),
              ],
            ),
          ),
          _buildBottomButton(),
        ],
      ),
    );
  }

  /// 构建顶部横幅
  Widget _buildHeader() {
    return TeamOrderingHeader(
      title: t.teamOrdering.bannerTitle,
      subtitle: t.teamOrdering.bannerSubtitle,
      tags: [t.teamOrdering.tag1, t.teamOrdering.tag2, t.teamOrdering.tag3],
    );
  }

  /// 构建适用场景
  Widget _buildScenarios(ColorScheme colorScheme) {
    final scenarios = [
      (
        icon: '🍱',
        title: t.teamOrdering.scenarios.team,
        desc: t.teamOrdering.scenarios.teamDesc,
      ),
      (
        icon: '📅',
        title: t.teamOrdering.scenarios.reserve,
        desc: t.teamOrdering.scenarios.reserveDesc,
      ),
      (
        icon: '📋',
        title: t.teamOrdering.scenarios.vip,
        desc: t.teamOrdering.scenarios.vipDesc,
      ),
    ];

    return Column(
      children: [
        TeamOrderingSectionTitle(
          title: t.teamOrdering.scenarios.title,
          subtitle: t.teamOrdering.scenarios.subtitle,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: scenarios
                .map(
                  (s) => Expanded(
                    child: TeamOrderingScenarioCard(
                      icon: s.icon,
                      title: s.title,
                      desc: s.desc,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  /// 构建操作流程
  Widget _buildProcess(ColorScheme colorScheme) {
    final steps = [
      (
        num: '1',
        title: t.teamOrdering.process.step1Title,
        desc: t.teamOrdering.process.step1Desc,
      ),
      (
        num: '2',
        title: t.teamOrdering.process.step2Title,
        desc: t.teamOrdering.process.step2Desc,
      ),
      (
        num: '3',
        title: t.teamOrdering.process.step3Title,
        desc: t.teamOrdering.process.step3Desc,
      ),
    ];

    return Column(
      children: [
        TeamOrderingSectionTitle(
          title: t.teamOrdering.process.title,
          subtitle: t.teamOrdering.process.subtitle,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: steps.asMap().entries.map((entry) {
              final isLast = entry.key == steps.length - 1;
              final step = entry.value;
              return TeamOrderingProcessStep(
                number: step.num,
                title: step.title,
                desc: step.desc,
                isLast: isLast,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  /// 构建服务优势
  Widget _buildAdvantages(ColorScheme colorScheme) {
    final advantages = [
      (
        icon: Symbols.track_changes,
        title: t.teamOrdering.advantages.custom,
        desc: t.teamOrdering.advantages.customDesc,
      ),
      (
        icon: Symbols.alarm,
        title: t.teamOrdering.advantages.reserve,
        desc: t.teamOrdering.advantages.reserveDesc,
      ),
      (
        icon: Symbols.payments,
        title: t.teamOrdering.advantages.price,
        desc: t.teamOrdering.advantages.priceDesc,
      ),
      (
        icon: Symbols.verified_user,
        title: t.teamOrdering.advantages.quality,
        desc: t.teamOrdering.advantages.qualityDesc,
      ),
    ];

    return Column(
      children: [
        TeamOrderingSectionTitle(
          title: t.teamOrdering.advantages.title,
          subtitle: t.teamOrdering.advantages.subtitle,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: advantages
                .map(
                  (a) => TeamOrderingAdvantageItem(
                    icon: a.icon,
                    title: a.title,
                    desc: a.desc,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  /// 构建底部固定按钮
  Widget _buildBottomButton() {
    return TeamOrderingBottomBar(
      buttonText: t.teamOrdering.bookNow,
      onPressed: () {},
    );
  }
}
