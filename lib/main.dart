import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/core/theme/theme.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';
import 'package:lunchbox/routes/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final prefs = await SharedPreferences.getInstance();

  // 初始化语言设置
  final savedLocale = prefs.getString('selected_locale');
  if (savedLocale != null) {
    await LocaleSettings.setLocaleRaw(savedLocale);
  } else {
    // 默认设置为中文
    await LocaleSettings.setLocale(AppLocale.zhCn);
  }

  // 主题设置由 themeProvider 在 build 时自动从 prefs 初始化
  // 不需要在此显式调用，因为 ProviderScope 已 override 了 sharedPreferencesProvider

  runApp(
    ProviderScope(
      observers: [
        TalkerRiverpodObserver(
          talker: LoggerUtils.instance,
          settings: const TalkerRiverpodLoggerSettings(
            printStateFullData: false,
            printProviderAdded: true,
            printProviderDisposed: true,
            printProviderFailed: true,
          ),
        ),
      ],
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: TranslationProvider(child: const MyApp()),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final themeNotifier = ref.watch(themeProvider.notifier);
    final themeState = ref.watch(themeProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ToastificationWrapper(
          child: MaterialApp.router(
            onGenerateTitle: (context) => t.common.appName,
            theme: themeNotifier.lightTheme,
            darkTheme: themeNotifier.darkTheme,
            themeMode: themeState.mode,
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          ),
        );
      },
    );
  }
}
