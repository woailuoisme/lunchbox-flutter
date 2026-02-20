import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/providers/locale_provider.dart';
import 'package:lunchbox/core/theme/theme_provider.dart';
import 'package:lunchbox/features/settings/providers/settings_notifier.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfoAsync = ref.watch(fetchPackageInfoProvider);
    final currentLocale = ref.watch(localeProvider);
    final themeState = ref.watch(themeProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return UpgradeAlert(
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(
            t.settings.title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          elevation: 0,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          children:
              [
                    _buildSectionHeader(context, t.settings.general),
                    _buildSectionCard(context, [
                      _buildSettingsItem(
                        context: context,
                        icon: Symbols.colors,
                        iconColor: colorScheme.primary,
                        title: t.settings.themeScheme,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 16.w,
                              height: 16.w,
                              decoration: BoxDecoration(
                                color: _getSchemeColor(themeState.scheme),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(
                              Symbols.arrow_forward_ios,
                              size: 14.sp,
                              color: colorScheme.outline,
                            ),
                          ],
                        ),
                        onTap: () =>
                            _showSchemePicker(context, ref, themeState.scheme),
                      ),
                      _buildSettingsItem(
                        context: context,
                        icon: Symbols.palette,
                        iconColor: colorScheme.primary,
                        title: t.settings.theme,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _getThemeModeName(themeState.mode),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(
                              Symbols.arrow_forward_ios,
                              size: 14.sp,
                              color: colorScheme.outline,
                            ),
                          ],
                        ),
                        onTap: () =>
                            _showThemePicker(context, ref, themeState.mode),
                      ),
                      _buildSettingsItem(
                        context: context,
                        icon: Symbols.language,
                        iconColor: colorScheme.primary,
                        title: t.settings.language,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _getLocaleName(currentLocale),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(
                              Symbols.arrow_forward_ios,
                              size: 14.sp,
                              color: colorScheme.outline,
                            ),
                          ],
                        ),
                        onTap: () =>
                            _showLanguagePicker(context, ref, currentLocale),
                      ),
                      _buildSettingsItem(
                        context: context,
                        icon: Symbols.system_update,
                        iconColor: colorScheme.primary,
                        title: t.settings.checkUpdate,
                        trailing: packageInfoAsync.when(
                          data: (PackageInfo info) => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'v${info.version}',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Icon(
                                Symbols.arrow_forward_ios,
                                size: 14.sp,
                                color: colorScheme.outline,
                              ),
                            ],
                          ),
                          loading: () => SizedBox(
                            width: 14.w,
                            height: 14.w,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                          error: (_, stack) => Icon(
                            Symbols.arrow_forward_ios,
                            size: 14.sp,
                            color: colorScheme.outline,
                          ),
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
                      _buildSettingsItem(
                        context: context,
                        icon: Symbols.cleaning_services,
                        iconColor: colorScheme.primary,
                        title: t.settings.clearCache,
                        showDivider: false,
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
                    SizedBox(height: 24.h),
                    _buildSectionHeader(context, t.settings.about),
                    _buildSectionCard(context, [
                      _buildSettingsItem(
                        context: context,
                        icon: Symbols.perm_device_information,
                        iconColor: colorScheme.primary,
                        title: t.settings.deviceInfo,
                        trailing: Icon(
                          Symbols.arrow_forward_ios,
                          size: 14.sp,
                          color: colorScheme.outline,
                        ),
                        onTap: () => context.push(
                          '${AppRoutes.settings}/${AppRoutes.deviceInfo}',
                        ),
                      ),
                      _buildSettingsItem(
                        context: context,
                        icon: Symbols.info,
                        iconColor: colorScheme.primary,
                        title: t.settings.aboutUs,
                        showDivider: false,
                        trailing: Icon(
                          Symbols.arrow_forward_ios,
                          size: 14.sp,
                          color: colorScheme.outline,
                        ),
                        onTap: () => context.push(
                          '${AppRoutes.settings}/${AppRoutes.about}',
                        ),
                      ),
                    ]),
                    SizedBox(height: 32.h),
                    SizedBox(height: 20.h),
                  ]
                  .animate(interval: 50.ms)
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.1, end: 0, curve: Curves.easeOutQuad),
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8.h),
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 16.h),
              ListTile(
                title: Text(
                  t.settings.themeSystem,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: const Icon(Symbols.brightness_auto),
                trailing: currentMode == ThemeMode.system
                    ? Icon(Symbols.check, color: colorScheme.primary)
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
                title: Text(
                  t.settings.themeLight,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: const Icon(Symbols.light_mode),
                trailing: currentMode == ThemeMode.light
                    ? Icon(Symbols.check, color: colorScheme.primary)
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
                title: Text(
                  t.settings.themeDark,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: const Icon(Symbols.dark_mode),
                trailing: currentMode == ThemeMode.dark
                    ? Icon(Symbols.check, color: colorScheme.primary)
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
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  void _showSchemePicker(
    BuildContext context,
    WidgetRef ref,
    FlexScheme currentScheme,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    const List<FlexScheme> schemes = [
      FlexScheme.shadOrange,
      FlexScheme.shadGreen,
      FlexScheme.bahamaBlue,
      FlexScheme.damask,
    ];

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8.h),
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 16.h),
              ...schemes.map((scheme) {
                return ListTile(
                  title: Text(
                    _getSchemeName(scheme),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  leading: Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      color: _getSchemeColor(scheme),
                      shape: BoxShape.circle,
                    ),
                  ),
                  trailing: currentScheme == scheme
                      ? Icon(Symbols.check, color: colorScheme.primary)
                      : null,
                  onTap: () async {
                    await ref.read(themeProvider.notifier).setScheme(scheme);
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                );
              }),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Color _getSchemeColor(FlexScheme scheme) {
    if (scheme == FlexScheme.materialBaseline) {
      return Colors.deepPurple;
    }
    return FlexColor.schemes[scheme]?.light.primary ?? Colors.deepPurple;
  }

  String _getSchemeName(FlexScheme scheme) {
    switch (scheme) {
      case FlexScheme.shadOrange:
        return t.settings.schemes.shadOrange;
      case FlexScheme.shadGreen:
        return t.settings.schemes.shadGreen;
      case FlexScheme.bahamaBlue:
        return t.settings.schemes.bahamaBlue;
      case FlexScheme.damask:
        return t.settings.schemes.damask;
      default:
        return scheme.name;
    }
  }

  String _getLocaleName(AppLocale? locale) {
    if (locale == null) {
      return t.settings.themeSystem;
    }
    switch (locale) {
      case AppLocale.en:
        return t.settings.english;
      case AppLocale.zhCn:
        return t.settings.chinese;
      case AppLocale.zhTw:
        return t.settings.traditionalChinese;
    }
  }

  void _showLanguagePicker(
    BuildContext context,
    WidgetRef ref,
    AppLocale? currentLocale,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8.h),
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 16.h),
              ListTile(
                title: Text(
                  t.settings.themeSystem,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: const Icon(Symbols.smartphone),
                trailing: currentLocale == null
                    ? Icon(Symbols.check, color: colorScheme.primary)
                    : null,
                onTap: () async {
                  await ref.read(localeProvider.notifier).setLocale(null);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                title: Text(
                  t.settings.english,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: Text(
                  '🇺🇸',
                  style: TextStyle(fontSize: 24.sp),
                ), // 简单使用emoji
                trailing: currentLocale == AppLocale.en
                    ? Icon(Symbols.check, color: colorScheme.primary)
                    : null,
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
                title: Text(
                  t.settings.chinese,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: Text(
                  '🇨🇳',
                  style: TextStyle(fontSize: 24.sp),
                ), // 简单使用emoji
                trailing: currentLocale == AppLocale.zhCn
                    ? Icon(Symbols.check, color: colorScheme.primary)
                    : null,
                onTap: () async {
                  await ref
                      .read(localeProvider.notifier)
                      .setLocale(AppLocale.zhCn);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                title: Text(
                  t.settings.traditionalChinese,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: Text(
                  '🇭🇰',
                  style: TextStyle(fontSize: 24.sp),
                ), // 简单使用emoji
                trailing: currentLocale == AppLocale.zhTw
                    ? Icon(Symbols.check, color: colorScheme.primary)
                    : null,
                onTap: () async {
                  await ref
                      .read(localeProvider.notifier)
                      .setLocale(AppLocale.zhTw);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 8.h),
      child: Text(
        title,
        style: theme.textTheme.titleSmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, List<Widget> children) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingsItem({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
    bool showDivider = true,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16.r),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  Icon(icon, color: iconColor, size: 24.sp),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Text(
                      title,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ?trailing,
                ],
              ),
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            indent: 56.w,
            endIndent: 16.w,
            color: colorScheme.outlineVariant.withValues(alpha: 0.5),
          ),
      ],
    );
  }
}
