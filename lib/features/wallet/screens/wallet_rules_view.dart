import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:timelines_plus/timelines_plus.dart';

/// 钱包规则页面
class WalletRulesView extends StatelessWidget {
  const WalletRulesView({super.key});

  /// 构建钱包规则页面整体布局
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    // 获取翻译内容
    final rules = t.profile.walletPage.rules;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      appBar: AppBar(
        title: Text(rules.title),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildHeader(
              colorScheme: colorScheme,
              title: rules.headerTitle,
              desc: rules.headerDesc,
            ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1, end: 0),
            SizedBox(height: 16.h),
            _buildRuleCard(
                  colorScheme: colorScheme,
                  title: rules.rechargeRules.title,
                  rules: rules.rechargeRules.items,
                )
                .animate()
                .fadeIn(delay: 100.ms, duration: 400.ms)
                .slideY(begin: 0.1, end: 0),
            SizedBox(height: 16.h),
            _buildRuleCard(
                  colorScheme: colorScheme,
                  title: rules.usageInstructions.title,
                  rules: rules.usageInstructions.items,
                )
                .animate()
                .fadeIn(delay: 200.ms, duration: 400.ms)
                .slideY(begin: 0.1, end: 0),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  /// 构建顶部说明区域
  Widget _buildHeader({
    required ColorScheme colorScheme,
    required String title,
    required String desc,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      alignment: Alignment.center,
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
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary.withValues(alpha: 0.1),
                  colorScheme.primary.withValues(alpha: 0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Symbols.assignment,
              color: colorScheme.primary,
              size: 32.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            desc,
            style: TextStyle(
              fontSize: 13.sp,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  /// 构建规则卡片
  Widget _buildRuleCard({
    required ColorScheme colorScheme,
    required String title,
    required List<String> rules,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 8.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
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
          SizedBox(height: 8.h),
          FixedTimeline.tileBuilder(
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
                  padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
                  child: Text(
                    rules[index],
                    style: TextStyle(
                      fontSize: 14.sp,
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
              connectorBuilder: (_, index, __) => SolidLineConnector(
                color: colorScheme.outlineVariant.withValues(alpha: 0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
