import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 全局统一图片组件
///
/// 特性：
/// 1. 支持 Network, Asset, File 多种来源自动识别
/// 2. 集成骨架屏 Loading 效果 (Shimmer)
/// 3. 自动内存缓存优化 (MemCache)
/// 4. 统一的错误处理与圆角支持
/// 5. 支持 Hero 动画
class AppImage extends StatelessWidget {
  const AppImage({
    required this.imageUrl,
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.radius,
    this.placeholder,
    this.errorWidget,
    this.imageBuilder,
    this.heroTag,
    this.color,
    this.memCacheWidth,
    this.memCacheHeight,
  });

  /// 图片地址 (支持 http/https, assets/, file path)
  final String imageUrl;

  final double? width;
  final double? height;
  final BoxFit fit;

  /// 圆角 (优先使用 borderRadius)
  final BorderRadiusGeometry? borderRadius;

  /// 圆角数值 (便捷方式，如果 borderRadius 为空则使用此值)
  final double? radius;

  /// 自定义 Loading
  final Widget? placeholder;

  /// 自定义 Error
  final Widget? errorWidget;

  /// 自定义图片构建器 (仅 Network 有效)
  final ImageWidgetBuilder? imageBuilder;

  /// Hero 动画 Tag
  final String? heroTag;

  /// 图片混合颜色
  final Color? color;

  /// 指定内存缓存大小 (一般不需要手动指定，组件会自动根据 width/height 计算)
  final int? memCacheWidth;
  final int? memCacheHeight;

  bool get _isNetwork => imageUrl.startsWith('http');

  bool get _isAsset => imageUrl.startsWith('assets/');

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return _buildError(context);
    }

    Widget imageWidget;

    if (_isNetwork) {
      // 计算缓存大小，优化内存
      // 如果指定了宽高，则使用指定宽高 * 像素密度
      // 如果没指定，则使用默认 null (原图大小)
      final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
      final int? cacheW =
          memCacheWidth ??
          (width != null && width!.isFinite
              ? (width! * devicePixelRatio).toInt()
              : null);
      final int? cacheH =
          memCacheHeight ??
          (height != null && height!.isFinite
              ? (height! * devicePixelRatio).toInt()
              : null);

      imageWidget = CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        color: color,
        memCacheWidth: cacheW,
        memCacheHeight: cacheH,
        placeholder: (context, url) => _buildPlaceholder(context),
        errorWidget: (context, url, error) => _buildError(context),
        imageBuilder: imageBuilder,
        fadeInDuration: const Duration(milliseconds: 300),
      );
    } else if (_isAsset) {
      imageWidget = Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        color: color,
        errorBuilder: (context, error, stackTrace) => _buildError(context),
      );
    } else {
      // File
      imageWidget = Image.file(
        File(imageUrl),
        width: width,
        height: height,
        fit: fit,
        color: color,
        errorBuilder: (context, error, stackTrace) => _buildError(context),
      );
    }

    // 处理 Hero
    if (heroTag != null) {
      imageWidget = Hero(tag: heroTag!, child: imageWidget);
    }

    // 处理圆角
    final finalBorderRadius =
        borderRadius ??
        (radius != null ? BorderRadius.circular(radius!.r) : null);

    if (finalBorderRadius != null) {
      return ClipRRect(borderRadius: finalBorderRadius, child: imageWidget);
    }

    return imageWidget;
  }

  Widget _buildPlaceholder(BuildContext context) {
    if (placeholder != null) {
      return placeholder!;
    }
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
          width: width,
          height: height,
          color: colorScheme.surfaceContainerHighest,
        )
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(
          duration: 1200.ms,
          color: colorScheme.surface.withValues(alpha: 0.5),
        );
  }

  Widget _buildError(BuildContext context) {
    if (errorWidget != null) {
      return errorWidget!;
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius:
            borderRadius ??
            (radius != null ? BorderRadius.circular(radius!.r) : null),
      ),
      child: Center(
        child: Icon(
          Symbols.broken_image,
          color: colorScheme.outlineVariant,
          size: 24.sp,
        ),
      ),
    );
  }
}
