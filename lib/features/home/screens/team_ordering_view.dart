import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 团队用餐页面
///
/// 展示团队订餐服务，包含适用场景、操作流程和服务优势
class TeamOrderingView extends StatelessWidget {
  const TeamOrderingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: Text(t.teamOrdering.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
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
                _buildScenarios(),
                _buildProcess(),
                _buildAdvantages(),
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
    return Container(
      width: double.infinity,
      height: 180.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE57373), Color(0xFFC62828)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            t.teamOrdering.bannerTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            t.teamOrdering.bannerSubtitle,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                [
                  t.teamOrdering.tag1,
                  t.teamOrdering.tag2,
                  t.teamOrdering.tag3,
                ].map((tag) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(color: Colors.white, fontSize: 10.sp),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  /// 构建适用场景
  Widget _buildScenarios() {
    final scenarios = [
      {
        'icon': '🍱',
        'title': t.teamOrdering.scenarios.team,
        'desc': t.teamOrdering.scenarios.teamDesc,
      },
      {
        'icon': '📅',
        'title': t.teamOrdering.scenarios.reserve,
        'desc': t.teamOrdering.scenarios.reserveDesc,
      },
      {
        'icon': '📋',
        'title': t.teamOrdering.scenarios.vip,
        'desc': t.teamOrdering.scenarios.vipDesc,
      },
    ];

    return Column(
      children: [
        _buildSectionTitle(
          t.teamOrdering.scenarios.title,
          t.teamOrdering.scenarios.subtitle,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: scenarios
                .map((s) => Expanded(child: _buildScenarioCard(s)))
                .toList(),
          ),
        ),
      ],
    );
  }

  /// 构建场景卡片
  Widget _buildScenarioCard(Map<String, String> data) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(data['icon']!, style: TextStyle(fontSize: 32.sp)),
          SizedBox(height: 12.h),
          Text(
            data['title']!,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h),
          Text(
            data['desc']!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  /// 构建操作流程
  Widget _buildProcess() {
    final steps = [
      {
        'num': '1',
        'title': t.teamOrdering.process.step1Title,
        'desc': t.teamOrdering.process.step1Desc,
      },
      {
        'num': '2',
        'title': t.teamOrdering.process.step2Title,
        'desc': t.teamOrdering.process.step2Desc,
      },
      {
        'num': '3',
        'title': t.teamOrdering.process.step3Title,
        'desc': t.teamOrdering.process.step3Desc,
      },
    ];

    return Column(
      children: [
        _buildSectionTitle(
          t.teamOrdering.process.title,
          t.teamOrdering.process.subtitle,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: steps.asMap().entries.map((entry) {
              final isLast = entry.key == steps.length - 1;
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 24.w,
                        height: 24.w,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF8A80),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          entry.value['num']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.value['title']!,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              entry.value['desc']!,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (!isLast)
                    Container(
                      margin: EdgeInsets.only(left: 11.w),
                      height: 20.h,
                      width: 1.w,
                      color: const Color(0xFFFF8A80).withValues(alpha: 0.3),
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  /// 构建服务优势
  Widget _buildAdvantages() {
    final advantages = [
      {
        'icon': Icons.track_changes,
        'title': t.teamOrdering.advantages.custom,
        'desc': t.teamOrdering.advantages.customDesc,
      },
      {
        'icon': Icons.alarm,
        'title': t.teamOrdering.advantages.reserve,
        'desc': t.teamOrdering.advantages.reserveDesc,
      },
      {
        'icon': Icons.payment,
        'title': t.teamOrdering.advantages.price,
        'desc': t.teamOrdering.advantages.priceDesc,
      },
      {
        'icon': Icons.verified_user,
        'title': t.teamOrdering.advantages.quality,
        'desc': t.teamOrdering.advantages.qualityDesc,
      },
    ];

    return Column(
      children: [
        _buildSectionTitle(
          t.teamOrdering.advantages.title,
          t.teamOrdering.advantages.subtitle,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(children: advantages.map(_buildAdvantageItem).toList()),
        ),
      ],
    );
  }

  /// 构建单个优势项
  Widget _buildAdvantageItem(Map<String, dynamic> data) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(
            data['icon'] as IconData,
            color: const Color(0xFFD32F2F),
            size: 24.sp,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['title'] as String,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  data['desc'] as String,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建章节标题
  Widget _buildSectionTitle(String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 16.h),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  /// 构建底部固定按钮
  Widget _buildBottomButton() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
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
            backgroundColor: const Color(0xFFFF766A),
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
              Text(
                t.teamOrdering.bookNow,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8.w),
              Icon(Icons.arrow_forward, size: 18.sp),
            ],
          ),
        ),
      ),
    );
  }
}
