import 'package:flutter/material.dart';

import '../values/app_assets.dart';
import 'logger_utils.dart';

/// 资源工具类
/// 提供资源加载和处理的辅助方法
class AssetUtils {
  AssetUtils._();

  /// 加载图片，如果失败则显示占位图
  static Widget loadImage(
    String assetPath, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    String? placeholder,
  }) {
    try {
      return Image.asset(
        assetPath,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholder(
            width: width,
            height: height,
            placeholder: placeholder,
          );
        },
      );
    } catch (e) {
      return _buildPlaceholder(
        width: width,
        height: height,
        placeholder: placeholder,
      );
    }
  }

  /// 构建占位图
  static Widget _buildPlaceholder({
    double? width,
    double? height,
    String? placeholder,
  }) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
      child: Icon(
        Icons.image,
        size: (width != null && height != null) ? (width + height) / 4 : 48,
        color: Colors.grey[400],
      ),
    );
  }

  /// 获取产品占位图
  static Widget getProductPlaceholder({double? width, double? height}) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[100],
      child: Icon(
        Icons.lunch_dining,
        size: (width != null && height != null) ? (width + height) / 4 : 48,
        color: Colors.grey[300],
      ),
    );
  }

  /// 获取头像占位图
  static Widget getAvatarPlaceholder({double? size}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.person,
        size: size != null ? size / 2 : 24,
        color: Colors.grey[400],
      ),
    );
  }

  /// 获取设备占位图
  static Widget getDevicePlaceholder({
    double? width,
    double? height,
    bool isOnline = true,
  }) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[100],
      child: Icon(
        Icons.store,
        size: (width != null && height != null) ? (width + height) / 4 : 48,
        color: isOnline ? Colors.green[300] : Colors.grey[300],
      ),
    );
  }

  /// 检查资源是否存在
  /// 需要传入 BuildContext
  static Future<bool> assetExists(
    BuildContext context,
    String assetPath,
  ) async {
    try {
      await DefaultAssetBundle.of(context).load(assetPath);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 预加载图片资源
  static Future<void> precacheImages(BuildContext context) async {
    final imagesToCache = [
      AppAssets.logo,
      AppAssets.splashBackground,
      AppAssets.onboarding1,
      AppAssets.onboarding2,
      AppAssets.onboarding3,
      // 添加其他需要预加载的图片
    ];

    for (final imagePath in imagesToCache) {
      try {
        if (context.mounted) {
          await precacheImage(AssetImage(imagePath), context);
        }
      } catch (e) {
        LoggerUtils.e('Failed to precache image: $imagePath', e);
      }
    }
  }

  /// 获取空状态图片
  static Widget getEmptyStateImage(EmptyStateType type) {
    IconData icon;
    Color? color;

    switch (type) {
      case EmptyStateType.cart:
        icon = Icons.shopping_cart_outlined;
        color = Colors.orange;
        break;
      case EmptyStateType.order:
        icon = Icons.receipt_long_outlined;
        color = Colors.blue;
        break;
      case EmptyStateType.search:
        icon = Icons.search_off;
        color = Colors.grey;
        break;
      case EmptyStateType.favorite:
        icon = Icons.favorite_border;
        color = Colors.red;
        break;
      case EmptyStateType.data:
        icon = Icons.inbox_outlined;
        color = Colors.grey;
    }

    return Icon(icon, size: 80, color: color.withValues(alpha: 0.5));
  }
}

/// 空状态类型
enum EmptyStateType { cart, order, search, favorite, data }
