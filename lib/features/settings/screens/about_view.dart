import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../core/values/app_colors.dart';
import '../providers/settings_providers.dart';

/// 关于应用页面
class AboutView extends ConsumerWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfoAsync = ref.watch(fetchPackageInfoProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('关于我们'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: packageInfoAsync.when(
        data: (PackageInfo info) => Column(
          children: [
            SizedBox(height: 40.h),
            // App Logo
            Center(
              child: Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.lunch_dining,
                  size: 60.sp,
                  color: AppColors.primary,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              info.appName,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Version ${info.version} (${info.buildNumber})',
              style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
            ),
            SizedBox(height: 40.h),
            // Info List
            _buildInfoCard([
              _buildInfoItem('应用名称', info.appName),
              _buildInfoItem('包名', info.packageName),
              _buildInfoItem('版本号', info.version),
              _buildInfoItem('构建号', info.buildNumber),
            ]),
            const Spacer(),
            Text(
              '© 2024 Lunchbox Team',
              style: TextStyle(fontSize: 12.sp, color: AppColors.textHint),
            ),
            SizedBox(height: 24.h),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object err, StackTrace? stack) =>
            Center(child: Text('加载失败: $err')),
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 15.sp, color: AppColors.textPrimary),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        if (label != '构建号')
          const Divider(
            height: 1,
            indent: 16,
            endIndent: 16,
            color: AppColors.divider,
          ),
      ],
    );
  }
}
