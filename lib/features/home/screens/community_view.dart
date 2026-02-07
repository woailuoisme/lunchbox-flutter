import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// 社群福利页面
///
/// 展示加入社群的引导，包含二维码和福利说明
class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDECEB),
      appBar: AppBar(
        title: Text(t.community.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildQrCard(),
            _buildFeatures(),
            _buildWhyJoin(),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  /// 构建顶部红色引导区域
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 30.h),
      color: const Color(0xFFFF766A),
      child: Column(
        children: [
          Text(
            t.community.join,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            t.community.share,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  /// 构建二维码卡片
  Widget _buildQrCard() {
    return Transform.translate(
      offset: Offset(0, -20.h),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              t.community.org,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              t.community.dept,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: QrImageView(
                data: 'https://u.wechat.com/EXAMPLE',
                size: 180.w,
                embeddedImage: const NetworkImage(
                  'https://img.icons8.com/color/96/weixing.png',
                ),
                embeddedImageStyle: const QrEmbeddedImageStyle(
                  size: Size(30, 30),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              t.community.scanHint,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            Text(
              t.community.dept,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建功能特色列表
  Widget _buildFeatures() {
    final features = [
      {
        'icon': '🎁',
        'title': t.community.features.coupon,
        'subtitle': t.community.features.couponHint,
        'color': Colors.orange,
      },
      {
        'icon': '🍕',
        'title': t.community.features.tasting,
        'subtitle': t.community.features.tastingHint,
        'color': Colors.amber,
      },
      {
        'icon': '👥',
        'title': t.community.features.exchange,
        'subtitle': t.community.features.exchangeHint,
        'color': Colors.blue,
      },
      {
        'icon': '🎯',
        'title': t.community.features.priority,
        'subtitle': t.community.features.priorityHint,
        'color': Colors.red,
      },
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFEEEEEE), width: 0.5)),
      ),
      child: Column(children: features.map(_buildFeatureItem).toList()),
    );
  }

  /// 构建单个特色项
  Widget _buildFeatureItem(Map<String, dynamic> data) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            alignment: Alignment.center,
            child: Text(
              data['icon'] as String,
              style: TextStyle(fontSize: 24.sp),
            ),
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
                    color: Colors.black87,
                  ),
                ),
                Text(
                  data['subtitle'] as String,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建“为什么加入”区域
  Widget _buildWhyJoin() {
    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF1F0),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFFFDADA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.community.whyJoin,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF444444),
            ),
          ),
          SizedBox(height: 16.h),
          _buildBulletPoint(t.community.reason1),
          _buildBulletPoint(t.community.reason2),
          _buildBulletPoint(t.community.reason3),
          _buildBulletPoint(t.community.reason4),
        ],
      ),
    );
  }

  /// 构建圆点列表项
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: Container(
              width: 4.w,
              height: 4.w,
              decoration: const BoxDecoration(
                color: Color(0xFFFF766A),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13.sp,
                color: const Color(0xFF666666),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
