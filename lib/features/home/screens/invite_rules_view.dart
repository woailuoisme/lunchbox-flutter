import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 邀请规则页面
class InviteRulesView extends StatelessWidget {
  const InviteRulesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: Text(t.invite.rules.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  _buildHeader(),
                  SizedBox(height: 16.h),
                  _buildRuleSection(
                    title: t.invite.rules.section1,
                    icon: Icons.people,
                    color: Colors.blue,
                    rules: [
                      t.invite.rules.rule1,
                      t.invite.rules.rule2,
                      t.invite.rules.rule3,
                      t.invite.rules.rule4,
                      t.invite.rules.rule5,
                    ],
                  ),
                  SizedBox(height: 16.h),
                  _buildRuleSection(
                    title: t.invite.rules.section2,
                    icon: Icons.card_giftcard,
                    color: Colors.red,
                    rules: [
                      t.invite.rules.reward1,
                      t.invite.rules.reward2,
                      t.invite.rules.reward3,
                      t.invite.rules.reward4,
                      t.invite.rules.reward5,
                    ],
                  ),
                  SizedBox(height: 16.h),
                  _buildRuleSection(
                    title: t.invite.rules.section3,
                    icon: Icons.warning_amber_rounded,
                    color: Colors.amber,
                    rules: [
                      t.invite.rules.note1,
                      t.invite.rules.note2,
                      t.invite.rules.note3,
                      t.invite.rules.note4,
                      t.invite.rules.note5,
                    ],
                  ),
                  SizedBox(height: 16.h),
                  _buildRuleSection(
                    title: t.invite.rules.section4,
                    icon: Icons.assignment,
                    color: Colors.brown,
                    rules: [
                      t.invite.rules.process1,
                      t.invite.rules.process2,
                      t.invite.rules.process3,
                      t.invite.rules.process4,
                      t.invite.rules.process5,
                    ],
                  ),
                  SizedBox(height: 80.h),
                ],
              ),
            ),
          ),
          _buildBottomButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
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
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            '了解邀请规则，轻松获得奖励',
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
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
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
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
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Divider(
              height: 1,
              color: Colors.grey.withValues(alpha: 0.1),
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
                        color: Colors.black54,
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

  Widget _buildBottomButton() {
    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 32.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF5252),
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, 50.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.headset_mic, size: 20.sp),
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
