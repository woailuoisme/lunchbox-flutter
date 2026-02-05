import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';

import '../../../core/values/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../providers/settings_providers.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfoAsync = ref.watch(fetchPackageInfoProvider);

    return UpgradeAlert(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text('设置'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          children: [
            const SizedBox(height: 16),
            _buildSectionHeader('通用'),
            _buildSectionList([
              _buildListTile(
                title: '检查更新',
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.textHint,
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('正在检查更新...'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
              _buildListTile(
                title: '清除缓存',
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.textHint,
                ),
                onTap: () {
                  // TODO(User): 实现清除缓存
                },
              ),
            ]),

            const SizedBox(height: 24),
            _buildSectionHeader('关于'),
            _buildSectionList([
              _buildListTile(
                title: '设备信息',
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.textHint,
                ),
                onTap: () => context.push(
                  '${AppRoutes.settings}${AppRoutes.deviceInfo}',
                ),
              ),
              _buildListTile(
                title: '关于我们',
                trailing: packageInfoAsync.when(
                  data: (PackageInfo info) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'v${info.version}',
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColors.textHint,
                      ),
                    ],
                  ),
                  loading: () => const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  error: (Object err, StackTrace? stack) => const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.textHint,
                  ),
                ),
                onTap: () =>
                    context.push('${AppRoutes.settings}${AppRoutes.about}'),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSectionList(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildListTile({
    required String title,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, color: AppColors.textPrimary),
          ),
          trailing: trailing,
          onTap: onTap,
          shape: RoundedRectangleAppTheme
              .listTileShape, // If I had it, but I'll stick to default or manually
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
        ),
        if (title != '清除缓存' && title != '关于我们')
          const Divider(
            height: 1,
            indent: 16,
            endIndent: 16,
            color: AppColors.divider,
          ),
      ],
    );
  }
}

// Simple helper for consistency since I don't know the exact theme classes
class RoundedRectangleAppTheme {
  static const listTileShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  );
}
