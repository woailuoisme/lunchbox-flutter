import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 个人信息头像编辑组件
/// 用于展示用户头像，并提供点击更换的交互
class ProfileAvatarEdit extends StatelessWidget {
  const ProfileAvatarEdit({
    required this.avatarUrl,
    required this.changeLabel,
    this.localImage,
    this.onTap,
    this.isLoading = false,
    super.key,
  });

  /// 远程头像 URL
  final String avatarUrl;

  /// 本地选中的图片文件
  final File? localImage;

  /// 更换文字
  final String changeLabel;

  /// 点击回调
  final VoidCallback? onTap;

  /// 是否正在上传
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: GestureDetector(
        onTap: isLoading ? null : onTap,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // 装饰性外环
                Container(
                  width: 112.r,
                  height: 112.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: theme.colorScheme.primary.withValues(alpha: 0.1),
                      width: 1.5.r,
                    ),
                  ),
                ),

                // 主头像容器
                Container(
                  width: 100.r,
                  height: 100.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadowColor.withValues(
                          alpha: isDark ? 0.3 : 0.1,
                        ),
                        blurRadius: 20,
                        spreadRadius: 0,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Container(
                      color: theme.colorScheme.surface,
                      child: _buildAvatarImage(),
                    ),
                  ),
                ),

                // 加载遮罩
                if (isLoading)
                  Positioned.fill(
                    child: Container(
                      margin: EdgeInsets.all(6.r), // 对齐装饰环内径
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.4),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 32.r,
                          height: 32.r,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: theme.colorScheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),

                // 相机图标按钮
                Positioned(
                  right: 4.r,
                  bottom: 4.r,
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.primary.withValues(alpha: 0.8),
                        ],
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.colorScheme.surface,
                        width: 2.5.r,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.shadowColor.withValues(alpha: 0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      Symbols.camera_alt,
                      size: 16.sp,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                changeLabel,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: theme.colorScheme.primary.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarImage() {
    if (localImage != null) {
      return Image.file(localImage!, fit: BoxFit.cover);
    }

    return CachedNetworkImage(
      imageUrl: avatarUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: const Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => Container(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: const Icon(Symbols.person, size: 40),
      ),
    );
  }
}
