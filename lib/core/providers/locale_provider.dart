import 'package:flutter/material.dart';
import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_provider.g.dart';

@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  static const String _localeKey = 'selected_locale';

  @override
  AppLocale? build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final savedLocale = prefs.getString(_localeKey);

    if (savedLocale != null) {
      try {
        return AppLocaleUtils.parse(savedLocale);
      } catch (_) {
        return null;
      }
    }

    return null;
  }

  /// 更改应用语言并持久化
  Future<void> setLocale(AppLocale? locale) async {
    state = locale;
    final prefs = ref.read(sharedPreferencesProvider);

    if (locale != null) {
      await prefs.setString(_localeKey, locale.languageTag);
      await LocaleSettings.setLocale(locale);
    } else {
      await prefs.remove(_localeKey);

      // 跟随系统逻辑：中文环境使用中文，其他使用英文
      final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
      AppLocale targetLocale;

      if (systemLocale.languageCode == 'zh') {
        if (systemLocale.scriptCode == 'Hant' ||
            systemLocale.countryCode == 'TW' ||
            systemLocale.countryCode == 'HK' ||
            systemLocale.countryCode == 'MO') {
          targetLocale = AppLocale.zhTw;
        } else {
          targetLocale = AppLocale.zhCn;
        }
      } else {
        targetLocale = AppLocale.en;
      }

      await LocaleSettings.setLocale(targetLocale);
    }
  }

  /// 获取当前 Flutter Locale
  Locale get flutterLocale =>
      (state ?? LocaleSettings.currentLocale).flutterLocale;
}
