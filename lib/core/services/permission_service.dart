import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permission_service.g.dart';

@Riverpod(keepAlive: true)
PermissionService permissionService(Ref ref) {
  return PermissionService();
}

class PermissionService {
  /// 检查权限状态
  Future<PermissionStatus> checkPermission(Permission permission) async {
    return permission.status;
  }

  /// 请求权限
  /// 如果权限被永久拒绝，返回 false
  Future<bool> requestPermission(Permission permission) async {
    // Android 13+ 通知权限特殊处理
    if (Platform.isAndroid && permission == Permission.notification) {
      // 检查 SDK 版本，如果小于 33 (Android 13)，直接返回 true
      // 实际项目中可能需要通过 device_info_plus 获取版本，这里简化处理
      // 或者依赖 permission_handler 自身的处理逻辑
    }

    final status = await permission.request();

    if (status.isGranted || status.isLimited) {
      return true;
    }

    if (status.isPermanentlyDenied) {
      // 权限被永久拒绝，需要引导用户去设置页面
      return false;
    }

    return false;
  }

  /// 请求多个权限
  Future<Map<Permission, PermissionStatus>> requestPermissions(
    List<Permission> permissions,
  ) async {
    return permissions.request();
  }

  /// 打开系统设置
  Future<bool> openSettings() async {
    return openAppSettings();
  }

  /// 检查并请求相机权限
  Future<bool> requestCameraPermission() async {
    return requestPermission(Permission.camera);
  }

  /// 检查并请求相册权限
  /// Android 13+ 使用 photos，旧版本使用 storage
  Future<bool> requestPhotosPermission() async {
    if (Platform.isAndroid) {
      // 简单起见，这里先尝试请求 photos，如果失败或不支持，permission_handler 会处理
      // 实际开发中建议根据 Android SDK 版本区分
      // SDK >= 33: Permission.photos
      // SDK < 33: Permission.storage

      // 尝试请求 photos
      final photosStatus = await Permission.photos.status;
      if (photosStatus.isGranted) {
        return true;
      }

      // 如果 photos 状态不是 granted，尝试请求
      final result = await requestPermission(Permission.photos);
      if (result) {
        return true;
      }

      // 如果 photos 请求失败，可能是旧版本 Android，尝试 storage
      return requestPermission(Permission.storage);
    }

    // iOS
    return requestPermission(Permission.photos);
  }

  /// 检查并请求位置权限
  Future<bool> requestLocationPermission() async {
    return requestPermission(Permission.location);
  }

  /// 检查并请求通知权限
  Future<bool> requestNotificationPermission() async {
    return requestPermission(Permission.notification);
  }
}
