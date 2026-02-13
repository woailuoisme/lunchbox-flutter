import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';

/// 邀请好友页面
class InviteFriendsView extends StatelessWidget {
  const InviteFriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(t.invite.title),
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.w),
            child: TextButton.icon(
              onPressed: () {
                context.push('${AppRoutes.invite}/${AppRoutes.inviteRules}');
              },
              icon: Icon(
                Symbols.assignment,
                color: colorScheme.onPrimary,
                size: 16.sp,
              ),
              label: Text(
                t.invite.ruleBtn,
                style: TextStyle(color: colorScheme.onPrimary, fontSize: 14.sp),
              ),
              style: TextButton.styleFrom(
                backgroundColor: colorScheme.onPrimary.withValues(alpha: 0.2),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
          ),
        ],
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [colorScheme.primary, colorScheme.primaryContainer],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      t.invite.title,
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    _buildRewardCard(colorScheme),
                    SizedBox(height: 16.h),
                    _buildInviteCode(colorScheme),
                    SizedBox(height: 32.h),
                    _buildBottomPanel(context, colorScheme),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardCard(ColorScheme colorScheme) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.onPrimary.withValues(alpha: 0.15),
            colorScheme.onPrimary.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colorScheme.onPrimary.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: colorScheme.secondary,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '得',
              style: TextStyle(
                color: colorScheme.onSecondary,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Container(
            width: 1.w,
            height: 40.h,
            color: colorScheme.onPrimary.withValues(alpha: 0.3),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      t.invite.rewardTitle,
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      t.invite.rewardSubtitle,
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  t.invite.rewardDesc,
                  style: TextStyle(
                    color: colorScheme.onPrimary.withValues(alpha: 0.7),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInviteCode(ColorScheme colorScheme) {
    const code = '69875AB30ED339.95006775';
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.onPrimary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Text(
            t.invite.myCode,
            style: TextStyle(
              color: colorScheme.onPrimary.withValues(alpha: 0.7),
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  code,
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(const ClipboardData(text: code));
                  // Show toast or snackbar
                },
                child: Icon(
                  Symbols.content_copy,
                  color: colorScheme.onPrimary.withValues(alpha: 0.7),
                  size: 16.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPanel(BuildContext context, ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 48.h),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.secondary,
                foregroundColor: colorScheme.onSecondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Symbols.chat, size: 24.sp),
                  SizedBox(width: 8.w),
                  Text(
                    t.invite.btnInvite,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32.h),
          Text(
            t.invite.processTitle,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 24.h),
          _buildProcessSteps(colorScheme),
          SizedBox(height: 32.h),
          _buildStats(colorScheme),
        ],
      ),
    );
  }

  Widget _buildProcessSteps(ColorScheme colorScheme) {
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: steps.asMap().entries.map((entry) {
        final index = entry.key;
        final step = entry.value;
        final isLast = index == steps.length - 1;

        return Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                        color: index == 3
                            ? colorScheme.primary
                            : colorScheme.primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        step['icon']! as IconData,
                        color: index == 3
                            ? colorScheme.onPrimary
                            : colorScheme.onPrimaryContainer,
                        size: 24.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      step['title']! as String,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      step['desc']! as String,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Icon(
                  Symbols.arrow_forward,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                  size: 16.sp,
                ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStats(ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.invite.stats,
            style: TextStyle(
              fontSize: 14.sp,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      t.invite.invitedCount,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1.w,
                height: 30.h,
                color: colorScheme.outline.withValues(alpha: 0.2),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      t.invite.rewardAmount,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
