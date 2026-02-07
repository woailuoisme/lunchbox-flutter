import 'package:flutter/material.dart';
import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_provider.g.dart';

@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  static const String _localeKey = 'selected_locale';

  @override
  AppLocale build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final savedLocale = prefs.getString(_localeKey);

    if (savedLocale != null) {
      try {
        return AppLocaleUtils.parse(savedLocale);
      } catch (_) {
        return AppLocale.zhCn;
      }
    }

    // 默认返回中文
    return AppLocale.zhCn;
  }

  /// 更改应用语言并持久化
  Future<void> setLocale(AppLocale locale) async {
    state = locale;
    await ref
        .read(sharedPreferencesProvider)
        .setString(_localeKey, locale.languageCode);
    await LocaleSettings.setLocale(locale);
  }

  /// 获取当前 Flutter Locale
  Locale get flutterLocale => state.flutterLocale;
}
