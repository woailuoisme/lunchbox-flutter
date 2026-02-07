import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/providers/locale_provider.dart';
import 'package:lunchbox/core/theme/theme_provider.dart';
import 'package:lunchbox/core/values/app_colors.dart';
import 'package:lunchbox/features/settings/providers/settings_providers.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfoAsync = ref.watch(fetchPackageInfoProvider);
    final currentLocale = ref.watch(localeProvider);
    final themeState = ref.watch(themeProvider);

    return UpgradeAlert(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(t.settings.title),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          children: [
            const SizedBox(height: 16),
            _buildSectionHeader(t.settings.general),
            _buildSectionList([
              _buildListTile(
                title: t.settings.theme,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _getThemeModeName(themeState.mode),
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
                onTap: () => _showThemePicker(context, ref, themeState.mode),
              ),
              _buildListTile(
                title: t.settings.language,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      currentLocale == AppLocale.en
                          ? t.settings.english
                          : t.settings.chinese,
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
                onTap: () => _showLanguagePicker(context, ref),
              ),
              _buildListTile(
                title: t.settings.checkUpdate,
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.textHint,
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(t.settings.checkingUpdate),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
              _buildListTile(
                title: t.settings.clearCache,
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.textHint,
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(t.settings.cacheCleared),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ]),
            const SizedBox(height: 24),
            _buildSectionHeader(t.settings.about),
            _buildSectionList([
              _buildListTile(
                title: t.settings.deviceInfo,
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
                title: t.settings.aboutUs,
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
                    Icons.error_outline,
                    color: Colors.red,
                    size: 16,
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

  String _getThemeModeName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return t.settings.themeLight;
      case ThemeMode.dark:
        return t.settings.themeDark;
      case ThemeMode.system:
        return t.settings.themeSystem;
    }
  }

  void _showThemePicker(
    BuildContext context,
    WidgetRef ref,
    ThemeMode currentMode,
  ) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(t.settings.themeSystem),
                trailing: currentMode == ThemeMode.system
                    ? const Icon(Icons.check, color: AppColors.primary)
                    : null,
                onTap: () async {
                  await ref
                      .read(themeProvider.notifier)
                      .setThemeMode(ThemeMode.system);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                title: Text(t.settings.themeLight),
                trailing: currentMode == ThemeMode.light
                    ? const Icon(Icons.check, color: AppColors.primary)
                    : null,
                onTap: () async {
                  await ref
                      .read(themeProvider.notifier)
                      .setThemeMode(ThemeMode.light);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                title: Text(t.settings.themeDark),
                trailing: currentMode == ThemeMode.dark
                    ? const Icon(Icons.check, color: AppColors.primary)
                    : null,
                onTap: () async {
                  await ref
                      .read(themeProvider.notifier)
                      .setThemeMode(ThemeMode.dark);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLanguagePicker(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(t.settings.english),
                onTap: () async {
                  await ref
                      .read(localeProvider.notifier)
                      .setLocale(AppLocale.en);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                title: Text(t.settings.chinese),
                onTap: () async {
                  await ref
                      .read(localeProvider.notifier)
                      .setLocale(AppLocale.zhCn);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        );
      },
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
