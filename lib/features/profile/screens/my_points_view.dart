import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/widgets/widgets.dart' as widgets;
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/profile/repositories/points_repository.dart';
import 'package:lunchbox/i18n/translations.g.dart';

class MyPointsView extends ConsumerWidget {
  const MyPointsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(t.points.title),
        centerTitle: true,
        backgroundColor:
            theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(context, ref),
                  SizedBox(height: 16.h),
                  _buildMallBanner(context),
                  SizedBox(height: 16.h),
                  _buildRulesSection(context),
                  SizedBox(height: 16.h),
                  _buildRecordsSection(context, ref),
                ],
              ),
            ),
          ),
          _buildBottomBar(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    final pointsAsync = ref.watch(pointsBalanceProvider);
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.symmetric(vertical: 24.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            t.points.title,
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              pointsAsync.when(
                data: (points) => Text(
                  '$points',
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                loading: () => const widgets.LoadingWidget(),
                error: (_, _) => Text(
                  '0',
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                t.points.unit,
                style: TextStyle(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMallBanner(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Symbols.shopping_bag,
              color: theme.colorScheme.onPrimary,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            t.points.mall,
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              // context.push(AppRoutes.pointsMall); // Uncomment when route is added
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              side: BorderSide(color: theme.colorScheme.onPrimary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
            ),
            child: Text(
              t.points.goExchange,
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRulesSection(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.points.rules,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.h),
          _buildRuleItem(context, Symbols.alarm, t.points.rule1),
          SizedBox(height: 8.h),
          _buildRuleItem(context, Symbols.add_circle, t.points.rule2),
        ],
      ),
    );
  }

  Widget _buildRuleItem(BuildContext context, IconData icon, String text) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: theme.colorScheme.primary, size: 20.sp),
          SizedBox(width: 8.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: theme.textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordsSection(BuildContext context, WidgetRef ref) {
    final recordsAsync = ref.watch(pointsRecordsProvider);
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.points.records,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  _buildTabButton(context, t.points.all, true),
                  SizedBox(width: 8.w),
                  _buildTabButton(context, t.points.earned, false),
                  SizedBox(width: 8.w),
                  _buildTabButton(context, t.points.used, false),
                ],
              ),
            ],
          ),
          SizedBox(height: 32.h),
          Column(
            children: [
              Icon(
                Symbols.star,
                size: 48.sp,
                color: theme.colorScheme.tertiary,
              ),
              SizedBox(height: 8.h),
              Text(
                t.points.noRecords,
                style: TextStyle(color: theme.hintColor, fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildTabButton(BuildContext context, String text, bool isSelected) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isSelected
            ? theme.colorScheme.primary
            : theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          color: isSelected ? theme.colorScheme.onPrimary : theme.hintColor,
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            offset: const Offset(0, -2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                t.points.back,
                style: TextStyle(color: theme.colorScheme.onSurface),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                t.points.goLottery,
                style: TextStyle(color: theme.colorScheme.onPrimary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
