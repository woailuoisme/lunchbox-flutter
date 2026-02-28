import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// 设备信息卡片骨架屏组件
class DeviceCardSkeleton extends StatelessWidget {
  const DeviceCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 顶部：名称和状态
          Row(
            children: [
              Bone.text(width: 120.w),
              const Spacer(),
              Bone.button(width: 40.w, height: 18.h),
            ],
          ),
          SizedBox(height: 12.h),
          // 地址和距离
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Bone.icon(),
              SizedBox(width: 4.w),
              const Expanded(child: Bone.text(words: 3)),
              SizedBox(width: 8.w),
              Bone.button(width: 50.w, height: 24.h),
            ],
          ),
          SizedBox(height: 12.h),
          // 底部：营业时间和操作指引
          Row(
            children: [
              Bone.icon(size: 14.sp),
              SizedBox(width: 4.w),
              Bone.text(width: 80.w),
              const Spacer(),
              Bone.icon(size: 12.sp),
            ],
          ),
        ],
      ),
    );
  }
}
