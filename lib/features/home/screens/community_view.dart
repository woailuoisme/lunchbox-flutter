import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// 社群福利页面
///
/// 展示加入社群的引导，包含二维码和福利说明
class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      appBar: AppBar(
        title: Text(t.community.title),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(colorScheme),
            _buildQrCard(colorScheme),
            _buildFeatures(colorScheme),
            _buildWhyJoin(colorScheme),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  /// 构建顶部红色引导区域
  Widget _buildHeader(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 30.h),
      color: colorScheme.primary,
      child: Column(
        children: [
          Text(
            t.community.join,
            style: TextStyle(
              color: colorScheme.onPrimary,
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            t.community.share,
            style: TextStyle(
              color: colorScheme.onPrimary.withValues(alpha: 0.9),
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  /// 构建二维码卡片
  Widget _buildQrCard(ColorScheme colorScheme) {
    return Transform.translate(
      offset: Offset(0, -20.h),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.05),
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
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              t.community.dept,
              style: TextStyle(fontSize: 12.sp, color: colorScheme.outline),
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow.withValues(alpha: 0.05),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: QrImageView(
                data: 'https://u.wechat.com/EXAMPLE',
                size: 180.w,
                backgroundColor: Colors.white,
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
                color: colorScheme.onSurface,
              ),
            ),
            Text(
              t.community.dept,
              style: TextStyle(fontSize: 12.sp, color: colorScheme.outline),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建功能特色列表
  Widget _buildFeatures(ColorScheme colorScheme) {
    final features = [
      {
        'icon': Symbols.card_giftcard,
        'title': t.community.features.coupon,
        'subtitle': t.community.features.couponHint,
        'color': colorScheme.primary,
      },
      {
        'icon': Symbols.group,
        'title': t.community.features.activity,
        'subtitle': t.community.features.activityHint,
        'color': colorScheme.primary,
      },
      {
        'icon': Symbols.forum,
        'title': t.community.features.topic,
        'subtitle': t.community.features.topicHint,
        'color': colorScheme.primary,
      },
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          top: BorderSide(color: colorScheme.outlineVariant, width: 0.5),
        ),
      ),
      child: Column(
        children: features
            .map((d) => _buildFeatureItem(d, colorScheme))
            .toList(),
      ),
    );
  }

  /// 构建单个特色项
  Widget _buildFeatureItem(Map<String, dynamic> data, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            alignment: Alignment.center,
            child: Icon(
              data['icon'] as IconData,
              size: 24.sp,
              color: data['color'] as Color,
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
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  data['subtitle'] as String,
                  style: TextStyle(fontSize: 12.sp, color: colorScheme.outline),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建“为什么加入”区域
  Widget _buildWhyJoin(ColorScheme colorScheme) {
    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorScheme.primaryContainer),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.community.whyJoin,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 16.h),
          _buildBulletPoint(t.community.reason1, colorScheme),
          _buildBulletPoint(t.community.reason2, colorScheme),
          _buildBulletPoint(t.community.reason3, colorScheme),
          _buildBulletPoint(t.community.reason4, colorScheme),
        ],
      ),
    );
  }

  /// 构建圆点列表项
  Widget _buildBulletPoint(String text, ColorScheme colorScheme) {
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
              decoration: BoxDecoration(
                color: colorScheme.primary,
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
                color: colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
