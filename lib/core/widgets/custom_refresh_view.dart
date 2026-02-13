import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 通用下拉刷新组件
///
/// 封装 [CustomRefreshIndicator] 提供统一的下拉刷新效果
class CustomRefreshView extends StatelessWidget {
  const CustomRefreshView({
    required this.child,
    required this.onRefresh,
    this.offset = 100,
    super.key,
  });

  final Widget child;
  final Future<void> Function() onRefresh;
  final double offset;

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: onRefresh,
      offsetToArmed: offset.h,
      builder: (context, child, controller) {
        return Stack(
          children: [
            // 刷新指示器 (在列表上方显示，模拟位移效果)
            AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                // 计算指示器高度，最大为 offset
                final height = controller.value * offset.h;
                return SizedBox(
                  height: height,
                  width: double.infinity,
                  child: OverflowBox(
                    maxHeight: offset.h,
                    minHeight: 0,
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: offset.h,
                      child: _buildIndicator(context, controller),
                    ),
                  ),
                );
              },
            ),
            // 列表内容 (随拖动下移)
            Transform.translate(
              offset: Offset(0, controller.value * offset.h),
              child: child,
            ),
          ],
        );
      },
      child: child,
    );
  }

  Widget _buildIndicator(BuildContext context, IndicatorController controller) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIcon(controller, colorScheme),
        SizedBox(width: 8.w),
        Text(
          _getStatusText(controller),
          style: TextStyle(
            color: colorScheme.primary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildIcon(IndicatorController controller, ColorScheme colorScheme) {
    if (controller.isLoading) {
      return SizedBox(
        width: 48.w,
        height: 24.w,
        child: SpinKitThreeBounce(color: colorScheme.primary, size: 20.sp),
      );
    }

    return Transform.rotate(
      angle: controller.isDragging || controller.isArmed
          ? 3.14 *
                (controller.value.clamp(0.0, 1.0) - 1) *
                2 // 简单的旋转动画
          : 0,
      child: Icon(
        controller.isArmed ? Symbols.arrow_upward : Symbols.arrow_downward,
        color: colorScheme.primary,
        size: 24.sp,
      ),
    );
  }

  String _getStatusText(IndicatorController controller) {
    if (controller.isLoading) {
      return t.common.loading;
    }
    if (controller.isArmed) {
      return t.common.releaseToRefresh;
    }
    if (controller.isDragging) {
      return t.common.pullToRefresh;
    }
    if (controller.isComplete) {
      return t.common.success;
    }
    return t.common.pullToRefresh;
  }
}
