import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/values/app_colors.dart';
import 'package:lunchbox/features/settings/providers/settings_providers.dart';

/// 设备信息页面
class DeviceInfoView extends ConsumerWidget {
  const DeviceInfoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceInfoAsync = ref.watch(fetchDeviceInfoProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('设备信息'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: deviceInfoAsync.when(
        data: (BaseDeviceInfo device) {
          final infoMap = _getDeviceInfoMap(device);
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            itemCount: infoMap.length,
            itemBuilder: (context, index) {
              final key = infoMap.keys.elementAt(index);
              final value = infoMap[key].toString();
              return _buildInfoTile(key, value, index == infoMap.length - 1);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object err, StackTrace? stack) =>
            Center(child: Text('加载失败: $err')),
      ),
    );
  }

  Map<String, dynamic> _getDeviceInfoMap(BaseDeviceInfo device) {
    if (kIsWeb) {
      final webInfo = device as WebBrowserInfo;
      return {
        '浏览器': webInfo.browserName.name,
        '平台': webInfo.platform,
        'User Agent': webInfo.userAgent,
        '语言': webInfo.language,
        '内存': webInfo.deviceMemory != null
            ? '${webInfo.deviceMemory} GB'
            : '未知',
      };
    } else if (Platform.isAndroid) {
      final androidInfo = device as AndroidDeviceInfo;
      return {
        '品牌': androidInfo.brand,
        '型号': androidInfo.model,
        '系统版本': 'Android ${androidInfo.version.release}',
        'SDK版本': androidInfo.version.sdkInt.toString(),
        '厂商': androidInfo.manufacturer,
        '硬件': androidInfo.hardware,
        '主机': androidInfo.host,
        'ID': androidInfo.id,
      };
    } else if (Platform.isIOS) {
      final iosInfo = device as IosDeviceInfo;
      return {
        '名名称': iosInfo.name,
        '型号': iosInfo.model,
        '系统名': iosInfo.systemName,
        '系统版本': iosInfo.systemVersion,
        '机器码': iosInfo.utsname.machine,
        '唯一ID': iosInfo.identifierForVendor,
      };
    }
    return device.data;
  }

  Widget _buildInfoTile(String label, String value, bool isLast) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isLast
            ? const BorderRadius.vertical(bottom: Radius.circular(12))
            : BorderRadius.zero,
        border: Border(
          bottom: isLast
              ? BorderSide.none
              : const BorderSide(color: AppColors.divider),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.w,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
