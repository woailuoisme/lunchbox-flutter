import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/settings/providers/settings_notifier.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 设备信息页面
class DeviceInfoView extends ConsumerWidget {
  const DeviceInfoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceInfoAsync = ref.watch(fetchDeviceInfoProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(t.settings.deviceInfo),
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
              return _buildInfoTile(
                context,
                key,
                value,
                index == infoMap.length - 1,
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object err, StackTrace? stack) =>
            Center(child: Text('${t.common.loadFailed}: $err')),
      ),
    );
  }

  Map<String, dynamic> _getDeviceInfoMap(BaseDeviceInfo device) {
    if (kIsWeb) {
      final webInfo = device as WebBrowserInfo;
      return {
        t.device_info.browser: webInfo.browserName.name,
        t.device_info.platform: webInfo.platform,
        t.device_info.userAgent: webInfo.userAgent,
        t.device_info.language: webInfo.language,
        t.device_info.memory: webInfo.deviceMemory != null
            ? '${webInfo.deviceMemory} GB'
            : t.common.unknownError,
      };
    } else if (Platform.isAndroid) {
      final androidInfo = device as AndroidDeviceInfo;
      return {
        t.device_info.brand: androidInfo.brand,
        t.device_info.model: androidInfo.model,
        t.device_info.systemVersion: 'Android ${androidInfo.version.release}',
        t.device_info.sdkVersion: androidInfo.version.sdkInt.toString(),
        t.device_info.manufacturer: androidInfo.manufacturer,
        t.device_info.hardware: androidInfo.hardware,
        t.device_info.host: androidInfo.host,
        t.device_info.id: androidInfo.id,
      };
    } else if (Platform.isIOS) {
      final iosInfo = device as IosDeviceInfo;
      return {
        t.device_info.name: iosInfo.name,
        t.device_info.model: iosInfo.model,
        t.device_info.systemName: iosInfo.systemName,
        t.device_info.systemVersion: iosInfo.systemVersion,
        t.device_info.machine: iosInfo.utsname.machine,
        t.device_info.uniqueId: iosInfo.identifierForVendor,
      };
    }
    return device.data;
  }

  Widget _buildInfoTile(
    BuildContext context,
    String label,
    String value,
    bool isLast,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: isLast
            ? BorderRadius.vertical(bottom: Radius.circular(12.r))
            : BorderRadius.zero,
        border: Border(
          bottom: isLast
              ? BorderSide.none
              : BorderSide(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                ),
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
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: colorScheme.onSurface,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
