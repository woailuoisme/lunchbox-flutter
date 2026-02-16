import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 通用加载组件
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.size, this.color});

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Semantics(
        label: t.common.loading,
        child: SizedBox(
          width: size ?? 36.w,
          height: size ?? 36.w,
          child: SpinKitThreeBounce(
            color: color ?? Theme.of(context).colorScheme.primary,
            size: (size ?? 36.w) * 0.6,
          ),
        ),
      ),
    );
  }
}
