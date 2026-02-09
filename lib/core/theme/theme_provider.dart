import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunchbox/core/services/storage_service.dart';
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
    final schemeIndex = prefs.getInt(_schemeKey) ?? FlexScheme.shadGreen.index;

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

  ThemeData get lightTheme {
    return FlexThemeData.light(
      // Using FlexColorScheme built-in FlexScheme enum based colors
      scheme: state.scheme,
      // Component theme configurations for light mode.
      subThemesData: const FlexSubThemesData(
        interactionEffects: true,
        tintedDisabledControls: true,
        useM2StyleDividerInM3: true,
        inputDecoratorIsFilled: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        alignedDropdown: true,
        navigationRailUseIndicator: true,
      ),
      // Direct ThemeData properties.
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    );
  }

  ThemeData get darkTheme {
    return FlexThemeData.dark(
      // Using FlexColorScheme built-in FlexScheme enum based colors.
      scheme: state.scheme,
      // Component theme configurations for dark mode.
      subThemesData: const FlexSubThemesData(
        interactionEffects: true,
        tintedDisabledControls: true,
        blendOnColors: true,
        useM2StyleDividerInM3: true,
        inputDecoratorIsFilled: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        alignedDropdown: true,
        navigationRailUseIndicator: true,
      ),
      // Direct ThemeData properties.
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    );
  }
}

class ThemeState {
  const ThemeState({required this.mode, required this.scheme});

  final ThemeMode mode;
  final FlexScheme scheme;

  ThemeState copyWith({ThemeMode? mode, FlexScheme? scheme}) {
    return ThemeState(mode: mode ?? this.mode, scheme: scheme ?? this.scheme);
  }
}
