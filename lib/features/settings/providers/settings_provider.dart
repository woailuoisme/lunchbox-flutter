import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

@riverpod
Future<PackageInfo> fetchPackageInfo(Ref ref) async {
  ref.keepAlive();
  return PackageInfo.fromPlatform();
}

@riverpod
DeviceInfoPlugin deviceInfoPlugin(Ref ref) {
  return DeviceInfoPlugin();
}

@riverpod
Future<BaseDeviceInfo> fetchDeviceInfo(Ref ref) async {
  ref.keepAlive();
  final plugin = ref.watch(deviceInfoPluginProvider);
  return plugin.deviceInfo;
}
