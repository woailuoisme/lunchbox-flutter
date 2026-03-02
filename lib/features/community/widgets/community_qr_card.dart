import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// 社群二维码卡片组件
///
/// 显示加群二维码及相关提示文字
class CommunityQrCard extends StatelessWidget {
  const CommunityQrCard({
    super.key,
    this.qrData = 'https://u.wechat.com/EXAMPLE',
  });
  final String qrData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
                data: qrData,
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
}
