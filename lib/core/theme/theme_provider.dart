import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/core/values/app_colors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  static const String _themeModeKey = 'theme_mode';
  static const String _schemeKey = 'theme_scheme';

  @override
  ThemeState build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final modeIndex = prefs.getInt(_themeModeKey) ?? ThemeMode.system.index;
    final schemeIndex =
        prefs.getInt(_schemeKey) ?? FlexScheme.materialBaseline.index;

    return ThemeState(
      mode: ThemeMode.values[modeIndex],
      scheme: FlexScheme.values[schemeIndex],
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = state.copyWith(mode: mode);
    await ref.read(sharedPreferencesProvider).setInt(_themeModeKey, mode.index);
  }

  Future<void> setScheme(FlexScheme scheme) async {
    state = state.copyWith(scheme: scheme);
    await ref.read(sharedPreferencesProvider).setInt(_schemeKey, scheme.index);
  }

  // 使用 AppColors 定义自定义配色方案
  FlexSchemeColor get _appSchemeColor => FlexSchemeColor(
    primary: AppColors.primary,
    primaryContainer: AppColors.primaryLight,
    secondary: AppColors.secondary,
    secondaryContainer: AppColors.secondary.withValues(alpha: 0.2),
    appBarColor: AppColors.surface,
    error: AppColors.error,
  );

  ThemeData get lightTheme => FlexThemeData.light(
    colors: _appSchemeColor, // 使用自定义颜色
    // scheme: state.scheme, // 如果想支持多套皮肤，可以在这里根据 state.scheme 切换
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      useMaterial3Typography: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    swapLegacyOnMaterial3: true,
  );

  ThemeData get darkTheme => FlexThemeData.dark(
    colors: _appSchemeColor, // 使用自定义颜色
    // scheme: state.scheme,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useMaterial3Typography: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    swapLegacyOnMaterial3: true,
  );
}

class ThemeState {
  const ThemeState({required this.mode, required this.scheme});

  final ThemeMode mode;
  final FlexScheme scheme;

  ThemeState copyWith({ThemeMode? mode, FlexScheme? scheme}) {
    return ThemeState(mode: mode ?? this.mode, scheme: scheme ?? this.scheme);
  }
}
